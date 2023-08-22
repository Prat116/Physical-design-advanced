Table of Contents
Overview
Inception of Opensource EDA
How to Talk to computers?
SOC Design & OpenLANE
Components of opensource digital ASIC design
Simplified RTL2GDS Flow
OpenLANE ASIC Flow
Opensource EDA tools
OpenLANE design stages
OpenLANE Files
Invoking OpenLANE
Design Preparation Step
Review of files & Synthesis step
Floorplanning & Placement and library cells
Floorplanning considerations
Utilization Factor & Aspect Ratio
Pre-placed cells
Decoupling capacitors
Power Planning
Pin Placement
Floorplan run on OpenLANE & view in Magic
Placement
Placement Optimization
Placement run on OpenLANE & view in Magic
Standard Cell Design Flow
Standard Cell Characterization Flow
Timing Parameter Definitions
Design library cell
SPICE Deck creation & Simulation
CMOS inverter Switching Threshold Vm
16 Mask CMOS Fabrication
Inverter Standard cell Layout & SPICE extraction
Inverter Standard cell characterization
Magic Features & DRC rules
Timing Analysis & CTS
Create port definition
Standard Cell LEF generation
Integrating custom cell in OpenLANE
Post-synthesis timing analysis
Clock Tree Synthesis
Final steps in RTL2GDS
Power Distribution Network generation
Routing
GDSII
LEF
Design folder
Differences from older OpenLANE versions
Summary
VLSI NON INTERACTIVE OPENLANE FLOW
VLSI INTERACTIVE OPENLANE FLOW
Acknowledgements
Author
Table of Contents
Overview
Inception of Opensource EDA
How to Talk to computers?
SOC Design & OpenLANE
Components of opensource digital ASIC design
Simplified RTL2GDS Flow
OpenLANE ASIC Flow
Opensource EDA tools
OpenLANE design stages
OpenLANE Files
Invoking OpenLANE
Design Preparation Step
Review of files & Synthesis step
Floorplanning & Placement and library cells
Floorplanning considerations
Utilization Factor & Aspect Ratio
Pre-placed cells
Decoupling capacitors
Power Planning
Pin Placement
Floorplan run on OpenLANE & view in Magic
Placement
Placement Optimization
Placement run on OpenLANE & view in Magic
Standard Cell Design Flow
Standard Cell Characterization Flow
Timing Parameter Definitions
Design library cell
SPICE Deck creation & Simulation
CMOS inverter Switching Threshold Vm
16 Mask CMOS Fabrication
Inverter Standard cell Layout & SPICE extraction
Inverter Standard cell characterization
Magic Features & DRC rules
Timing Analysis & CTS
Create port definition
Standard Cell LEF generation
Integrating custom cell in OpenLANE
Post-synthesis timing analysis
Clock Tree Synthesis
Final steps in RTL2GDS
Power Distribution Network generation
Routing
GDSII
LEF
Design folder
Differences from older OpenLANE versions
Summary
VLSI NON INTERACTIVE OPENLANE FLOW
VLSI INTERACTIVE OPENLANE FLOW
Acknowledgements
Author
Overview
OpenLANE is an opensource tool or flow used for opensource tape-outs. The OpenLANE flow comprises a variety of tools such as Yosys, ABC, OpenSTA, Fault, OpenROAD app, Netgen and Magic which are used to harden chips and macros, i.e. generate final GDSII from the design RTL. The primary goal of OpenLANE is to produce clean GDSII with no human intervention. OpenLANE has been tuned to function for the Google-Skywater130 Opensource Process Design Kit.

Inception of Opensource EDA
How to talk to computers?
The RISC-V Instruction Set Architecture (ISA) is a language used to talk to computers whose hardware is based on RISC-V core. If a user wishes to run a certain application software on a computer, its corresponding C/C++/Java program must be converted into instructions by the compliler. The ouput of the compiler is hardware dependent. These instructions go as inputs to the assembler which outputs binary language that the hardware logic in the chip layout can make sense of. According to the bits received, the digital logic consisting of gates performs the function required by the user of the application software.

SoC Design & OpenLANE
Components of opensource digital ASIC design
The design of digital Application Specific Integrated Circuit (ASIC) requires three enablers or elements - Resistor Transistor Logic Intellectual Property (RTL IPs), Electronic Design Automation (EDA) Tools and Process Design Kit (PDK) data.

ASIC

