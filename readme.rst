Raspberry Pi Hat Board Outlines
===============================

This repository contains two OpenSCAD models that are useful for importing into your PCB program to make designing Raspberry Pi Hats easy.

The two OpenSCAD programs have been exported to DXF files for easy importing into EDA programs such as KiCAD.

``pcb_outlines`` - Contains the outline of a Hat PCB that can be used for edge cuts. It includes cutouts for the display and camera flex connectors. It was designed from the measurements given at: https://github.com/raspberrypi/hats

``connector_location`` - Is a separate model that just includes the outline of the 40 pin connector in the correct location. It should be imported separately into an EDA program.

Both models have been translated so that the center of the board would be at origin.

To import into KiCad with a version that has DXF import capabilities simply import ``pcb_outlines`` as the edge cuts and ``connector_location`` as the front silk screen.
