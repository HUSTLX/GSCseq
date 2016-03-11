
function varargout = software(varargin)
% SOFTWARE MATLAB code for software.fig
%      SOFTWARE, by itself, creates a new SOFTWARE or raises the existing
%      singleton*.
%
%      H = SOFTWARE returns the handle to a new SOFTWARE or the handle to
%      the existing singleton*.
%
%      SOFTWARE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SOFTWARE.M with the given input arguments.
%
%      SOFTWARE('Property','Value',...) creates a new SOFTWARE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before software_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to software_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help software

% Last Modified by GUIDE v2.5 15-Jan-2015 09:55:20
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @software_OpeningFcn, ...
                   'gui_OutputFcn',  @software_OutputFcn, ...
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

% --- Executes just before software is made visible.
function software_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to software (see VARARGIN)

% Choose default command line output for software
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes software wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = software_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[picname,picpath,filterindex]=uigetfile('*.*')
if isequal(picname,0) | isequal(picpath,0)
    msgbox({'No file.';'Plese chose a picture.'},'Error','modal');
    return; 
end 
global filename;
filename=strcat(picpath,picname);
im1=imread(filename);
im1=imresize(im1,[50,100]);
axes(handles.axes1);
imshow(im1);
main(filename)

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

im2=imread('./first.bmp');
im3=imread('./second.bmp');
axes(handles.axes4);
imshow(im2)
axes(handles.axes5)
imshow(im3)
% im2=imread('./first.bmp');
% axes(handles.axes2)
% imshow(im2)
% cla
% im3=imread('second.bmp');
% axes(handles.axes3)
% imshow(im3)
