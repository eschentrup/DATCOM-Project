% loadDat loads the desired variables into the workspace
%
% Author: Evan Schentrup    11/15/2010

%% Read from .out file

% Read the .out file
outFile = fileread([projectName '.out']);

filt1 = 'ALPHA     CD       CL       CM       CN       CA       XCP        CLA          CMA          CYB          CNB          CLB';
filt2 = 'ZERO LIFT ANGLE OF ATTACK =';
filt3 = 'ZERO LIFT PITCHING MOMENT COEFFICIENT =';
filt4 = 'LIFT-CURVE-SLOPE =';

foundFilt1 = [];
foundFilt2 = [];
foundFilt3 = [];
foundFilt4 = [];
names = [];

for i = 1:length(outFile)-length(filt1)
    
    found1 = strcmp(outFile(i:(i+length(filt1)-1)),filt1);
    found2 = strcmp(outFile(i:(i+length(filt2)-1)),filt2);
    found3 = strcmp(outFile(i:(i+length(filt3)-1)),filt3);
    found4 = strcmp(outFile(i:(i+length(filt4)-1)),filt4);
    
    if found1
        foundFilt1=[foundFilt1,i];
    end
    
    if found2
        foundFilt2 = [foundFilt2,i];
    end
    
    if found3
        foundFilt3 = [foundFilt3,i];
    end
    
    if found4
        foundFilt4 = [foundFilt4,i];
    end
    
end

% Obtain zero lift angle of attack
found = 0;
begin = 0;
i = foundFilt2(1)+length(filt2);

while ~found
    
    if ~strcmp(outFile(i),' ') && begin == 0
        begin = i;
    end
    
    if strcmp(outFile(i),' ') && begin ~= 0
        ed = i;
        found = 1;
    end
    
    i = i+1;
    
end
        
alpha_zl = str2double(outFile(begin:ed));

% Obtain zero lift pitching moment coefficient
found = 0;
begin = 0;
i = foundFilt3(1)+length(filt3);

while ~found
    
    if ~strcmp(outFile(i),' ') && begin == 0
        begin = i;
    end
    
    if strcmp(outFile(i),' ') && begin ~= 0
        ed = i;
        found = 1;
    end
    
    i = i+1;
    
end

cm_0 = str2double(outFile(begin:ed));

% Find Cd, Cl, Cm, etc. info
altSkip = [247,236];
machSkip = [256,250];

CD = zeros(NALPHA,1);
CL = zeros(NALPHA,1);
CM = zeros(NALPHA,1);
CN = zeros(NALPHA,1);
CA = zeros(NALPHA,1);
XCP = zeros(NALPHA,1);

for i = 1:length(foundFilt1)
    
    mach = str2double(outFile((foundFilt1(i)-machSkip(1)):(foundFilt1(i)-machSkip(2))));
    alt = str2double(outFile((foundFilt1(i)-altSkip(1)):(foundFilt1(i)-altSkip(2))));
    Cd = 'CD';
    Cl = 'CL';
    Cm = 'CM';
    Cn = 'CN';
    Ca = 'CA';
    Xcp = 'XCP';
    A_zl = 'alpha_ZL';
    Cm_0 = 'CM_0';

    for j = 1:NALPHA
        
        if j == 1
            cdSkip = 131;
            clSkip = 140;
            cmSkip = 149;
            cnSkip = 158;
            caSkip = 167;
            xcpSkip = 176;
        else 
            cdSkip = 127 + cdSkip;
            clSkip = 127 + clSkip;
            cmSkip = 127 + cmSkip;
            cnSkip = 127 + cnSkip;
            caSkip = 127 + caSkip;
            xcpSkip = 127 + xcpSkip;
        end
        
        %outFile((foundFilt(i)+cdSkip):(foundFilt(i)+cdSkip)+9)
        CD(j,1) = str2double(outFile((foundFilt1(i)+cdSkip):(foundFilt1(i)+cdSkip)+9));
        CL(j,1) = str2double(outFile((foundFilt1(i)+clSkip):(foundFilt1(i)+clSkip)+9));
        CM(j,1) = str2double(outFile((foundFilt1(i)+cmSkip):(foundFilt1(i)+cmSkip)+9));
        CN(j,1) = str2double(outFile((foundFilt1(i)+cnSkip):(foundFilt1(i)+cnSkip)+9));
        CA(j,1) = str2double(outFile((foundFilt1(i)+caSkip):(foundFilt1(i)+caSkip)+9));
        XCP(j,1) = str2double(outFile((foundFilt1(i)+xcpSkip):(foundFilt1(i)+xcpSkip)+9));
        
    end
    
    mach = num2str(mach);
    alt = num2str(alt);
    
    for j = 1:length(mach)
        if strcmp(mach(j),'.')
            mach(j) = 'd';
        elseif strcmp(mach(j),' ')
            mach(j)=0;
        end
    end
    
    for j = 1:length(alt)
        if strcmp(alt(j),'.')
            alt(j) = 'd';
        elseif strcmp(alt(j),' ')
            alt(j)=0;
        end
    end
    
    if exist(['FC_M' mach '_ALT' alt])
        break
    end
    
    eval(['FC_M' mach '_ALT' alt ' = struct(Cd,CD,Cl,CL,Cm,CM,Cn,CN,Ca,CA,Xcp,XCP,A_zl,alpha_zl,Cm_0,cm_0);']);
    
    names = [ names, [' FC_M' mach '_ALT' alt]];
