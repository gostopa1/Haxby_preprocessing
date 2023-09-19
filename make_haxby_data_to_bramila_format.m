

destination='haxby_dataset/'
mkdir(destination)
prefix1='ds105/'

mkdir([destination 'output/'])
res1=dir([prefix1 'su*'])

for res1i=1:length(res1)
    prefix2=[prefix1 res1(res1i).name '/BOLD/'];
    res2=dir([prefix2 '/task*']);
    for res2i=1:length(res2)
        mkdir([destination res1(res1i).name(4:6) '_' sprintf('%.3d',res2i)])
        mkdir([destination 'output/' res1(res1i).name(4:6) '_' sprintf('%.3d',res2i)])
        copyfile([prefix2 res2(res2i).name '/bold.nii'],[destination res1(res1i).name(4:6) '_' sprintf('%.3d',res2i) '/epi.nii'])
        prefix3=[prefix1 res1(res1i).name  '/anatomy/'];
        copyfile([prefix3 'highres001_brain.nii.gz'],[destination res1(res1i).name(4:6) '_' sprintf('%.3d',res2i) '/bet.nii.gz']);
        system(['gzip -d -f ' destination res1(res1i).name(4:6) '_' sprintf('%.3d',res2i) '/bet.nii.gz']);
    end

end