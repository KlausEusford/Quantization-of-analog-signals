t=0:0.0001:2*pi;
y=cos(t);
n=input('��������=');
u=input('u����=');
%������ƽ����Ϊ64
z1=u_pcm(y,n);          %��������
z2=ula_pcm(y,n,u);   %u�ɷǾ�������PCM
plot(t,y,t,z1,'r',t,z2,'g');  %��ͼ