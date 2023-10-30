clear
addpath('../MATLAB_scripts/nifti/')

for mm_vec={'32mm','16mm','8mm','4mm'}

%for mm_vec={'8mm'}
    
    
    mms=mm_vec{1};
    mms
    mask=load_nii(['./masks/mask_' mms '.nii']);
    clear W x y z dist
    mask_inds=find(mask.img==1);
    [x,y,z]=ind2sub(size(mask.img),find(mask.img==1));
    dist=zeros(length(mask_inds),length(mask_inds));
    
    for i=1:length(mask_inds)
        i
        dist(i,:)=sqrt(((x(i)-x).^2)+((y(i)-y).^2)+((z(i)-z).^2));
    end
    for dist_thres=1:3
        %W=zeros(length(inds),length(inds));
        
                       
        W=1./dist;
        W(dist>=dist_thres)=0;
        W(isinf(W))=1;
                
        for i=1:length(mask_inds)
            %i
            temp=W(i,:);
            inds=find(temp>0);
            
            W(i,inds)=1/length(inds);
        end
        
        %imagesc(W)
        save(['distance' num2str(dist_thres) '_weights_' mms '.mat'],'W','-v7.3')
    end
end

%%
% nii = mask
% nii.img(:) = 0;
% nii.img(inds) = 1;
% view_nii(nii)