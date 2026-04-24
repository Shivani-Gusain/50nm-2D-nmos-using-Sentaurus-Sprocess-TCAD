# Dimensions and region creation
line x location=0.0      spacing=0.5<nm>  tag=SiTop
line x location=25.0<nm> spacing=1<nm>
line x location=0.1<um>  spacing=5<nm>
line x location=0.3<um>  spacing=20<nm>   tag=SiBottom

line y location=0.0      spacing=5<nm>    tag=Mid
line y location=0.15<um> spacing=5<nm>    tag=Right

region Silicon xlo=SiTop xhi=SiBottom ylo=Mid yhi=Right

init concentration=1.0e15<cm-3> field=Phosphorus

AdvancedCalibration
pdbSet Grid NativeLayerThickness 1e-7
pdbSet Oxide Grid perp.add.dist 1e-7

#Pad oxide
diffuse temperature=800<C> time=15<min> O2
struct tdr=n@node@_NMOS1

# P-well implant 
implant Boron dose=5.0e13<cm-2> energy=120<keV>
implant Boron dose=2.0e13<cm-2> energy=40<keV>
implant Boron dose=1.0e13<cm-2> energy=15<keV>

# Drive-in
diffuse temperature=1050<C> time=10<min> N2
struct tdr=n@node@_NMOS2

grid set.min.normal.size=0.5<nm> set.normal.growth.ratio.2d=1.4
mgoals accuracy=1e-5
pdbSet Grid SnMesh UseLines 1

# Strip pad oxide
etch material=Oxide type=anisotropic time=1 rate=1

# Threshold adjust 
implant Boron dose=1.5e13<cm-2> energy=5<keV> tilt=0

# Gate oxide
diffuse temperature=800<C> time=1<min> O2
select z=1
layers
struct tdr=n@node@_NMOS3

# Poly gate
deposit material=PolySilicon type=anisotropic time=1 rate=0.1
implant Phosphorus dose=5e15<cm-2> energy=20<keV> tilt=0

mask name=gate_mask left=0<nm> right=25<nm>

etch material=PolySilicon type=anisotropic time=1 rate=0.15 \
     mask=gate_mask
etch material=Oxide type=anisotropic time=1 rate=0.05 \
     mask=gate_mask
struct tdr=n@node@_NMOS4

# Poly reoxidation
diffuse temperature=900<C> time=5<min> O2
struct tdr=n@node@_NMOS5

# LDD
refinebox Silicon min= {0.0 0.025} max= {0.05 0.12} \
    xrefine= {0.001 0.001 0.001} \
    yrefine= {0.002 0.002 0.002} add
grid remesh

implant Arsenic dose=5e14<cm-2> energy=8<keV> tilt=0
diffuse temperature=1050<C> time=0.05<s>
struct tdr=n@node@_NMOS6

# Halo
implant Boron dose=5e12<cm-2> energy=15<keV> tilt=30 rotation=0
implant Boron dose=5e12<cm-2> energy=15<keV> tilt=30 rotation=90
implant Boron dose=5e12<cm-2> energy=15<keV> tilt=30 rotation=180
implant Boron dose=5e12<cm-2> energy=15<keV> tilt=30 rotation=270

diffuse temperature=1050<C> time=2<s>
struct tdr=n@node@_NMOS7

# Spacer
deposit material=Nitride type=isotropic time=1 rate=0.06
etch material=Nitride type=anisotropic time=1 rate=0.06 \
     isotropic.overetch=0.01
etch material=Oxide type=anisotropic time=1 rate=0.01
struct tdr=n@node@_NMOS8

# S/D
refinebox Silicon min= {0.0 0.03} max= {0.06 0.14} \
    xrefine= {0.001 0.001 0.001} \
    yrefine= {0.005 0.005 0.005} add
grid remesh

implant Arsenic dose=1e16<cm-2> energy=15<keV> tilt=7 rotation=-90
diffuse temperature=1000<C> time=3<s>
struct tdr=n@node@_NMOS9

# Reflect
transform reflect left
struct tdr=n@node@_NMOS_beforecontacts

# Final mesh
refinebox name=inversion_layer \
    min= {-0.001 -0.03} max= {0.003 0.03} \
    xrefine=0.0002 yrefine=0.001 \
    materials= {Silicon}

refinebox name=SD_left \
    min= {0.0 -0.14} max= {0.03 -0.03} \
    xrefine=0.001 yrefine=0.002

refinebox name=SD_right \
    min= {0.0 0.03} max= {0.03 0.14} \
    xrefine=0.001 yrefine=0.002

grid remesh

# Contacts
contact clear
contact bottom name=substrate

contact name=Gate PolySilicon box \
    xlo=-0.08 xhi=-0.02 \
    ylo=-0.025 yhi=0.025

contact name=Source Silicon box \
    xlo=0.0  xhi=0.025 \
    ylo=-0.14 yhi=-0.04

contact name=Drain Silicon box \
    xlo=0.0  xhi=0.025 \
    ylo=0.04  yhi=0.14

contact list
struct tdr=n@node@_NMOS
exit
