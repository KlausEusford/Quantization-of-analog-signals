function [z]=ulaw(y,u)
%		u-law nonlinearity for nonuniform PCM
%		X=ULAW(Y,U).
%		Y=input vector.

% todo:

z=(log(1+u*abs(y/max(abs(y))))./log(1+u)).*sign(y);
%y为归一化输入电压，x为归一化输入电压，u律压缩特性（u=255），表示压缩程度

end