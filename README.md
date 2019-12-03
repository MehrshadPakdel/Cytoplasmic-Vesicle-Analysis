# ER-to-Golgi-Transport
A FIJI / ImageJ macros to measure transport of RUSH cargos from ER to Golgi by calculating normalized Golgi area over time. This analysis is a readout how quick cargo is trafficking through the secretory pathway.  

# Goal
Normalized Golgi area over time is calculated by the Golgi area at each frame of a movie divided by the ER area at frame1. Part1 of the macro will process images extract the ER object at frame1 and measure its size. Part2 of the macro will process images and extract Golgi objects and measure Golgi areas for each frame of the movie. Ratio of Golgi per frame / ER t=0 is calculated elsewhere to obtain normalized Golgi areas over time. 

Future work will improve hard coded variables and combine Part1 + Part2 and the normalization calculations.

# Installation
Simply copy the macro file to your macro folder in your [Fiji](https://imagej.net/Fiji) directory and restart Fiji. You can access the macro from the Plugin section in Fiji.

# Usage
Acquire multi-frame stack movies of cells expressing e.g. RUSH cargos that allow to follow their transport from ER to Golgi. Measure first the ER area at frame1 by selecting a manual threshold that covers the whole ER area. Next, measure Golgi areas for each frame of the movie. Note, that due to fragmented Golgis, the macro will count several Golgi objects per frame. These areas can be summed elsewhere.

# Citation
The citation will be updated as soon as the publication is released.
