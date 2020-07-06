# matlabexr

Compile
-------
1. Download and compile [zlib](https://zlib.net/)
  * Use CMake and be sure to build a static library
  * Set the CMAKE_INSTALL_PREFIX to some folder that you have permissions to write to
  * Compile then build the INSTALL project
  * Copy the installed zlib folder to C:\Program Files (x86) so that OpenEXR finds zlib automatically
1. Download and compile [openexr](https://github.com/AcademySoftwareFoundation/openexr)
  * Uncheck BUILD_SHARED



Compile from within MATLAB (syntax depends on platform):
```
mex exrread.cpp  -lIlmImf-2_5 -lIlmImfUtil-2_5 -lHalf-2_5 -lIex-2_5 -lIexMath-2_5 -lIlmThread-2_5 -lImath-2_5 -lzlibstatic -IC:\Users\kimo\Develop\ThirdParty\openexrstatic\include\OpenEXR -LC:\Users\kimo\Develop\ThirdParty\openexrstatic\lib -LC:\Users\kimo\Develop\Examples\OpenEXR\openexr-2.5.2\zlib\lib 
```


mex exrwrite.cpp -lIlmImf -IC:\Users\kimo\Develop\ThirdParty\openexr\include\OpenEXR -LC:\Users\kimo\Develop\ThirdParty\openexr\lib
mex exrinfo.cpp  -lIlmImf -IC:\Users\kimo\Develop\ThirdParty\openexr\include\OpenEXR -LC:\Users\kimo\Develop\ThirdParty\openexr\lib
 

If OpenEXR is installed in another location (such as /sw), try these commands:

mex exrread.cpp  -lIlmImf -lIex -lImath -lHalf -I/sw/include/OpenEXR -L/sw/lib
mex exrwrite.cpp -lIlmImf -lIex -lImath -lHalf -I/sw/include/OpenEXR -L/sw/lib
mex exrinfo.cpp  -lIlmImf -lIex -lImath -lHalf -I/sw/include/OpenEXR -L/sw/lib


Usage
-----

Read image
```
im = exrread(filename);
```


Read image and alpha channel
```
[im,mask] = exrread(filename);
```

Image can be 1 or 3 channels of floating-point data
Mask will be 1.0 if there is no alpha channel in the file

Write image
```
exrwrite(im,filename)
```

Write image with mask in alpha channel
```
exrwrite(im,mask,filename)
```

Image can be 1 or 3 channels
Mask must be 1 channel the same size as the image


Details
-------

Does not support EXR images with uint16 data or float data
All data is returned as MATLAB type double
Negative, NaN, or Inf values in Y are set to 0 by exrwrite
Negative, NaN, or Inf in RGB or alpha are preserved by exrwrite