disp("Downloading dataset...");
url = 'https://s3.amazonaws.com/openneuro/ds000105/ds000105_R1.0.1/compressed/ds105_raw.tgz';
filename = 'ds105_raw.tgz';
websave(filename, url);
disp("Download complete!");