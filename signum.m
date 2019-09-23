function y= signum(x)
y=x;
y(x>0)=ones(size(find(x>0))); 
y(x<0)=-ones(size(find(x<0))); 
y(x==0)=zeros(size(find(x==0)));
%Sgnº¯Êý
%   x>0,sgnx=1
%   x=0,sgnx=0
%   x<0,sgnx=-1