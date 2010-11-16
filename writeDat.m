% writeDat Writes user input data and geometrical data obtained from a 3D
% model to a DATCOM .dcm file and executes it.  This is to be exectued
% after write variables have been defined through userInpus.m
%
% Author: Evan Schentrup    11/1/2010


%% User Input and Default Input Values
clc
clear all

% Load input data from GUI
load userInput.mat

% Hardcoded input values
STMACH = 0.6;
TSMACH = 1.4;
TR=1.0;

% % Name given to files created
% projectName = 'citationEx';

% Set command cards (.dcm header)
commCards = [ DIM '\n' DERIV '\n' ];    % Command cards

if exist('DAMP','var')
    commCards = [commCards DAMP '\n'];
end

if exist('TRIM','var')
    commCards = [commCards TRIM '\n'];
end

commCards = [commCards 'DUMP ALL\nPART\nDUMP IOM\n'];

% Obtain number of alt, mach and angle of attack inputs
NALT=length(ALT);
NMACH=length(MACH);
NALPHA=length(ALSCHD);

%% Define input values retrieved from model

%OPTINS
SREF=320.8;
CBARR=6.75;
BLREF=51.7;
ROUGFC=0.25E-3;

%SYNTHS 
XCG=21.9; 
ZCG=3.125;
XW=19.1;
ZW=3.125;
ALIW=2.5;
XH=39.2;
ZH=7.75;
ALIH=0.0;
XV=36.0;
ZV=6.0;
XVF=18.0;
ZVF=5.3;
SCALE=1.0;
VERTUP='TRUE';

%BODY
body = true;
X = [0.0,1.0,2.7,6.0,8.8,28.5,39.4,44.8];
R=[0.0,1.25,2.1,2.7,2.76,2.7,1.25,0.0];
ZU=[3.5,4.3,4.8,5.5,7.4,7.4,6.5,5.7];
ZL=[3.5,2.5,2.25,2.1,2.0,2.2,4.3,5.7];
NX=length(X);
BNOSE=1.0;
BLN=8.8;
BTAIL=1.0; 
BLA=19.7;
ITYPE=1.0;
METHOD=1.0;

%WGPLNF
wing = true;
CHRDR=9.4;
CHRDTP=3.01;
SSPN=25.85;
SSPNE=23.46;
SAVSI=1.3;
CHSTAT=0.25;
TWISTA=-3.0;
DHDADI=3.6;
TYPE=1.0;

nacaWing = true;
nacaWingCode = '23014';
nacaWingSeries = length(nacaWingCode);

%GRNDEF 
grndef = false;
NGH=10.0;
GRDHT=[5.0,10.0,15.0,20.0,25.0,30.0,40.0,50.0,60.0,77.55];

%SAVE
saveFlag1 = 1;

%SYMFLP
flaps = true;
FTYPEF=2.0;
NDELTAF=9.0;
DELTAF=[0.0,5.0,10.0,15.0,20.0,25.0,30.0,35.0,40.0];
PHETEF=0.0522;
PHETEPF=0.0391;
CHRDFIF=2.0;
CHRDFOF=1.6;
SPANFIF=5.78;
SPANFOF=15.3;
CPRMEIF=[8.1,8.1,8.2,8.2,8.3,8.3,8.3,8.4,8.4];
CPRMEOF=[3.7,3.7,3.8,3.8,3.9,3.9,3.9,4.0,4.0];
NTYPEF=1.0;                   

%CASEID
CASEID = 'FLAPS: Citation II Model 550 Aircraft';
nextCase = 'NEXT CASE';

%ASYFLP
ailerons = true;
STYPEA=4.0;
NDELTAA=9.0;
DELTALA =[-32.0,-20.0,-10.0,-5.0,0.0,5.0,10.0,20.0,32.0];
DELTARA=[32.0,20.0,10.0,5.0,0.0,-5.0,-10.0,-20.0,-32.0];
SPANFIA=15.2; 
SPANFOA=24.0;
PHETEA=0.05228;
CHRDFIA=1.87; 
CHRDFOA=1.2;

%CASEID 
CASEID = 'AILERONS: Citation II Model 550 Aircraft';

%SAVE
saveFlag2 = 1;
nextCase = 'NEXT CASE';

nacaHT = true;
nacaHTCode = '0010';
nacaHTSeries = length(nacaHTCode);

%HTPLNF
horzTail = true;
CHRDRHT=4.99;
CHRDTPHT=2.48;
SSPNHT=9.42;
SSPNEHT=9.21;
SAVSIHT=5.32;
CHSTATHT=0.25;
TWISTAHT=0.0;
DHDADIHT=9.2;
TYPEHT=1.0;

