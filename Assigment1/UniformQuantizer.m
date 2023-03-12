%Returns Level index to which values are quantized :D [0,levels-1]
function [q_ind] = UniformQuantizer(in_val, n_bits, x_max, m)
%in_val:input signal samples :D
%x_max :in_val is ranged from -x_max to x_max
% n_bits: no of bits for the quantized value
% m: mode m=0 midrise m=1 midtread(0)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%No of levels
levels=2^n_bits;
%Step Size
step_size=(2*x_max)/levels;

q_ind=in_val;%initailzation

%Calcuating max & min Levels index :)
%2^../2=int :D
%midrise m=0
%max_level_index=levels/2-1; %[0,levels/2-1] ex 0-3
%min_level_index=-1*levels/2;%[-1 ,-2,-3,-4]

%midtrade m=1
%max_level_index=levels/2;
%min_level_index=-1*levels/2+1;

max_level_index=levels/2-1*(1-m);
min_level_index=-1*levels/2+1*m;


for i=1:length(in_val)
    if(m==1)
        %midtread
        level_index=floor((in_val(i)/step_size)+0.5);
    else
        %midrise
        level_index=floor(in_val(i)/step_size);
    end
    %Clippering the ouput <3
    if(level_index>max_level_index)
        level_index=max_level_index;
    elseif(level_index<min_level_index)
        level_index=min_level_index;
    end
    q_ind(i)=level_index-min_level_index;
end
end