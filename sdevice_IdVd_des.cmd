File {
    Grid=    "n@node@_NMOS_fps.tdr"
    Current= "nmos_IdVg"
    Plot=    "nmos_IdVg_plot"
    Parameter = "nmos.par"
    Output=  "nmos_IdVg_log"

}

Electrode {
    { Name="Source"    Voltage=0.0  }
    { Name="Drain"     Voltage=0.0 }
    { Name="Gate"      Voltage=0.0  WorkFunction=4.6}
    { Name="substrate" Voltage=0.0  }
}

Physics {
    Mobility( DopingDependence HighFieldSaturation Enormal )
    EffectiveIntrinsicDensity( OldSlotboom )
    Recombination( SRH Auger )
}


Plot {
    eDensity hDensity eCurrent hCurrent
    Potential SpaceCharge ElectricField
    eMobility hMobility eVelocity hVelocity
    Doping DonorConcentration AcceptorConcentration
   
}

Math {
    -CheckUndefinedModels
    Iterations=100
    Digits=4
    Method=Blocked
    SubMethod=ParDiSo
    NotDamped=30
    RhsFactor=1e20
    ErRef(electron)=1e8
    ErRef(hole)=1e8
    NumberOfThreads=4
}

Solve {
    Coupled(Iterations=200){ Poisson }

    Quasistationary(
        InitialStep=0.001 MinStep=1e-8 MaxStep=0.005
        Goal{ Name="Drain" Voltage=1.2 }
    ){ Coupled{ Poisson Electron Hole } }

    Quasistationary(
        InitialStep=0.005 MinStep=1e-7 MaxStep=0.05
        Increment=1.3 Decrement=2.0
        Goal{ Name="Gate" Voltage=1.2 }
    ){
        Coupled{ Poisson Electron Hole }
   
    }
}