Opensource RTL Designs: github, librecores, opencores
Opensource EDA tools: QFlow, OpenROAD, OpenLANE
Opensource PDK data: Google Skywater130 PDK
The ASIC flow objective is to convert RTL design to GDSII format used for final layout. The flow is essentially a software also known as automated PnR (Place & route
steps:
Synthesis: RTL Converted to gate level netlist using standard cell libraries (SCL)
Floor & Power Planning: Planning of silicon area to ensure robust power distribution
Placement: Placing cells on floorplan rows aligned with sites
Global Placement: for optimal position of cells
Detailed Placement: for legal positions
Routing: Valid patterns for wires
Signoff: Physical (DRC, LVS) and Timing verifications (STA)
From conception to product, the ASIC design flow is an iterative process that is not static for every design. The details of the flow may change depending on ECO’s, IP requirements, DFT insertion, and SDC constraints, however the base concepts still remain. The flow can be broken down into 11 steps:

Architectural Design – A system engineer will provide the VLSI engineer with specifications for the system that are determined through physical constraints. The VLSI engineer will be required to design a circuit that meets these constraints at a microarchitecture modeling level.

RTL Design/Behavioral Modeling – RTL design and behavioral modeling are performed with a hardware description language (HDL). EDA tools will use the HDL to perform mapping of higher-level components to the transistor level needed for physical implementation. HDL modeling is normally performed using either Verilog or VHDL. One of two design methods may be employed while creating the HDL of a microarchitecture:

a. RTL Design – Stands for Register Transfer Level. It provides an abstraction of the digital circuit using:

i. Combinational logic
ii. Registers
iii. Modules (IP’s or Soft Macros)
b. Behavioral Modeling – Allows the microarchitecture modeling to be performed with behavior-based modeling in HDL. This method bridges the gap between C and HDL allowing HDL design to be performed

RTL Verification - Behavioral verification of design

DFT Insertion - Design-for-Test Circuit Insertion

Logic Synthesis – Logic synthesis uses the RTL netlist to perform HDL technology mapping. The synthesis process is normally performed in two major steps:

GTECH Mapping – Consists of mapping the HDL netlist to generic gates what are used to perform logical optimization based on AIGERs and other topologies created from the generic mapped netlist.

Technology Mapping – Consists of mapping the post-optimized GTECH netlist to standard cells described in the PDK

Standard Cells – Standard cells are fixed height and a multiple of unit size width. This width is an integer multiple of the SITE size or the PR boundary. Each standard cell comes with SPICE, HDL, liberty, layout (detailed and abstract) files used by different tools at different stages in the RTL2GDS flow.

Post-Synthesis STA Analysis: Performs setup analysis on different path groups.

Floorplanning – Goal is to plan the silicon area and create a robust power distribution network (PDN) to power each of the individual components of the synthesized netlist. In addition, macro placement and blockages must be defined before placement occurs to ensure a legalized GDS file. In power planning we create the ring which is connected to the pads which brings power around the edges of the chip. We also include power straps to bring power to the middle of the chip using higher metal layers which reduces IR drop and electro-migration problem.

Placement – Place the standard cells on the floorplane rows, aligned with sites defined in the technology lef file. Placement is done in two steps: Global and Detailed. In Global placement tries to find optimal position for all cells but they may be overlapping and not aligned to rows, detailed placement takes the global placement and legalizes all of the placements trying to adhere to what the global placement wants.

CTS – Clock tree synteshsis is used to create the clock distribution network that is used to deliver the clock to all sequential elements. The main goal is to create a network with minimal skew across the chip. H-trees are a common network topology that is used to achieve this goal.

Routing – Implements the interconnect system between standard cells using the remaining available metal layers after CTS and PDN generation. The routing is performed on routing grids to ensure minimal DRC errors.

The Skywater 130nm PDK uses 6 metal layers to perform CTS, PDN generation, and interconnect routing.

Opensource EDA tools
OpenLANE utilises a variety of opensource tools in the execution of the ASIC flow:

Task	Tool/s
RTL Synthesis & Technology Mapping	yosys, abc
Floorplan & PDN	init_fp, ioPlacer, pdn and tapcell
Placement	RePLace, Resizer, OpenPhySyn & OpenDP
Static Timing Analysis	OpenSTA
Clock Tree Synthesis	TritonCTS
Routing	FastRoute and TritonRoute
SPEF Extraction	SPEF-Extractor
DRC Checks, GDSII Streaming out	Magic, Klayout
LVS check	Netgen
Circuit validity checker	CVC
OpenLANE design stages
Synthesis
yosys - Performs RTL synthesis
abc - Performs technology mapping
OpenSTA - Performs static timing analysis on the resulting netlist to generate timing reports
Floorplan and PDN
init_fp - Defines the core area for the macro as well as the rows (used for placement) and the tracks (used for routing)
ioplacer - Places the macro input and output ports
pdn - Generates the power distribution network
tapcell - Inserts welltap and decap cells in the floorplan
Placement
RePLace - Performs global placement
Resizer - Performs optional optimizations on the design
OpenDP - Perfroms detailed placement to legalize the globally placed components
CTS
TritonCTS - Synthesizes the clock distribution network (the clock tree)
Routing
FastRoute - Performs global routing to generate a guide file for the detailed router
CU-GR - Another option for performing global routing.
TritonRoute - Performs detailed routing
SPEF-Extractor - Performs SPEF extraction
GDSII Generation
Magic - Streams out the final GDSII layout file from the routed def
Klayout - Streams out the final GDSII layout file from the routed def as a back-up
Checks
Magic - Performs DRC Checks & Antenna Checks
Klayout - Performs DRC Checks
Netgen - Performs LVS Checks
CVC - Performs Circuit Validity Checks
OpenLANE Files
The openLANE file structure looks something like this type:
