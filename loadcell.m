function z = loadcell (filename)

% LOADCELL reads an ascii file into a cell array, one line per element.
%          
% z = loadcell (filename);
%
% Note: anything after % in the file is not read.

if ~ischar(filename), 
  error (sprintf ('The first argument to READLINE must be a string (representing a file name)',filename));
elseif ~exist (filename)
  error (sprintf ('File %s not found',filename));
end;

z = textread (filename, '%s', 'commentstyle', 'matlab', 'headerlines',0, 'delimiter', '\n' );