
fslmaths_command = "/share/apps/fsl/5.0.9/fsl/bin/fslmaths" % subsampling does not work for 4D images (i.e. EPI images) in version 6.0.5

prefix1='./haxby_dataset/output/'
for subi=1:6
    for runi=1:12
        prefix=[prefix1 sprintf('%.3d_%.3d/',subi,runi)];
        if exist(prefix)==7
            file='epi_STD.nii';

            dir([prefix file])

            copyfile([prefix file],[prefix 'epi2mm.nii']);

            input=[prefix 'epi2mm.nii'];
            display(input)

            for i=2:6
                input=['epi' num2str(2^(i-1)) 'mm.nii'];

                output=['epi' num2str(2^(i)) 'mm.nii'];
                if exist([prefix output ])
                    system(sprintf('rm %s%s',prefix,output));
                end
                
                command=sprintf('%s %s%s -subsamp2 %s%s',fslmaths_command,prefix,input,prefix,output);
                display(command)

                system(command);
                
                system(sprintf('gzip -d %s%s.gz',prefix,output));
                if exist([prefix output '.gz'])
                    system(sprintf('rm %s%s.gz',prefix,output));
                end
                %input=output;
            end
        else
            disp(['Directory ' prefix 'does not exist'])
        end
    end
end