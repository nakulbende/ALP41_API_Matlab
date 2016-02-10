%%ALP Basic API, Written by Nakul Bende%%

%%%%api_library%%%%

% Loads a shared library and it's functions in MATLAB environment.

% INPUTS: (both without file extensions)
    % _dll_name_ = name of the dll file 
    % _dll_header_ = name of the header file
    
% OUTPUTS:
    % _return_lib_ = 'Library is loaded'; or 'Error: Library was not loaded' 
    % _Opens a list of functions available in library in a seperate window_

function [return_lib] = api_library(dll_name, dll_header)

dll = [dll_name, '.dll'];
head = [dll_header, '.h'];
if ~libisloaded(dll)
   loadlibrary(dll, head) %Load the alp41basic library (X64 bit)
end

return_lib = libisloaded(dll_name);
if return_lib == 1
    return_lib = 'Library is loaded';
    disp(return_lib)
else return_lib = 'Error: Library was not loaded';
    disp(return_lib)
end

libfunctionsview(dll_name)