%VTPLNF
vertTail = true;
CHRDTPVT=3.63;
SSPNEVT=8.85;
SSPNVT=9.42;
CHRDRVT=8.3;
SAVSIVT=32.3;
CHSTATVT=0.25; 
TYPEVT=1.0;

nacaVT = true;
nacaVTCode = '0012';
nacaVTSeries = length(nacaHTCode);

%VFPLNF 
vertFin = true;
CHRDRVF=19.3; 
CHRDTPVF=0.0;
CHSTATVF=0.0;
DHDADOVF=0.0; 
SAVSIVF=80.0;
SSPNVF=21.3;
SSPNEVF=21.3;
TYPEVF=1.0;

nacaVF = true;
nacaVFCode = '0012';
nacaVFSeries = length(nacaHTCode);

%SYMFLP
elevator = true;
FTYPEE=1.0;
NDELTAE=9.0;
DELTAE=[-20.0,-15.0,-10.0,-5.0,0.0,5.0,10.0,13.0,16.0];
PHETEE=0.0522; 
PHETEPE=0.0523;
CHRDFIE=1.94;
CHRDFOE=1.03;
SPANFIE=0.7;
SPANFOE=9.21;
CBE=0.84;
TCE=0.3; 
NTYPEE=1.0;

%JETPWR
jetPwr = true;
NENGSJ=2.0;
AIETLJ=2.0;
THSTCJ=0.0;
JIALOC=25.8;
JELLOC=4.33;
JEVLOC=5.625;
JEALOC=33.3;
JINLTA=2.243;
AMBTMP=59.7;
AMBSTP=2116.8;
JERAD=0.755;

%% Begin writing inputs to DATCOM input file

% Create the .dcm using project name as specified by user. This is a
% "create and discard" file open operation 
FID = fopen([projectName '.dcm'],'w+');

% Write command cards to file
fprintf(FID,[commCards '\n']);

% Write FLTCON information to file
fprintf(FID,['\n $FLTCON WT=%1.1f, LOOP=%1.1f,\n'...
    '         NMACH=%1.1f, MACH(1)='],WT,LOOP,NMACH);
for i = 1:NMACH
    fprintf(FID,' %1.1f,',MACH(i));
    if (mod(i,10) == 0 && i ~= NMACH)
        fprintf(FID,'\n            ');
    end
end
fprintf(FID,'\n         NALT=%1.1f, ALT(1)=',NALT);
for i = 1:NALT
    fprintf(FID,' %1.1f,',ALT(i));
    if (mod(i,10) == 0 && i ~= NALT)
        fprintf(FID,'\n            ');
    end
end
fprintf(FID,'\n         NALPHA=%1.1f,\n         ALSCHD(1)=',NALPHA);
for i = 1:NALPHA
    fprintf(FID,' %1.1f,',ALSCHD(i));
    if (mod(i,10) == 0 && i ~= NALPHA)
        fprintf(FID,'\n            ');
    end
end
fprintf(FID,'\n         STMACH=%1.1f, TSMACH=%1.1f, TR=%1.1f$\n'...
    ,STMACH,TSMACH,TR);

% Write OPTINS information to file
fprintf(FID, ['\n $OPTINS SREF=%1.1f, CBARR=%1.1f, BLREF=%1.1f, ROUGFC='...
    '%1.1E$\n'],SREF,CBARR,BLREF,ROUGFC);

% Write SYNTHS information to file
fprintf(FID, ['\n $SYNTHS XCG=%1.1f, ZCG=%1.3f,\n         XW=%1.1f, '...
    'ZW=%1.3f, ALIW=%1.1f,\n         XH=%1.1f, ZH=%1.1f, ALIH=%1.1f, '...
    '\n         XV=%1.1f, ZV=%1.1f,\n         XVF=%1.1f, ZVF=%1.1f,'...
    '\n         SCALE=%1.1f, VERTUP=.' VERTUP '.$\n'],XCG,ZCG,XW,ZW,...
    ALIW,XH,ZH,ALIH,XV,ZV,XVF,ZVF,SCALE);

