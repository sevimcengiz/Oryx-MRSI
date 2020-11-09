function [data]=listread(rootname)

fread = fopen(rootname);
C = textscan(fread, '%s');
fclose(fread);
data=C{1,1};

end