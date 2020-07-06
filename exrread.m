%exrread
%
%	Read an EXR image.
%
% -Usage-
%	im = exrread(filename)
%	[im, mask] = exrread(filename)
%
% -Inputs-
%	filename	path to image
%
% -Outputs-
%	im		the image
%	mask		the alpha channel
%
% Last Modified: 07/06/2020
function [im,mask] = exrread(filename)

	% This file only exists for the help documentation
	% the MEX file will be called
	error('Compile exrread.cpp MEX function.');

end
