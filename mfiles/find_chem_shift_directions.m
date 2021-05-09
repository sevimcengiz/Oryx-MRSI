%% This code sets the chemical shift directions given the phase encoding direction and the gradient directions
%for the multivoxel 1H-MRSI, and is modified from the Philips sequence code.
% The current version of the code only calculates the directions for transverse slice orientation.
% 3D scan mode.
% Author: Dr. Esin Ozturk Isik, Bogazici University, 2021

function chem_shift_directions=  find_chem_shift_directions(RFOV_dir, chem_shift_dir_AP, chem_shift_dir_RL, chem_shift_dir_FH)
%Default directions=[1,1,1]

chem_shift_directions= [1,1,1];

if isequal(chem_shift_dir_FH,'H')
    chem_shift_directions(3)=-1;
end

if isequal(chem_shift_dir_RL,'R')
    if isequal(RFOV_dir, 'RL')
        chem_shift_directions(2)=-1;
    else
        chem_shift_directions(1)=-1;
    end
end

if isequal(chem_shift_dir_AP,'P')
    if isequal(RFOV_dir, 'RL')
        chem_shift_directions(1)=-1;
    end
elseif isequal(RFOV_dir, 'AP')
    chem_shift_directions(2)=-1;
end   

chem_shift_directions(2)=(-1)*chem_shift_directions(2); %added for direction adjustment



