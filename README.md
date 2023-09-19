# Haxby_preprocessing
Scripts to download and preprocess the [Haxby dataset (ds105) from OpenfMRI](https://openfmri.org/dataset/ds000105/).

The script `sequency_of_scripts` performs all the steps:
* download the dataset and unzip it
* download bramila toolbox
* reformat and preprocess epi files
* load and format data in convenient form for classification

The scripts use the following software
* The [bramila toolbox](https://version.aalto.fi/gitlab/BML/bramila) for preprocessing fMRI data 
* [MATLAB NIfTI toolbox](https://se.mathworks.com/matlabcentral/fileexchange/8797-tools-for-nifti-and-analyze-image) for handling .nii files with MATLAB
* [FSL 5.0.9](https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FSL) (not included)