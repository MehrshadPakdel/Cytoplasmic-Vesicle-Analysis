# Cytoplasmic-Vesicle-Analysis
A FIJI / ImageJ macro to measure number of cytoplasmic vesicles in single stack microscopy images.

# Goal
The macro faciliates the quantification of cytoplasmic vesicles in single stack microscopy images. This macro is based on the [RUSH-Vesicle-Analysis](https://github.com/MehrshadPakdel/RUSH-Vesicle-Analysis) macro. Note, this macro is optimized for confocal images acquired by an 60x/1.4 oil objective. Change annotated functions in the code accordingly.

# Installation
Simply copy the macro file to your macro folder in your [Fiji](https://imagej.net/Fiji) directory and restart Fiji. You can access the macro from the Plugin section in Fiji.

# Usage
Acquire single stack images cells that express your reporter or are labeled with the probe of your interest. Start the macro and choose how many cells you want to analyze. Select your cell(s) by e.g. polygon or rectangular selection tools. A binary image is generated and the macro uses the particle analyzer of selected cell(s) and prints the number of delected vesicles to the log file. All processed images and log files will be saved in a results folder in the image directory.

# Citation
The macro will be uploaded and the citation will be updated as soon as the publication is released.
