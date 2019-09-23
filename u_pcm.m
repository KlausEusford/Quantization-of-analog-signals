function [a_quan]=u_pcm(a,n)
%U_PCM  	uniform PCM encoding of a sequence
%       	[A_QUAN]=U_PCM(A,N)
%       	a=input sequence.
%       	n=number of quantization levels (even).
%		a_quan=quantized output before encoding.

% todo:
%均匀量化PCM

amax=max(abs(a));
a_quan=a/amax;   %归一化
b_quan=a_quan;   
d=2/n;        %量化间隔
q=d.*(0:n-1);
q=q-((n-1)/2)*d;   %量化电平

%进行量化
for i=1:n   
    a_quan((q(i)-d/2 <= a_quan) & (a_quan <= q(i)+d/2))=...   %定位第i个量化间隔码子
        q(i).*ones(1,length(find((q(i)-d/2 <= a_quan) & (a_quan <= q(i)+d/2))));  %赋值为相应的量化电平  
    b_quan( a_quan==q(i) )=(i-1).*ones(1,length(find( a_quan==q(i) ))); 
end

a_quan=a_quan*amax; %恢复原值（量化后）
nu=ceil(log2(n));   %编码
code=zeros(length(a),nu); 
for i=1:length(a)   
    for j=nu:-1:0      %从高向低编码
        if ( fix(b_quan(i)/(2^j)) == 1)  
            code(i,(nu-j)) = 1;    
            b_quan(i) = b_quan(i) - 2^j;      
        end
    end
end
%用采样值序列和要求的量化电平数作输入，求得已量化序列a_quan，编码序列
end