end


% %Leave only the saved data structures
% eval(['save OUTPUT.mat ' names])
% 
% delete('userInput.mat')
% 
% clear all; clc;
% 
% load OUTPUT.mat

%% Previous attempt to gather/save data
% skip = found1+128;
% 
% for i = 1:NALPHA
%     Cm(i) = str2double(outFile(skip:skip+10));
%     skip = skip + 127;
% end

% % Find and load mach, Cd, Cl, Cm
% machFilt = ' MACH=';
% cdFilt = '     CD      ';
% clFilt = '       CL    ';
% cmFilt = '       CM    ';
% cnFilt = '       CN    ';
% caFilt = '       CA    ';
% 
% foundMach = [];
% foundCd = [];
% foundCl = [];
% foundCm = [];
% 
% for i = 1:length(outFile)-13
%     
%     machFound = strcmp(outFile(i:(i+length(machFilt)-1)),machFilt);
%     cdFound = strcmp(outFile(i:(i+length(cdFilt)-1)),cdFilt);
%     clFound = strcmp(outFile(i:(i+length(clFilt)-1)),clFilt);
%     cmFound = strcmp(outFile(i:(i+length(cmFilt)-1)),cmFilt);    
%          
%     if machFound
%         foundMach = [foundMach,i];
%     end
%     
%     if cdFound
%         foundCd = [foundCd,i];
%     end
%     
%     if clFound
%         foundCl = [foundCl,i];
%     end
%     
%     if cmFound
%         foundCm = [foundCm,i];
%     end
%     
% end
% 
% found1 = foundMat(1);
% skip = found1+128;
% 
% for i = 1:NALT
%     Cm(i) = str2double(outFile(skip:skip+10));
%     skip = skip + 127;
% end

%% Load specified data from files generated from the execution of .dcm file

% %load keep.mat
% 
% csvFile = dir([projectName '.csv']);
% 
% dataStart = 'b5'; % start of desired data
% 
% % Load cd data
% cdLastRw = str2double(dataStart(2)) + NALPHA - 1;
% curRw = cdLastRw;
% cdEnd = [dataStart(1) num2str(cdLastRw)];
% cdrange = [dataStart ':' cdEnd];
% 
% Cd = xlsread(csvFile.name,projectName,cdrange);
% 
% % Load cl data
% clStartRw = curRw+3;
% clStart = [dataStart(1) num2str(clStartRw)];
% clLastRw = clStartRw + NALPHA - 1;
% curRw = clLastRw;
% clEnd = [dataStart(1) num2str(clLastRw)];
% clRange = [clStart ':' num2str(clEnd)];
% 
% Cl = xlsread(csvFile.name,projectName,clRange);
% 
% % Load cm data
% cmStartRw = curRw+3;
% cmStart = [dataStart(1) num2str(cmStartRw)];
% cmLastRw = cmStartRw + NALPHA - 1;
% curRw = cmLastRw;
% cmEnd = [dataStart(1) num2str(cmLastRw)];
% cmRange = [cmStart ':' num2str(cmEnd)];
% 
% Cm = xlsread(csvFile.name,projectName,cmRange);
% 
% % Load cyb
% cybStartRw = curRw+3;
% cybStart = [dataStart(1) num2str(cybStartRw)];
% cybLastRw = cybStartRw + NALPHA - 1;
% curRw = cybLastRw;
% cybEnd = [dataStart(1) num2str(cybLastRw)];
% cybRange = [cybStart ':' num2str(cybEnd)];
% 
% Cyb = xlsread(csvFile.name,projectName,cybRange);
% 
% % Load cnb
% cnbStartRw = curRw+3;
% cnbStart = [dataStart(1) num2str(cnbStartRw)];
% cnbLastRw = cnbStartRw + NALPHA - 1;
% curRw = cnbLastRw;
% cnbEnd = [dataStart(1) num2str(cnbLastRw)];
% cnbRange = [cnbStart ':' num2str(cnbEnd)];
% 
% Cnb = xlsread(csvFile.name,projectName,cnbRange);
% 
% % Load clb
% clbStartRw = curRw+3;
% clbStart = [dataStart(1) num2str(clbStartRw)];
% clbLastRw = clbStartRw + NALPHA - 1;
% curRw = clbLastRw;
% clbEnd = [dataStart(1) num2str(clbLastRw)];
% clbRange = [clbStart ':' num2str(clbEnd)];
% 
% Clb = xlsread(csvFile.name,projectName,clbRange);
% 
% % Load Epslon
% epStartRw = curRw+5+NALPHA;
% epStart = [dataStart(1) num2str(epStartRw)];
% epLastRw = epStartRw + NALPHA - 1;
% curRw=epLastRw;
% epEnd = [dataStart(1) num2str(epLastRw)];
% epRange = [epStart ':' num2str(epEnd)];
% 
% Ep = xlsread(csvFile.name,projectName,epRange);