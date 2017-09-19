clear all
close all
%%
path0 = 'D:\GN Luo\VacancyUnable\';
path1 = strcat(path0,'Merged\Files\Table_1\');
files = dir(strcat(path1,'*.xlsx'));
cd(path1);
mkdir('New');
path2 = strcat(path1,'New\');

%%%%%
Excel = actxserver('excel.application');
% Create COM server
% Create a COM server running Microsoft Excel.
Excel.Visible = true;
% Make the Excel frame window visible.

%{
for k = 22:33
    WB = invoke(Excel.Workbook,'open',strcat(path1,files(k).name));
    SH = WB.Worksheets.Item(1);

    SH.Range('A3').Value = 'Industry Sector';
    SH.Range('B3').Value = 'Year';
    SH.Range('C3').Value = 'Month';
    SH.Range('D3').Value = 'Establishments';
    SH.Range('E3').Value = 'Male';
    SH.Range('F3').Value = 'Female';
    SH.Range('G3').Value = 'Total';
    SH.Range('H3').Value = 'Vacancies';
    
    for kk = 1:48
        Selection = sprintf('%s%d','A',kk);
        if strcmp(SH.Range(Selection).Value, 'Mining and quarrying')
            SH.Range(Selection).Value = '1';
        elseif strcmp(SH.Range(Selection).Value, 'Manufacturing')
            SH.Range(Selection).Value = '2';
        elseif strcmp(SH.Range(Selection).Value, 'Electricity and gas')
            SH.Range(Selection).Value = '3';
        elseif strcmp(SH.Range(Selection).Value,...
                'Construction sites (manual workers only)')
            SH.Range(Selection).Value = '4';
        elseif strcmp(SH.Range(Selection).Value,...
                'Wholesale, retail and import/export trades, restaurants and hotels')
            SH.Range(Selection).Value = '5';
        elseif strcmp(SH.Range(Selection).Value,...
                'Transport, storage and communications')
            SH.Range(Selection).Value = '6';
        elseif strcmp(SH.Range(Selection).Value,...
                'Financing, insurance, real estate and business services')
            SH.Range(Selection).Value = '7';
        elseif strcmp(SH.Range(Selection).Value,...
                'Community, social and personal services')
            SH.Range(Selection).Value = '8';
        elseif strcmp(SH.Range(Selection).Value,...
                'All above industry sectors')
            SH.Range(Selection).Value = '9';
        end
    end
    WB.SaveAs(strcat(path2,files(k).name));
    WB.Close()
end
%}

%{}
for k = 1:length(files)
    WB = invoke(Excel.Workbook,'open',strcat(path1,files(k).name));
    SH = WB.Worksheets.Item(1);

    SH.Range('A3').Value = 'Industry Sector';
    SH.Range('B3').Value = 'Year';
    SH.Range('C3').Value = 'Month';
    SH.Range('D3').Value = 'Establishments';
    SH.Range('E3').Value = 'Male';
    SH.Range('F3').Value = 'Female';
    SH.Range('G3').Value = 'Total';
    SH.Range('H3').Value = 'Vacancies';
    
    for kk = 4:78
        Selection = sprintf('%s%d','A',kk);
        if strcmp(SH.Range(Selection).Value,...
                'Section B : Mining and quarrying')
            SH.Range(Selection).Value = '1';
        elseif strcmp(SH.Range(Selection).Value,...
                'Section C : Manufacturing')
            SH.Range(Selection).Value = '2';
        elseif strcmp(SH.Range(Selection).Value,...
                'Sections D & E : Electricity, gas and waste management')
            SH.Range(Selection).Value = 'D&E';
        elseif strcmp(SH.Range(Selection).Value,...
                'Section F : Construction sites (manual workers only)')
            SH.Range(Selection).Value = '4';
        elseif strcmp(SH.Range(Selection).Value,...
                'Section G : Import/export, wholesale and retail trades')
            SH.Range(Selection).Value = 'G';
        elseif strcmp(SH.Range(Selection).Value,...
                'Part of Section G : Import/export trade and wholesale')
            SH.Range(Selection).Value = 'G1';
        elseif strcmp(SH.Range(Selection).Value,...
                'Part of Section G : Retail')
            SH.Range(Selection).Value = 'G2';
        elseif strcmp(SH.Range(Selection).Value,...
                'Section H : Transportation, storage, postal and courier services')
            SH.Range(Selection).Value = 'H';
        elseif strcmp(SH.Range(Selection).Value,...
                'Section I : Accommodation and food services')
            SH.Range(Selection).Value = 'I';
        elseif strcmp(SH.Range(Selection).Value,...
                'Section J : Information and communications')
            SH.Range(Selection).Value = 'J';
        elseif strcmp(SH.Range(Selection).Value,...
                'Section K : Financing and insurance')
            SH.Range(Selection).Value = 'K';
        elseif strcmp(SH.Range(Selection).Value,...
                'Section L : Real estate')
            SH.Range(Selection).Value = 'L';
        elseif strcmp(SH.Range(Selection).Value,...
                'Sections M & N : Professional and business services')
            SH.Range(Selection).Value = 'M&N';
        elseif strcmp(SH.Range(Selection).Value,...
                'Sections P - S : Social and personal services')
            SH.Range(Selection).Value = 'P-S';
        elseif strcmp(SH.Range(Selection).Value,...
                'Total of industry sections above')
            SH.Range(Selection).Value = '9';
        end
    end
    WB.SaveAs(strcat(path2,files(k).name));
    WB.Close()
end
%}
cd(path0)

Excel.Quit();
Excel.delete();
clear Excel;
clear WB;
clear SH;


