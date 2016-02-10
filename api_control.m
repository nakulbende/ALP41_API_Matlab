%%Use this as an example routine to run the DMD
%%Most of the steps are arranged in the order they are syupposed to be executed

%Comments/ correspondence should be addressed to
% *nakulbende [at] gmail [dot] com*

%% Define the library and header file to be loaded
dll_name = 'alp41basic';
dll_header = 'alpbasic';

%% Load library
[return_lib] = api_library(dll_name, dll_header);

%%Allocate the DMD device
[return_allocate, hdevice] = api_allocate(dll_name);
return_check(return_allocate)

%% Reset the DMD, See Pg.22 in documentation for details
reset_mode = 4; %For global
reset_address = 0; %For global
[return_reset] = api_reset(dll_name, hdevice, reset_mode, reset_address)
return_check(return_reset)

%% Clear the DMD
first_block = 0;
last_block = 15;
[return_clear] = api_clear(dll_name, hdevice, first_block, last_block);
return_check(return_clear)

%% Inqure information from the board, detials on query types in function file
query = 4; %for DMD serial
%query = 5; for DMD type - our's is type 4
[return_inquiry, return_query] = api_inquire(dll_name, hdevice, query);

%% Load image on the mirrors
first_row = 0;
last_row = 767;
[return_load] = api_load(dll_name, hdevice, image, first_row, last_row);
return_check(return_load)

%% Free the mirrors when done. Now you can switch it off
[return_free] = api_free(dll_name, hdevice);
return_check(return_free)
