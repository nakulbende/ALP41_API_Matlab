%%ALP Basic API, Written by Nakul Bende%%

%%%%api_inquire%%%%

% Sends a query to the device, and stores the value in an out pointer. The query types can be (found in documentation):

% inquiry = imread('Inquiries.png');
% image(inquiry)

% Table.1 Queries to be used in alp_inquiry, alp_control

% INPUTS:
    % _dll_name_ = Loaded control library 
    % _hdevice_ = device handle generated by allocate function 
    % _query_ = Query type: Pg 6, returns in Pg. 7, Pg. 16, Pg. 17

% Common query commands (Pg. 16), non-exhaustive, please refer to
% documentation

    % 0: Timeout
    % 1: dll Version, driver version
    % 2. Halt, firmware date
    % 3. Configuration date
    % 4. Device serial
    % 5. DMD Type (return values in Pg 7)
    % 6. Hardware version
    % 7. Chipset version
    % 8. DIP switches
    % 9. DDC Signals
    
% OUTPUT:
    % _return_queryptr_ = C style pointer with the readout from device/ controlled about the specific query. Data type depends on the query, and can be found out by using the command get(_return_queryptr_)

function [return_inquiry, return_query] = api_inquire(dll_name, hdevice, query)

query = int32(query);
return_query = int32(0);
return_queryptr = libpointer('int32Ptr', return_query);
[return_inquiry, return_query] = calllib(dll_name, 'AlpbDevInquire', hdevice, query , return_queryptr);