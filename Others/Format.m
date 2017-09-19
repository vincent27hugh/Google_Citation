clear all;
close all;
%%
Excel = actxserver('excel.application');
% Create COM server
% Create a COM server running Microsoft Excel.
Excel.Visible = true;
% Make the Excel frame window visible.

path0= 'D:\GN Luo\Employment\';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% get the folders name
files = dir(path0);
% Get all files & folders in current folders
dirflags = [files.isdir];
% Extract folders
subFolder = files(dirflags);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for k = 3:length(subFolder)-3
    fprintf('Now we are in Subfolder #%d = %s\n', k, subFolder(k).name);
    path1 = strcat(path0,subFolder(k).name,'\');
    cd(path1)
    mkdir('NewFormat');
    path2=strcat(path1,'NewFormat\');

    files = dir(strcat(path1,'**.xls'));
    % Get all files in the current folder that contait the word 'Page'

    % Print folder names to command window
    for kk = 1: length(files)
        fprintf('Files #%d = %s\n', kk, files(kk).name);
    end

    N_st_file = 1; N_fi_file = length(files);
    % # of the folders in the subFolder list that we want to manipulate with
    for j = N_st_file:N_fi_file
        WB = invoke(Excel.Workbook,'open', ...
            strcat(path1,files(j).name));
        SH = WB.Worksheets.Item(1);

        Selection='A1:BZ200';
        SH.Range(Selection).HorizontalAlignment=3;
        SH.Range(Selection).Columns.AutoFit;

        SH.Range(Selection).ColumnWidth=30;
        SH.Range(Selection).WrapText = true;
        SH.Range(Selection).Font.Size = 11;
        SH.Range(Selection).MergeCells = false;
        SH.Range(Selection).Horizontal = 3;
        SH.Range(Selection).Vertical = 2;
        SH.Range(Selection).Font.Bold = false;
        % not bold
        SH.Range(Selection).Font.Name = 'Times New Roman';

        SH.Range(Selection).Border.Linestyle = 0;

        SH.Range(Selection).Rows.AutoFit;
        SH.Range(Selection).Columns.AutoFit;

        WB.SaveAs(strcat(path2,files(j).name));
        WB.Close()

        delete(strcat(path1,files(j).name));
        movefile(strcat(path2,files(j).name),strcat(path1,files(j).name));
    end
    rmdir('NewFormat')
end


cd(path0)

Excel.Quit();
Excel.delete();
clear Excel;
clear WB;
clear SH;
