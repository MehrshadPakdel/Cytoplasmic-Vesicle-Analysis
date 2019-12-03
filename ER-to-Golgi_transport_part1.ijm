/*
---------------------------------------------------------------------------------------------------
					ER-to-Golgi_transport_part1

	* facilitates the measurement of RUSH cargos transported from ER to Golgi
	* PART1: measures area of ER object at frame 1
	* manual thresholding required to extract ER object
	* 
	* Future work will improve hard coded variables and will combine part1 with part2 

Mehrshad Pakdel

mehrshad.pakdel@posteo.de
https://github.com/MehrshadPakdel

November 29, 2019
----------------------------------------------------------------------------------------------------
*/
 
run("Set Measurements...", "area add redirect=None decimal=2");
originalImage = getTitle();
dir = getDirectory("image");
run("Duplicate...", "title=[dupImage] duplicate");
selectWindow("dupImage");
dupImg = getTitle();
close(originalImage);
run("Duplicate...", "duplicate range=1-1");
	selectWindow("dupImage-1");
	rename("ER_frame1");
	imageFrame1 = getTitle();
	//run("Options...", "iterations=1 count=1 black do=Nothing");
	//run("Subtract Background...", "rolling=80 stack");
	run("Enhance Contrast...", "saturated=0 process_all");
	run("Median...", "radius=5 stack");
	run("8-bit");
	run("Threshold...");
	waitForUser("Please select and apply a threshold.\nThen press OK to continue the macro.");
	selectWindow("Threshold");
	run("Close");
	run("Fill Holes");
	run("Analyze Particles...", "size=50-Infinity show=Outlines add");
		roiNo = roiManager("Count");
			for (j=0; j<roiNo; j++) {
			selectWindow("ER_frame1");
			roiManager("select", j);
			run("Measure");
			setObject = "ER" + (j+1);
			setResult("Object Type", j, setObject);
			}
splitDir= dir + "/ResultsER_" + originalImage + "/";
File.makeDirectory(splitDir);			
selectWindow("ER_frame1");
	saveAs("tiff", splitDir + "ER_frame1_" + originalImage);	
	saveAs("Results", splitDir + "Results_" + originalImage + ".xls");
	roiManager("Save", splitDir + "ROIs_" + originalImage + ".zip");
