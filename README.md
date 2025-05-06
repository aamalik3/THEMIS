# THEMIS
THEMIS: Time, Heterogeneity, and Energy Minded Scheduling for Fair Multi-Tenant Use in FPGAs


Welcome to the official repository for THEMIS, a novel scheduling policy for fair and energy-efficient multi-tenant scheduling on FPGAs.

This repository contains the full source code accompanying the paper:

THEMIS: Time, Heterogeneity, and Energy Minded Scheduling for Fair Multi-Tenant Use in FPGAs
by Emre Karabulut, Arsalan Ali Malik, Amro Awad, and Aydin Aysu

**Software**
 * Xilinx Vivado 2017.4
 * Xilinx SDK 2017.4

**🚀 About**

THEMIS (Time, Heterogeneity, and Energy Minded Scheduling) is a next-generation scheduling framework that ensures fair, energy-aware, and realistic multi-tenant use of cloud FPGAs.
Unlike prior works, THEMIS accounts for execution time, heterogeneous hardware regions, and energy trade-offs, offering significantly improved fairness and resource utilization.
Tested on a real Xilinx ZedBoard FPGA, THEMIS improves fairness by 24.2%–98.4% and enables an adjustable balance between energy efficiency and fairness — setting a new standard for secure and sustainable FPGA cloud services.

**✨ Features**
Time-Aware Scheduling:
Incorporates execution time estimates to promote fairness among tenants.

**Heterogeneity-Aware Mapping:**
Models and leverages the variations in hardware resources across FPGA regions.

**Energy-Aware Optimization:**
Allows tuning between fairness and energy efficiency based on system goals.

**Fair Multi-Tenant Resource Management:**
Ensures equitable sharing of FPGA resources even under adversarial or greedy workloads.

**Tested on Real Hardware:**
Evaluated on Xilinx ZedBoard, demonstrating 24.2%–98.4% fairness improvement over existing baselines.

**Lightweight and Practical:**
Designed for easy integration into real-world cloud FPGA deployments.

**📥 Setup Instructions**
Clone this repository:
```bash
git clone https://github.com/aamalik3/THEMIS.git
cd THEMIS-main
```


**📄 Citations**
If you find this work useful in your research, please cite it using the following BibTeX entry:

```bibtex
@ARTICLE{10985821,
author={Karabulut, Emre and Malik, Arsalan Ali and Awad, Amro and Aysu, Aydin},
journal={ IEEE Transactions on Computers },
title={{ THEMIS: Time, Heterogeneity, and Energy Minded Scheduling for Fair Multi-Tenant Use in FPGAs }},
year={2025},
volume={},
number={01},
ISSN={1557-9956},
pages={1-14},
keywords={Field programmable gate arrays;Resource management;Scheduling algorithms;Measurement;Job shop scheduling;Energy efficiency;Spatiotemporal phenomena;Hardware;Cloud computing;Dynamic scheduling},
doi={10.1109/TC.2025.3566874},
url = {https://doi.ieeecomputersociety.org/10.1109/TC.2025.3566874},
publisher={IEEE Computer Society},
address={Los Alamitos, CA, USA},
month=may}

```
MachSuite Benchmarks
```bibtex
@inproceedings{reagen2014machsuite,
  title={Machsuite: Benchmarks for accelerator design and customized architectures},
  author={Reagen, Brandon and Adolf, Robert and Shao, Yakun Sophia and Wei, Gu-Yeon and Brooks, David},
  booktitle={2014 IEEE International Symposium on Workload Characterization (IISWC)},
  pages={110--119},
  year={2014},
  organization={IEEE}
}
```



**🛡️ License**
This project is licensed under the MIT License.
Use, modification, and distribution are permitted, provided that proper credit is given to the original authors. 
The code is provided "as is," without warranty of any kind, express or implied. Use at your own risk.

**🚫 Contributions**
 * Emre Karabulut
 * Arsalan Malik
 * Amro Awad
 * Aydin Aysu
   
At this time, external contributions to this repository are not being accepted.
Please feel free to use, modify, and cite the code as needed, but pull requests and feature requests will not be merged.
