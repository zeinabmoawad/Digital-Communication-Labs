function [SNR] = SNRfunc(input,n_bits,x_max,m)

%Quantizer
%par:(in_val, n_bits, x_max, m)
q_ind=UniformQuantizer(input,n_bits,x_max,m);
%DeQuantizer
%parm:(q_ind,n_bits,x_max,m)
deq_val=UniformDequantizer(q_ind,n_bits,x_max,m);

%Qaunatization error
quantization_error=sum(abs(random-deq_val));

%SNR
SNR=mean(input.^2)/quantization_error^2;
end