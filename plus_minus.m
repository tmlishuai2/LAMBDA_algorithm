function varargout= plus_minus( c, d, e )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

error(nargchk(2,4,nargin));
a=c+d;
b=c-d;
varargout={a,b};
end

