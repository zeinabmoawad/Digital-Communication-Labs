%Encoding it Takes Level and return Amp
function [deq_val] = UniformDequantizer(q_ind,n_bits,x_max,m)
%q_ind:Quatization level 1-
%n_bits:no of bits
%x_max:max amp
%m: mode m=0 midrise m=1 midtread(0)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%No of levels
levels=2^n_bits;
%Step Size
step_size=(2*x_max)/levels;

deq_val=q_ind;%initailzation

%Calcuating min Level index :)
%2^../2=int :D
%midrise m=0
%min_level_index=-1*levels/2;%[-1 ,-2,-3,-4]

%midtrade m=1
%min_level_index=-1*levels/2+1;

min_level_index=-1*levels/2+1*m;

for i=1:length(q_ind)
    if(m==1)
        %midtrade
        deq_val(i)=step_size*(q_ind(i)+min_level_index);
    else
        %midrise
        deq_val(i)=step_size*(q_ind(i)+min_level_index+0.5);
    end
end
end