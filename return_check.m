%%ALP Basic API, Written by Nakul Bende%%

%%%%return_check%%%%

% Check the return from other functions - Check documentation (Pg. 9)
    
% INPUTS:
    % _return_value_ = Return for success/ error reporting
        
% OUTPUT:
    % _out_signal_ = Return for success/ error reporting

function [out_signal] = return_check(return_value);

switch return_value
    case 0
        out_signal = 'The operation was a success';
    case 1
        out_signal = 'The operation was a success, output truncated';
    case hex2dec('080000001')
        out_signal = 'No free ALP device found';
    case hex2dec('080000002')
        out_signal = 'ALP already in use';    
    case hex2dec('080000003')
        out_signal = 'Device initialization failed';
    case hex2dec('080000004')
        out_signal = 'Device initialization failed_Toggle reset switch'; 
    case hex2dec('080000005')
        out_signal = 'Invalid device handle';
    case hex2dec('080000006')
        out_signal = 'Device disconnected, Free the handle';    
    case hex2dec('080000007')
        out_signal = 'Device error; Free, and Re-allocate the device';       
    case hex2dec('080000008')
        out_signal = 'Multi-thread; another function running';    
    case hex2dec('080000009')
        out_signal = 'Halted, use device control to resume';
    case hex2dec('08000000A')
        out_signal = 'Memory can not be accessed';    
    case hex2dec('08000000B')
        out_signal = 'Insufficient internal memory';    
    case hex2dec('08000000C')
        out_signal = 'Argument had invalid inputs';    
    case hex2dec('08000000D')
        out_signal = 'Missing USB Dongle';  
    case hex2dec('08000000E')
        out_signal = 'API Missing';  
    case hex2dec('08000000F')
        out_signal = 'API not supported';          
    otherwise
        disp(return_value)
end

disp(out_signal)