function [im,mask] = exrread(filename)
%EXRREAD Reads a image in EXR format.
%   im = exrread(filename) reads an image from the file specified by
%   the string FILENAME.
%
%   [im, mask] = exrread(filename) reads an image from the file specified
%   by the string FILENAME and saves the alpha channel in the binary image
%   mask.
%
%

% Last Modified: 07/06/2020

	% This file only exists for the help documentation
	% the MEX file will be called
	error('Compile exrread.cpp MEX function.');

end

