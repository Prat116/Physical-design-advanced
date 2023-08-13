Day 1
Some Basic to Linux Command
ls -ltr
pwd
command_name --help
clear
OpenLANE Files
In open lane working directory there are three dir PDK a

skywater-pdk: contains PDK files provided by foundry
open_pdks: contains scripts to setup pdks for opensource tools
sky130A: contains sky130 pdk files 1-1 1-2
1-3 1-4 1-5 1-6

1-7

invoking open lane
Go to the openlane directory then floow the command as shown :

docker
./flow.tcl -interactive
1-8

Imprt package
package reuire openlane
1-9

Design floder
1-10 ![1-11](https://github.com/lsr20/PD_openlane/assets/141831819/aaca1bcc-10c5-470a-8 1-12 c3c-a80ffa13cdb5)

1-13

Design Setup
command : prep design picorv32a
1-15

1-16_merge lef created in runs

1-17

Run Synthesis
command : run_synthesis
1-19

Analyze the Synthesis report
Flop ratio

No of D flops =.
No of cells
1-20 1-21

new floder 1-21 1-22 1-23

DAY 2 Floor Plan and Introduction to library cells
1. Define width and height of cells
$ Utlisation factor = Area occupied by Netlist/ Total area of the core $
2. Define location of pre placed cells
Arragnement of IP'S in a chip is called as 
. These IP's/blocks have user defined locations , and hence are placed in a chip before automated placement and routing and are called as pre placed cells. Automated place and routing tools places the remaining logical cells in the design onto chip.

3. Decoupling Capacitor
4.Power Planning
5.Pin placement
Floorplanning with OpenLANE
To run floorplan in OpenLANE command :

run_floorplan

DEF lines showing the area of the die used

2-2

floor plan
command - magic -T /home/vsduser/Desktop/work/tools/openlane_working_dir/pdks/sky130A/libs.tech/magic/sky130A.tech lef read merged_unpadded.lef def picorv32a.floorplan.def &

2-3

#Placement The next step in the Digital ASIC design flow after floorplanning is placement. The synthesized netlist has been mapped to standard cells and floorplanning phase has determined the standard cells rows, enabling placement. OpenLANE does placement in two stages:

*Global Placement - Optimized but not legal placement. Optimization works to reduce wirelength by reducing half parameter wirelength *Detailed Placement - Legalizes placement of cells into standard cell rows while adhering to global placement

command : 

All the standard cells which are at the lower left corner during floorplan are now placed in Placement of standard cells happens in respectice rows.
2-4

Floorplan ensures - Decap, boundary of stnd. cells , tap cells, io cells are correctly placed
Placement ensures that Standard cells are correclty placed .
generally Power plan happens during Placement but in Openlane we do it post placemnt , post CTS j
