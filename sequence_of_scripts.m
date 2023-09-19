
display('Press any key to start unpacking and preprocessing...')
pause
system('git clone https://version.aalto.fi/gitlab/BML/bramila.git')
downloadHaxbyDataset
system('source unzip.sh')
unzip_the_gz_BOLD_niis
transform_anatomical_binary_to_epi_dimensions
threshold_and_save_the_transformed_binary_masks
make_haxby_data_to_bramila_format
make_subjects_input_output_texts
preprocessing
%%
subsample_and_epis
read_data_and_log_files
separateSubjectDataAverageTps % Splits the dataset to individual subjects, to allow for independent reading of subjects.