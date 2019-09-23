function [a_quan]=ula_pcm(a,n,mu)
%ULA_PCM 	u-law PCM encoding of a sequence
%       	[A_QUAN]=MULA_PCM(X,N,U).
%       	X=input sequence.
%       	n=number of quantization levels (even).     	
%		a_quan=quantized output before encoding.
%       U the parameter of the u-law

% todo:
maximum=max(abs(a));
y=ulaw(a,mu);
y_q=u_pcm(y,n); 
a_quan=inv_ulaw(y_q,mu);
a_quan=maximum*a_quan; 
%非均匀量化PCM 
end