% Write BODY information to file if body exists.
if body
    fprintf(FID,'\n $BODY NX=%1.1f,\n       X(1)=',NX);
    for i = 1:NX
        fprintf(FID,'%1.1f,',X(i));
        if (mod(i,10) == 0 && i ~= NX)
            fprintf(FID,'\n            ');
        end
    end
    fprintf(FID,'\n       R(1)=');
    for i = 1:NX
        fprintf(FID,'%1.1f,',R(i));
        if (mod(i,10) == 0 && i ~= NX)
            fprintf(FID,'\n            ');
        end
    end
    fprintf(FID,'\n       ZU(1)=');
    for i = 1:NX
        fprintf(FID,'%1.1f,',ZU(i));
        if (mod(i,10) == 0 && i ~= NX)
            fprintf(FID,'\n            ');
        end
    end
    fprintf(FID,'\n       ZL(1)=');
    for i = 1:NX
        fprintf(FID,'%1.1f,',ZL(i));
        if (mod(i,10) == 0 && i ~= NX)
            fprintf(FID,'\n            ');
        end
    end
    fprintf(FID,['\n       BNOSE=%1.1f, BLN=%1.1f,\n       BTAIL=%1.1f, '...
        'BLA=%1.1f,\n       ITYPE=%1.1f, METHOD=%1.1f$\n'],BNOSE,BLN,...
        BTAIL,BLA,ITYPE,METHOD);
end

% Write WGPLNF information to file if wing exists.
if wing
    fprintf(FID,['\n $WGPLNF CHRDR=%1.1f, CHRDTP=%1.1f,\n         SSPN='...
        '%1.2f, SSPNE=%1.1f,\n         SAVSI=%1.1f,\n         '...
        'CHSTAT=%1.1f, TWISTA=%1.1f,\n         DHDADI=%1.1f,'...
        '\n         TYPE=%1.1f$\n'],CHRDR,CHRDTP,SSPN,SSPNE,SAVSI,CHSTAT,...
        TWISTA,DHDADI,TYPE);
    
    if nacaWing
        fprintf(FID,['\nNACA W ' num2str(nacaWingSeries) ' ' nacaWingCode '\n']);
    end

end

% Save if so desired
if saveFlag1
    fprintf(FID,'\nSAVE\n');
end

% Write SYMFLP information to file if flaps exists
if flaps
    fprintf(FID,'\n $SYMFLP FTYPE=%1.1f, NDELTA=%1.1f,\n         DELTA(1)='...
        ,FTYPEF,NDELTAF);
    for i = 1:NDELTAF
        fprintf(FID,'%1.1f,',DELTAF(i));
        if (mod(i,10) == 0 && i ~= NDELTAF)
            fprintf(FID,'\n            ');
        end
    end
    fprintf(FID,['\n         PHETE=%1.4f, PHETEP=%1.4f,\n         '...
        'CHRDFI=%1.1f, CHRDFO=%1.1f,\n         SPANFI=%1.1f, SPANFO=%1.1f,'...
        '\n         CPRMEI(1)='],PHETEF,PHETEPF,CHRDFIF,CHRDFOF,SPANFIF,...
        SPANFOF);
    for i = 1:NDELTAF
        fprintf(FID,'%1.1f,',CPRMEIF(i));
        if (mod(i,10) == 0 && i ~= NDELTAF)
            fprintf(FID,'\n            ');
        end
    end
    fprintf(FID,'\n         CPRMEO(1)=');
    for i = 1:NDELTAF
        fprintf(FID,'%1.1f,',CPRMEOF(i));
        if (mod(i,10) == 0 && i ~= NDELTAF)
            fprintf(FID,'\n            ');
        end
    end
    fprintf(FID,'\n         NTYPE=%1.1f$\n',NTYPEF);
    
    
    % Save CASEID
    fprintf(FID,['\nCASEID FLAPS: ' projectName ' II Model 550 Aircraft\nNEXT CASE\n']);

end

% Write ASYFLP information to file if ailerons exists
if ailerons
    fprintf(FID,['\n $ASYFLP STYPE=%1.1f, NDELTA=%1.1f,\n         '...
       'DELTAL(1)='],STYPEA,NDELTAA);
   for i = 1:NDELTAA
       fprintf(FID,'%1.1f,',DELTALA(i));
       if (mod(i,10) == 0 && i ~= NDELTAA)
           fprintf(FID,'\n            ');
       end
   end
   fprintf(FID,'\n         DELTAR(1)=');
   for i = 1:NDELTAA
       fprintf(FID,'%1.1f,',DELTARA(i));
       if (mod(i,10) == 0 && i ~= NDELTAA)
           fprintf(FID,'\n            ');
       end
   end
   fprintf(FID, ['\n         SPANFI=%1.1f, SPANFO=%1.1f,\n         '...
       'PHETE=%1.5f,\n         CHRDFI=%1.1f, CHRDFO=%1.1f$\n'],SPANFIA,...
       SPANFOA,PHETEA,CHRDFIA,CHRDFOA);
   
   % Save CASEID
   fprintf(FID,['\nCASEID AILERONS: ' projectName ' II Model 550 Aircraft\nSAVE\nNEXT CASE\n']);
