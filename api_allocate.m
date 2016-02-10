%%ALP Basic API, Written by Nakul Bende%%

%%%%api_allocate%%%%

% Connects the device with MATLAB, and generates a device handle which will be used as an address for subsequent operations

% INPUTS: (both without file extensions)
    % _dll_name_ = name of the dll file
    
% OUTPUT:
    % _hdevice_ = device handle generated by allocate function

function [return_allocate, hdevice] = api_allocate(dll_name)

%%Allocate the DMD
deviceid = uint32(0);
hdevice = uint32(1);
hdeviceptr = libpointer('longPtr', hdevice); %make an outpointer to write
[return_allocate, hdevice] = calllib(dll_name, 'AlpbDevAlloc', deviceid, hdeviceptr);