function compile()

    %% UPDATE THESE PATHS
    zlibpath = 'zlib\lib';
    exrpath  = 'openexrstatic\';

    checkpaths(zlibpath, exrpath);


    % Static libraries
    libs = {'IlmImf-2_5', 'IlmImfUtil-2_5', 'Half-2_5', ...
            'Iex-2_5', 'IexMath-2_5', 'IlmThread-2_5', ...
            'Imath-2_5','zlibstatic'};

    cppfiles = {'exrread.cpp', 'exrwrite.cpp', 'exrinfo.cpp'};



    % library commands
    for i = 1 : numel(libs)
        libcmd{i} = sprintf('-l%s ',libs{i});
    end
    libs = cat(2, libcmd{:});

    % Include path
    exrincpath = fullfile(exrpath, 'include', 'OpenEXR');
    ipath = sprintf('-I%s ', exrincpath);

    % Library paths
    exrlibpath = fullfile(exrpath, 'lib');
    lpath = sprintf('-L%s -L%s ',exrlibpath,zlibpath);


    for i = 1 : numel(cppfiles)
        mcmd = sprintf('mex %s %s %s %s',cppfiles{i},libs,ipath,lpath);
        fprintf('Compiling %s...',cppfiles{i});
        [status,cmdout] = system(mcmd);
        if status == 0
            fprintf('Done\n');
        else
            fprintf('Error %s\n',cmdout);
        end
    end

end

%
% Test that the paths exist
%
function checkpaths(zlibpath, exrpath)

    if ~exist(zlibpath, 'dir')
        error('cannot find zlib path %s',zlibpath);
    end

    if ~exist(exrpath, 'dir')
        error('cannot find OpenEXR path %s',exrpath);
    end

    exrincpath = fullfile(exrpath, 'include', 'OpenEXR');
    if ~exist(exrincpath, 'dir')
        error('cannot find OpenEXR include path %s',exrincpath);
    end

    exrlibpath = fullfile(exrpath, 'lib');
    if ~exist(exrlibpath, 'dir')
        error('cannot find OpenEXR lib path %s',exrlibpath);
    end

end
