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
%
mgz = 'ijoc';
%% ==================Set Working Directory ==================
% Get current folder
path0 = pwd;
% Set the path for the pdf that you want to read
% Recommend you to put all the pdf files in the folder "PDF files"
% For MAC
work_path = strcat(path0,'/PDF files/');
% Make new folder to save renamed PDF files
mkdir('Citation');
%
new_path = strcat(path0,'/Citation/');
%% ================= Get list of title ==============================
% Get pdf file list in work_path
pdf_file = dir(strcat(work_path,'*.pdf'));
% Preallocation
C= cell(length(pdf_file),2);
% nf is the # of file in pdf file list
for nf = 1:length(pdf_file)
    %% ================= Read PDF =========================
    file = pdf_file(nf).name;
    % add the java path for the iText java library.
    javaaddpath('iText-4.2.0-com.itextpdf.jar')
    % PDFREAD reads a PDF file using the iText java library.
    p = pdfRead(strcat(work_path,file));
    %% ================ Get the title of papers =======
    % Split string at specified delimite
    if strcmp(mgz,'misq')
        % For MISQ, delimite is 'Author(s): '
        temp1 = strsplit(p{1},'Author(s): ');
        % temporary title 
        t_title = temp1{1};
    elseif strcmp(mgz,'ijoc')
        % For IJOC, delimite is 'To cite this article:'
        temp1 = strsplit(p{1},'To cite this article:');
        %
        temp2 = strsplit(temp1{2},'INFORMS');
        %
        temp3 = strsplit(temp2{1},'(');
        %
        temp4 = strsplit(temp3{2},')');
        % temporary title 
        t_title = temp4{2};
    end
    %% =================== Get Citation # from Google Scholar ===========
    % cut the blank in the tail and trail
    t_title2 = strtrim(t_title);
    % replace \n with space
    title = regexprep(t_title2,'\s+',' ');
    %
    link = google2link(title,'scholar');
    nlink = strrep(link,' ','+');
    html = webread(nlink);
    % split the string html with 'Cited by '
    cell1 = strsplit(html,'Cited by ');
    % 
    cell2 = strsplit(cell1{2},'</a>');
    citation = cell2{1};%char
    %
    C{nf,1}=title;
    C{nf,2}=citation;
    % Rename PDF files
    copyfile(strcat(work_path,pdf_file(nf).name),...
        sprintf(strcat(new_path,'%s-',pdf_file(nf).name), citation));
end
%% =================== Open a file to save data ===============================

% For Windows
% COM server can only be used on Windows
%{
% You already created a xlsx file named 'citation.xlsx'
file_name = 'citation.xlsx';
% Create COM server
% Create a COM server running Microsoft Excel.
Excel = actxserver('excel.application');
% Make the Excel frame window visible (true) or invisible (false)
Excel.Visible = true;
%
WB = invoke(Excel.Workbook,'open',file_name);
%
SH = WB.Worksheets.Item(1);
%
SH.Range('A1').Value = 'Title';
SH.Range('B1').Value = 'Author';
SH.Range('C1').Value = 'Citation';
%}
%% =============
% For MAC
save(strcat('citation-',mgz,'.mat'),'C');
%% ============= Format
% For Windows
%{
% Make new folder
mkdir('NewFormat');
path2=strcat(work_path,'NewFormat\');
%
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

WB.SaveAs(strcat(path2,files_name));
WB.Close()
%
delete(strcat(work_path,files_name));
movefile(strcat(path2,file_name),strcat(work_path,file_name));
% Delete temporary folder
rmdir('NewFormat')
%}
%% =============
% If you want to import the data 
%{
data = importdata('citation.txt');
%}
%{
data: 
textdata:
colheaders: 
%}