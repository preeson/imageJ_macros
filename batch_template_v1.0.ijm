// batch_template
// v1.0
// written by Dr Patrick Reeson, Brown Lab
// Division of Medical Sciences, University of Victoria

// This code is an empty template for running image analysis in ImageJ
// in batch. Assumes .tiff files in an analysis folder

// Select target folder
input = getDirectory("Choose a Directory "); 
// Name your output folder
output = input + File.separator + "output_folder_name";
File.makeDirectory(output);
//print(output);

processFolder(input);

// processFolder 
// Function loops through folder and any subfolder and on ant .tiff file runs 
// your custom function <processFile>.
// Note the custom function "processFile" is called within "processFolder"
// Args:
//		input (string): path to the folder
// Returns:
//		none
function processFolder(input) {
	list = getFileList(input);
	for (i=0; i < list.length; i++){
		if(File.isDirectory(input + list[i]))
			processFolder(""+input+list[i]);
		if(endsWith(list[i],".tif"))
			processFile(input, output, list[i]);
	}
}

// processFile
// This is the custom function you want to run in batch 
// Describe your function here
// Args:
//		input (string): path to the folder
//		output (string): path to save folder
//		file (string): filename to process
function processFile(input, output, file) {
	// Open file and get name 
	open(file);
	fileName = File.nameWithoutExtension;
	fileName = fileName +".tif";
	// Run your code here: ////////////////////////////////////////////////////// 
	
	/////////////////////////////////////////////////////////////////////////////
	// If desired save your image here 
	saveName = fileName + "_ADD_MODIFIER_HERE"; // Change the filename to not overwrite
	saveAs("Tiff", output + "/" + saveName +".tif");
	close();
	//print("Processing: " + input + file);
	//print("Saving to: " + output);
}

