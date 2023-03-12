%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%midrise m=0%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1.Quantizer
%par:(in_val, n_bits, x_max, m)
%m: mode m=0 midrise, m=1 midtread(0)
in_val=[-2,-1.9,-1.5,-1,0,0.5,1,1.5,1.9,2];
q_ind=UniformQuantizer(in_val, 2, 2, 0);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%2.Dequantizer
%parm:(q_ind,n_bits,x_max,m)
%m: mode m=0 midrise, m=1 midtread(0)
deq_val=UniformDequantizer(q_ind,2,2,0);
disp("midrise");
disp(in_val);
disp(q_ind);
disp(deq_val);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%midtread m=1%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1.Quantizer
%par:(in_val, n_bits, x_max, m)
%m: mode m=0 midrise, m=1 midtread(0)
in_val=[-2,-1.9,-1.5,-1,0,0.5,1,1.5,1.9,2];
q_ind=UniformQuantizer(in_val, 2, 2, 1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%2.Dequantizer
%parm:(q_ind,n_bits,x_max,m)
%m: mode m=0 midrise, m=1 midtread(0)
deq_val=UniformDequantizer(q_ind,2,2,1);
disp("midtread");
disp(in_val);
disp(q_ind);
disp(deq_val);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%3.Test the quantizer/dequantizer functions on a deterministic input
%Ramp
t = (-6:0.01:6);
unitstep = t>=0;
ramp = t.*unitstep;
n_bits= 3;
x_max = 6;

% Quantization [midrise]
q_ind=UniformQuantizer(ramp,n_bits, x_max,0);

% Dequantization [midrise]
deq_val=UniformDequantizer(q_ind,n_bits, x_max, 0);

%Plot
figure(1);

subplot(3,1,1);
plot(t,ramp);
title("Ramp");
xlabel('t');
ylabel('x(t)');

subplot(3,1,2);
plot(t,deq_val);
title("midrise");
xlabel('input');
ylabel('output');

% Quantization [midtread]
q_ind=UniformQuantizer(ramp,n_bits, x_max,1);

% Dequantization [midtread]
deq_val=UniformDequantizer(q_ind,n_bits, x_max, 1);

subplot(3,1,3);
plot(t,deq_val);
title("midtread");
xlabel('input');
ylabel('output');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Requirement(4)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%4.Test your input on a random input signal 
random=unifrnd(-5,5,10000);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n_bits=2:1:8;
SNR=2:1:8;%initalization
% On the same plot. sketch the simulation and the theoretical SNR (in dB) 
% on the vertical axis vs n_bits on the horizontal axis.
for i=1:length(n_bits)
    SNR(i) = SNRfunc(random,n_bits(i),5,0);
end
%Sketch (Convert to DB)
%%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %5.Test the uniform quantizer on a non-uniform random input
% 
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %6.quantize the the non-uniform signal using a non-uniform 𝝁 law quantizer
% 
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%