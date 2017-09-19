% Purpose: I have lots of academic papers and I want to know their citation
% # to make it easier to choose which one to read
% Method: Use MATLAB
%
%
% Version 1.0 by HU WEI
% 2017-09-18
% OS: Mac OS X EI Capitan
% MATLAB: R2014b
% Default Web Browser: Chrome Version 60.0.3112.113 (Official Build) (64-bit)
% Google Scholar Language: English
%
%
%%
clear; close all;
%% ==================Set Working Directory ==================
% Get current folder
path0 = pwd;
% Set the path for the pdf that you want to read
% Recommend you to put all the pdf files in the folder "PDF files"
% For MAC
work_path = strcat(path0,'/PDF files/');
%% =============== Make a new folder =======================
mkdir('Citation');
new_path = strcat(path0,'/Citation/');
%% ================= Get list of files ==============================
% Get pdf file list in work_path
files = dir(strcat(work_path,'*.pdf'));
% Loop through each
for id = 1:length(files)
    % Get the file name (minus the extension)
    [~, f] = fileparts(files(id).name);
      % Convert to number
      num = str2double(f);
      if ~isnan(num)
          % If numeric, rename
          movefile(files(id).name, sprintf('%03d.pdf', num));
      end
end