%% This script unzips the nii files that are compressed in gz format

prefix1='./ds105/'

res1=dir([prefix1 'sub*']);

for res1i=1:length(res1)
    prefix2=[prefix1 res1(res1i).name '/BOLD/']
    res2=dir([prefix2 'task001_run0*' ]);
    for res2i=1:length(res2)
       res3=dir([prefix2 res2(res2i).name '/*gz']);
       filename=[prefix2 res2(res2i).name '/' res3.name];
       cmd=['gzip -d ' filename]

       system(cmd);
    end  
end

