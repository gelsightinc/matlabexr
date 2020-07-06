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
1. Edit paths at the top of ``compile.m`` and run within MATLAB




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
