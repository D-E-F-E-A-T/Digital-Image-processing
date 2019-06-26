

function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
% DANIYALAZ
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 28-Nov-2018 23:21:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
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


[filename,filepath]=uigetfile({'*.*';'*.jpg';'*.png';'*.tif';'*.bmp'},'Seach Image To Be Displayed');
fullname=[filepath,filename];

imageFile= imread(fullname);
handles.filename=imageFile;
axes(handles.axes1)
imshow(imageFile);
axes(handles.axes2)
imshow(imageFile);

[X Y]=ginput(2);
hold on
newFile= [X Y]
plot (X, Y,'r-')
axes(handles.axes2)
guidata(hObject,handles)

f = figure('visible', 'off');
plot(rand(5))
F = getframe();

imwrite(newFile,'old.jpg');
guidata(hObject, handles);

guidata(hObject,handles)

%%%%%%%%%%%%%%%%%%%%%



%figure;
%imshow(F.cdata)
%imshow(newFile);
% function userDraw(handles)
% %F=figure;
% %setptr(F,'eraser'); %a custom cursor just for fun
% 
% A=handles.axes2; % axesUserDraw is tag of my axes
% set(A,'buttondownfcn',@start_pencil)
% 
% function start_pencil(src,eventdata)
% coords=get(src,'currentpoint'); %since this is the axes callback, src=gca
% x=coords(1,1,1);
% y=coords(1,2,1);
% 
% r=line(x, y, 'color', [0 .5 1], 'LineWidth', 2, 'hittest', 'off'); %turning     hittset off allows you to draw new lines that start on top of an existing line.
% set(gcf,'windowbuttonmotionfcn',{@continue_pencil,r})
% set(gcf,'windowbuttonupfcn',@done_pencil)
% 
% function continue_pencil(src,eventdata,r)
% %Note: src is now the figure handle, not the axes, so we need to use gca.
% coords=get(gca,'currentpoint'); %this updates every time i move the mouse
% x=coords(1,1,1);
% y=coords(1,2,1);
% %get the line's existing coordinates and append the new ones.
% lastx=get(r,'xdata');  
% lasty=get(r,'ydata');
% newx=[lastx x];
% newy=[lasty y];
% set(r,'xdata',newx,'ydata',newy);
% 
% function done_pencil(src,evendata)
% %all this funciton does is turn the motion function off 
% set(gcf,'windowbuttonmotionfcn','')
% set(gcf,'windowbuttonupfcn','')
% 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%

%imagesc(imageFile);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename,filepath]=uigetfile({'*.*';'*.jpg';'*.png';'*.tif';'*.bmp'},'Seach Image To Be Displayed');
fullname=[filepath,filename];

imageFile= imread(fullname);




% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

filename=handles.filename;
axes(handles.axes3)
imshow(filename);
guidata(hObject,handles)

imwrite(filename,'new.jpg');
