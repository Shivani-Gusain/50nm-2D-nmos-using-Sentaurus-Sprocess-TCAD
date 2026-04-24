# 50nm-2D-nmos-using-Sentaurus-Sprocess-TCAD
This repository contains the sprocess_fps.cmd file containing commands to build a 2D 50nm nmos, along with the sdevice files to simulate and visualise id_vd and id_vg plots and parameter file defining the permittivity(epsilon) of various materials

## Repository Structure
├── sprocess_fps.cmd          &emsp; -- Process simulation (device fabrication steps)

├── sdevice_IdVg_des.cmd      &emsp;-- Transfer characteristics (ID-VG))

├── sdevice_IdVd_des.cmd      &emsp; -- Output characteristics (ID-VD)

├── nmos.par                  &emsp;&emsp; -- Material parameters (permittivity definitions)

└── outputs/                  &emsp;&emsp; -- Simulation results (plots)


## Process Flow
<img width="1024" height="1536" alt="image" src="https://github.com/user-attachments/assets/fffe998d-5035-4fe9-aaa2-ca57777e9119" />


## Results
Vth = 0.344 V
Idsat = 9.14 × 10⁻⁴ A
