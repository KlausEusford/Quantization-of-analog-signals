t=0:0.0001:2*pi;
y=cos(t);
n=input('量化级数=');
u=input('u参数=');
%量化电平数均为64
z1=u_pcm(y,n);          %均匀量化
z2=ula_pcm(y,n,u);   %u律非均匀量化PCM
plot(t,y,t,z1,'r',t,z2,'g');  %绘图