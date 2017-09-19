# Read me about Google_citation.m 

## Purpose

There is one course which require us to do research on the method and theory of some specific period of time. And we need to read all of the papers issued on the top journals in the target period. After briefly browsing, I found that I need to read about 100 papers which seems to be impossible to be done in just two weeks. Then I would like to know the current citation numbers of these bunch of papers, which can make it easier to choose which one is more worth to read. Then I did some work on MATLAB.

## Basic info

1. Version: 1.0 
2. Copyright: HU WEI
3. Date: 2017-09-18
5. Method: Use MATLAB
6. Environment:
* OS: Mac OS X EI Capitan
* MATLAB: R2014b
* Default Web Browser: Chrome Version 60.0.3112.113 (Official Build) (64-bit)
* Google Scholar Language: English

## Acknowledge

1. `google2link.m` is built on the basis of Fahad Al Mahmood's work 'google.m', please refer to [google by Fahad Al Mahmood on File Exchange](https://www.mathworks.com/matlabcentral/fileexchange/6535-google)
2. About `pdfRead.m`, I should totally give credit to Derek Wood. Please refer to [Read text from a PDF document by Derek Wood|File Exchange](https://www.mathworks.com/matlabcentral/fileexchange/63615-read-text-from-a-pdf-document)

## Prerequisites：

1. Make a new folder named `PDF files` and move the PDF files that you want to search for their academic catations in this folder.
2. Make sure that your network is open;
3. This `google_citation.m` can only recognize 3 journals paper:
* Management Information System Quarterly
* INFORMS Journal of Computing
* Information System Research

## Usage：

1. Run main.m file and you will get:

* `citation.mat` data file which stores the title and ciataion # of the 
* `Ciatation` folder which stores the renamed PDF files in the format as `Citation #-Old name.pdf`;

2. If you want to load the data `citation.mat` file to check the data, you can turn to `import_demo.m` as reference;

## Others

1. Sometimes the google scholar need you to verify that you are not robot. Just like the error as follow:

    The server returned the message: "Service Unavailable" for URL,
    'http://scholar.google.com/scholar?q=Setup+and+Open-Stacks+Minimization+in+One-Dimensional+Stock+Cutting.'
    (with HTTP response code 503).

The `HTTP response code 503` means that:

>The server is currently unable to handle the request due to a temporary overload or scheduled maintenance, which will likely be alleviated after some delay.

You may need to try again later.


 
