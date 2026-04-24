File {
    Grid= "n@node@_NMOS_fps.tdr"
    Current= "nmos_IdVd"
    Plot= "nmos_IdVd_plot"
    Parameter = "nmos.par"
    Output= "nmos_IdVd_log"

    # Vg = 0.6 V
    Quasistationary(
        InitialStep=0.01 MinStep=1e-6 MaxStep=0.05
        Goal{ Name="Gate" Voltage=0.6 }
    ){ Coupled{ Poisson Electron Hole } }

    Quasistationary(
        InitialStep=0.005 MinStep=1e-7 MaxStep=0.02
        Increment=1.3 Decrement=2.0
        Goal{ Name="Drain" Voltage=1.2 }
    ){ Coupled{ Poisson Electron Hole } }

    # Reset Drain back to 0
    Quasistationary(
        InitialStep=0.01 MinStep=1e-6 MaxStep=0.05
        Goal{ Name="Drain" Voltage=0.0 }
    ){ Coupled{ Poisson Electron Hole } }

    # Vg = 0.8 V
    Quasistationary(
        InitialStep=0.01 MinStep=1e-6 MaxStep=0.05
        Goal{ Name="Gate" Voltage=0.8 }
    ){ Coupled{ Poisson Electron Hole } }

    Quasistationary(
        InitialStep=0.005 MinStep=1e-7 MaxStep=0.02
        Increment=1.3 Decrement=2.0
        Goal{ Name="Drain" Voltage=1.2 }
    ){ Coupled{ Poisson Electron Hole } }

    # Reset Drain back to 0
    Quasistationary(
        InitialStep=0.01 MinStep=1e-6 MaxStep=0.05
        Goal{ Name="Drain" Voltage=0.0 }
    ){ Coupled{ Poisson Electron Hole } }

    # Vg = 1.0 V
    Quasistationary(
        InitialStep=0.01 MinStep=1e-6 MaxStep=0.05
        Goal{ Name="Gate" Voltage=1.0 }
    ){ Coupled{ Poisson Electron Hole } }

    Quasistationary(
        InitialStep=0.005 MinStep=1e-7 MaxStep=0.02
        Increment=1.3 Decrement=2.0
        Goal{ Name="Drain" Voltage=1.2 }
    ){ Coupled{ Poisson Electron Hole } }

    # Reset Drain back to 0
    Quasistationary(
        InitialStep=0.01 MinStep=1e-6 MaxStep=0.05
        Goal{ Name="Drain" Voltage=0.0 }
    ){ Coupled{ Poisson Electron Hole } }

    # Vg = 1.2 V
    Quasistationary(
        InitialStep=0.01 MinStep=1e-6 MaxStep=0.05
        Goal{ Name="Gate" Voltage=1.2 }
    ){ Coupled{ Poisson Electron Hole } }

    Quasistationary(
        InitialStep=0.005 MinStep=1e-7 MaxStep=0.02
        Increment=1.3 Decrement=2.0
        Goal{ Name="Drain" Voltage=1.2 }
    ){ Coupled{ Poisson Electron Hole } }
}
