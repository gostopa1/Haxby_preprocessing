
display('Press any key to start unpacking and preprocessing...')
pause

%Download repo for preprocessing. By default it asks for SSL certificate
%which we need to bypass in order to download via MATLAB system command
system('git -c http.sslVerify=false clone https://version.aalto.fi/gitlab/BML/bramila.git')
downloadHaxbyDataset % Download haxby dataset version 1.0.0

system('source unzip.sh')
%%
unzip_the_gz_BOLD_niis
transform_anatomical_binary_to_epi_dimensions
threshold_and_save_the_transformed_binary_masks
make_haxby_data_to_bramila_format
make_subjects_input_output_texts
preprocessing
%% If the preprocessing is done in parallel using SLURM, this will throw an error and has to be run after preprocessing is complete

subsample_and_epis
read_data_and_log_files
separateSubjectDataAverageTps % Splits the dataset to individual subjects, to allow for independent reading of subjects.