end

% Write HTPLNF information to file if horizontal tail exists
if horzTail
    
    if nacaHT
        fprintf(FID,['\nNACA H ' num2str(nacaHTSeries) ' ' nacaHTCode '\n']);
    end
    
    fprintf(FID,['\n $HTPLNF CHRDR=%1.1f, CHRDTP=%1.1f,\n         '...
        'SSPN=%1.1f, SSPNE=%1.1f,\n         SAVSI=%1.1f,'...
        '\n         CHSTAT=%1.1f, TWISTA=%1.1f,\n         '...
        'DHDADI=%1.1f,\n         TYPE=%1.1f$\n'],CHRDRHT,CHRDTPHT,SSPNHT,...
        SSPNEHT,SAVSIHT,CHSTATHT,TWISTAHT,DHDADIHT,TYPEHT);
    
end

% Write VTPLNF information to file if vertial tail exists
if vertTail
    fprintf(FID,['\n $VTPLNF CHRDTP=%1.1f, SSPNE=%1.1f, SSPN=%1.1f, '...
        'CHRDR=%1.1f,\n         SAVSI=%1.1f, CHSTAT=%1.1f, TYPE=%1.1f$\n'],...
        CHRDTPVT,SSPNEVT,SSPNVT,CHRDRVT,SAVSIVT,CHSTATVT,TYPEVT);
    
    if nacaVT
        fprintf(FID,['\nNACA V ' num2str(nacaVTSeries) ' ' nacaVTCode '\n']);
    end
end

% Write VFPLNF information to file if vertial fin exists
if vertFin
    fprintf(FID,['\n $VFPLNF CHRDR=%1.1f, CHRDTP=%1.1f, CHSTAT=%1.1f, '...
        'DHDADO=%1.1f,\n         SAVSI=%1.1f, SSPN=%1.1f, SSPNE=%1.1f, '...
        'TYPE=%1.1f$\n'],CHRDRVF,CHRDTPVF,CHSTATVF,DHDADOVF,SAVSIVF,...
        SSPNVF,SSPNEVF,TYPEVF);
    if nacaVF
        fprintf(FID,['\nNACA F ' num2str(nacaVFSeries) ' ' nacaVFCode '\n']);
    end
end

% Write SYMFLP information to file if elevator exists
if elevator
    fprintf(FID,'\n $SYMFLP FTYPE=%1.1f,\n         NDELTA=%1.1f,',FTYPEE,...
        NDELTAE);
    fprintf(FID,'\n         DELTA(1)=');
    for i = 1:NDELTAE
        fprintf(FID,'%1.1f,',DELTAE(i));
        if (mod(i,10) == 0 && i ~= NDELTAE)
            fprintf(FID,'\n            ');
        end
    end
    fprintf(FID,'\n         ');
    fprintf(FID,['PHETE=%1.4f, PHETEP=%1.4f,\n         CHRDFI=%1.4f,'...
        ' CHRDFO=%1.4f,'],PHETEE,PHETEPE,CHRDFIE,CHRDFOE);
    fprintf(FID,['\n         SPANFI=%1.4f, SPANFO=%1.4f,\n         CB=%1.2f'...
        ', TC=%1.1f, NTYPE=%1.1f$\n'],SPANFIE,SPANFOE,CBE,TCE,NTYPEE);
end

% Write JETPWR information to file
if jetPwr
    fprintf(FID,['\n $JETPWR NENGSJ=%1.1f, AIETLJ=%1.1f, THSTCJ=%1.1f,'...
        '\n         JIALOC=%1.1f, JELLOC=%1.1f, JEVLOC=%1.1f, '...
        '\n         JEALOC=%1.1f, JINLTA=%1.1f,\n         '...
        'AMBTMP=%1.1f, AMBSTP=%1.1f, JERAD=%1.3f$\n'],NENGSJ,AIETLJ,...
        THSTCJ,JIALOC,JELLOC,JEVLOC,JEALOC,JINLTA,AMBTMP,AMBSTP,JERAD);
end

fprintf(FID,['\nCASEID TOTAL: ' projectName ' II Model 550 Aircraft']);

% Close files used in the creation of the DATCOM input file
ST = fclose('all');

%% Execute .dcm file and load variables from output files
eval(['!' projectName '.dcm']);

%save keep.mat projectName

%eval('clear all');
eval('clc');

% Load desired .dcm outputs
loadDat