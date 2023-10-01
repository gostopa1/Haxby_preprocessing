tps=1:5;
mkdir('./data/IndividualSubjects/')
for mms_mat ={'32mm','16mm','8mm','4mm'}    
    mms = mms_mat{1}
    
    load(['data/Haxby_' mms '.mat'])

    D=mean(D(:,:,:,:,:,tps),6);

    nosubs = size(D,2);
    nocats = size(D,1);
    novox = size(D,5);
    nosamps = size(D,3)*size(D,4);
    for subi = 1:nosubs
        temp = permute(D(:,subi,:,:,:),[5 1 2 3 4]);
        temp = temp(:,:,:);
        x=permute(temp(:,:),[2 1]);

        categories=zeros(nocats,nosamps);
        categories_one_hot=zeros(nocats,nocats,nosamps);

        for category_i=1:nocats
            categories(category_i,:)=1*category_i;
            categories_one_hot(category_i,category_i,:)=1;
        end

        y = categories_one_hot(:,:);
        y=y';
        y_inds = categories(:);

        save(['data/IndividualSubjects/' mms '_sub' num2str(subi) '.mat'],'x','y','y_inds');
    end
end
