function [a_quan]=u_pcm(a,n)
%U_PCM  	uniform PCM encoding of a sequence
%       	[A_QUAN]=U_PCM(A,N)
%       	a=input sequence.
%       	n=number of quantization levels (even).
%		a_quan=quantized output before encoding.

% todo:
%��������PCM

amax=max(abs(a));
a_quan=a/amax;   %��һ��
b_quan=a_quan;   
d=2/n;        %�������
q=d.*(0:n-1);
q=q-((n-1)/2)*d;   %������ƽ

%��������
for i=1:n   
    a_quan((q(i)-d/2 <= a_quan) & (a_quan <= q(i)+d/2))=...   %��λ��i�������������
        q(i).*ones(1,length(find((q(i)-d/2 <= a_quan) & (a_quan <= q(i)+d/2))));  %��ֵΪ��Ӧ��������ƽ  
    b_quan( a_quan==q(i) )=(i-1).*ones(1,length(find( a_quan==q(i) ))); 
end

a_quan=a_quan*amax; %�ָ�ԭֵ��������
nu=ceil(log2(n));   %����
code=zeros(length(a),nu); 
for i=1:length(a)   
    for j=nu:-1:0      %�Ӹ���ͱ���
        if ( fix(b_quan(i)/(2^j)) == 1)  
            code(i,(nu-j)) = 1;    
            b_quan(i) = b_quan(i) - 2^j;      
        end
    end
end
%�ò���ֵ���к�Ҫ���������ƽ�������룬�������������a_quan����������
end
