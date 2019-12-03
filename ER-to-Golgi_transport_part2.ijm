/*
---------------------------------------------------------------------------------------------------
					ER-to-Golgi_transport_part2

	* facilitates the measurement of RUSH cargos from ER to Golgi
	* PART 2: measures area of Golgi objects at each frame
	* thresholding "Moments" optimized for Golgi objects
	* 
	* Future work will improve hard coded variables and will combine part1 with part2. 

Mehrshad Pakdel

mehrshad.pakdel@posteo.de
https://github.com/MehrshadPakdel

November 29, 2019
----------------------------------------------------------------------------------------------------
*/


run("Set Measurements...", "area stack redirect=None decimal=2");
originalImage = getTitle();
dir = getDirectory("image");
run("Duplicate...", "title=[dupImage] duplicate");
selectWindow("dupImage");
dupImg = getTitle();
close(originalImage);
		
selectWindow("dupImage");
rename("Golgi_objects");
	run("Subtract Background...", "rolling=60 stack");
run("Enhance Contrast...", "saturated=0 process_all");
run("Options...", "iterations=1 count=1 black do=Nothing");
run("8-bit");
run("Median...", "radius=1.0 stack");
run("Re-order Hyperstack ...", "channels=[Channels (c)] slices=[Frames (t)] frames=[Slices (z)]");	
			for (z=0; z<100; z++) {
	if (!is("binary")) {
		for (n=1; n<=nSlices; n++) {
			setSlice(n);
			run("Auto Threshold", "method=Moments white");
			run("8-bit");
		}
	}

if (isOpen("Threshold")) {
	selectWindow("Threshold");
	run("Close");
}	

run("Grays");
run("Fill Holes");
run("Analyze Particles...", "size=15-Infinity show=Outlines display add");

//selectWindow("Golgi_objects");
roiNo = roiManager("Count");
print(roiNo);
	for (i=0; i<roiNo; i++) {
		selectWindow("Golgi_objects");
		roiManager("select", i);		
		run("Measure");
	
	}

splitDir= dir + "/ResultsGolgi_" + originalImage + "/";
File.makeDirectory(splitDir);			
	selectWindow("Golgi_objects");
	saveAs("tiff", splitDir + "Golgi_objects_" + originalImage);	
	selectWindow("Drawing of Golgi_objects");
	saveAs("tiff", splitDir + "Detection_" + originalImage);
	selectWindow("Results");
	saveAs("Results", splitDir + "Results_" + originalImage + ".xls");
	roiManager("Save", splitDir + "ROIs_" + originalImage + ".zip");
	
