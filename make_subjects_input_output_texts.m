
%% Make subject input output texts

current_folder=pwd;
destination='haxby_dataset/';

prefix=[ current_folder '/' destination];

res=dir([prefix '/0*']);
delete subs_input.txt
fid=fopen('subs_input.txt','w');
for i=1:length(res)
    a{i}=sprintf( '%s/',res(i).name);
    display([prefix a{i}])
    %fprintf(fid,'''%s%s''\n',prefix,a{i});
    fprintf(fid,'%s%s\n',prefix,a{i});
end
fclose(fid);

delete subs_output.txt
fid=fopen('subs_output.txt','w');
for i=1:length(res)
    a{i}=sprintf( '%s/',res(i).name);
    display([prefix 'output/' a{i}])
        fprintf(fid,'%soutput/%s\n',prefix,a{i});

end
fclose(fid);




