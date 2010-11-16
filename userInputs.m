function varargout = userInputs(varargin)
% USERINPUTS M-file for userInputs.fig
%      USERINPUTS, by itself, creates a new USERINPUTS or raises the existing
%      singleton*.
%
%      H = USERINPUTS returns the handle to a new USERINPUTS or the handle to
%      the existing singleton*.
%
%      USERINPUTS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in USERINPUTS.M with the given input arguments.
%
%      USERINPUTS('Property','Value',...) creates a new USERINPUTS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before userInputs_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to userInputs_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help userInputs

% Last Modified by GUIDE v2.5 01-Nov-2010 11:04:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @userInputs_OpeningFcn, ...
                   'gui_OutputFcn',  @userInputs_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before userInputs is made visible.
function userInputs_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to userInputs (see VARARGIN)

% Choose default command line output for userInputs
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes userInputs wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = userInputs_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function weightin_Callback(hObject, eventdata, handles)
% hObject    handle to weightin_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of weightin_text as text
%        str2double(get(hObject,'String')) returns contents of weightin_text as a double

% --- Executes during object creation, after setting all properties.
function weightin_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to weightin_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function alphain_Callback(hObject, eventdata, handles)
% hObject    handle to alphain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of alphain as text
%        str2double(get(hObject,'String')) returns contents of alphain as a double


% --- Executes during object creation, after setting all properties.
function alphain_CreateFcn(hObject, eventdata, handles)
% hObject    handle to alphain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to altin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of altin as text
%        str2double(get(hObject,'String')) returns contents of altin as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to altin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function machin_Callback(hObject, eventdata, handles)
% hObject    handle to machin_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of machin_text as text
%        str2double(get(hObject,'String')) returns contents of machin_text as a double


% --- Executes during object creation, after setting all properties.
function machin_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to machin_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function altin_Callback(hObject, eventdata, handles)
% hObject    handle to altin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of altin as text
%        str2double(get(hObject,'String')) returns contents of altin as a double


% --- Executes during object creation, after setting all properties.
function altin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to altin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function alphahigh_Callback(hObject, eventdata, handles)
% hObject    handle to alphahigh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of alphahigh as text
%        str2double(get(hObject,'String')) returns contents of alphahigh as a double


% --- Executes during object creation, after setting all properties.
function alphahigh_CreateFcn(hObject, eventdata, handles)
% hObject    handle to alphahigh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function alphalow_Callback(hObject, eventdata, handles)
% hObject    handle to alphalow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of alphalow as text
%        str2double(get(hObject,'String')) returns contents of alphalow as a double


% --- Executes during object creation, after setting all properties.
function alphalow_CreateFcn(hObject, eventdata, handles)
% hObject    handle to alphalow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in entervals.
function entervals_Callback(hObject, eventdata, handles)
% hObject    handle to entervals (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

evalin('base','clear all');

value = get(handles.weightin,'String');
if ~isempty(value)
    assignin('base','WT',str2num(value));
end

valuelow = get(handles.alphalow,'String');
valuehigh = get(handles.alphahigh,'String');
valuerange = get(handles.alphain,'String');

if ~isempty(valuelow) && ~isempty(valuerange) || ~isempty(valuerange) && ~isempty(valuehigh)
    
    disp('Please enter either a value range OR specified values for angle of attack');
    return
    
end

value = str2num(valuerange);

if length(value) > 20
    disp('Error: 20 angle of attack values maximum');
    return
end

if ~isempty(valuelow) && ~isempty(valuehigh)
    
    alphahigh = str2num(valuehigh);
    alphalow = str2num(valuelow);
    
    if (alphahigh-alphalow)+1 <= 20
        alphaRange = alphalow:alphahigh;
        assignin('base','ALSCHD',alphaRange);
    else
        alphaRange = linspace(alphalow,alphahigh,19);
        assignin('base','ALSCHD',alphaRange);
    end
    
    %alphaRange = num2str(alphaRange);
    
elseif ~isempty(valuerange)
    assignin('base','ALSCHD',str2num(valuerange));
end

value = get(handles.machin,'String');
if ~isempty(value)
    assignin('base','MACH',str2num(value));
end

value = get(handles.altin,'String');
if ~isempty(value)
    assignin('base','ALT',str2num(value));
end

value = get(handles.dimft,'Value');
if value
    assignin('base','DIM','DIM FT');
end

value = get(handles.dimm,'Value');

if value
    assignin('base','DIM','DIM M');
end

value = get(handles.dimin,'Value');

if value
    assignin('base','DIM','DIM IN');
end

value = get(handles.dimcm,'Value');

if value
    assignin('base','DIM','DIM CM');
end

value = get(handles.loop1,'Value');
if value
    assignin('base','LOOP',1.0);
end

value = get(handles.loop2,'Value');
if value
    assignin('base','LOOP',2.0);
end

value = get(handles.loop3,'Value');
if value
    assignin('base','LOOP',3.0);
end

value = get(handles.degree,'Value');
if value
    assignin('base','DERIV','DERIV DEG');
end

value = get(handles.radians,'Value');
if value
    assignin('base','DERIV','DERIV RAD');
end

value = get(handles.damp,'Value');
if value
    assignin('base','DAMP','DAMP');
end

value = get(handles.trim,'Value');
if value
    assignin('base','TRIM','TRIM');
end

value = get(handles.projName,'String');
if isempty(value)
    disp('Please enter an output name (name of files created as output files)');
    return
elseif ~isempty(value)
    assignin('base','projectName',value)
end

evalin('base','save userInput.mat');

evalin('base','writeDat');

close all


% --- Executes during object creation, after setting all properties.
function machin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to machin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function weightin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to weightin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in loop1.
function loop1_Callback(hObject, eventdata, handles)
% hObject    handle to loop1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of loop1


% --- Executes on button press in loop2.
function loop2_Callback(hObject, eventdata, handles)
% hObject    handle to loop2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of loop2


% --- Executes on button press in loop3.
function loop3_Callback(hObject, eventdata, handles)
% hObject    handle to loop3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of loop3


% --- Executes on button press in damp.
function damp_Callback(hObject, eventdata, handles)
% hObject    handle to damp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of damp


% --- Executes on button press in trim.
function trim_Callback(hObject, eventdata, handles)
% hObject    handle to trim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of trim


% --- Executes on button press in default.
function default_Callback(hObject, eventdata, handles)
% hObject    handle to default (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

mach = '0.4';
set(handles.machin,'String',mach)

alt = '0';
set(handles.altin,'String',alt)

alpha =  '-16.0, -8.0, -6.0, -4.0, -2.0, 0.0, 2.0, 4.0, 8.0, 9.0,10.0, 12.0, 14.0, 16.0, 18.0, 19.0, 20.0, 21.0, 22.0, 24.0';
set(handles.alphain,'String',alpha)

wt = '7000';
set(handles.weightin,'String',wt)

set(handles.damp,'Value',1)

set(handles.dimft,'Value',1)

set(handles.degree,'Value',1)

set(handles.loop2,'Value',1)

set(handles.projName,'String','Citation')



function projName_Callback(hObject, eventdata, handles)
% hObject    handle to projName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of projName as text
%        str2double(get(hObject,'String')) returns contents of projName as a double


% --- Executes during object creation, after setting all properties.
function projName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to projName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
