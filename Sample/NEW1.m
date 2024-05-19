function varargout = NEW1(varargin)
% NEW1 MATLAB code for NEW1.fig
%      NEW1, by itself, creates a new NEW1 or raises the existing
%      singleton*.
%
%      H = NEW1 returns the handle to a new NEW1 or the handle to
%      the existing singleton*.
%
%      NEW1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NEW1.M with the given input arguments.
%
%% 
%% 想·   
%      NEW1('Property','Value',...) creates a new NEW1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before NEW1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to NEW1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help NEW1

% Last Modified by GUIDE v2.5 12-Apr-2020 13:26:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @NEW1_OpeningFcn, ...
                   'gui_OutputFcn',  @NEW1_OutputFcn, ...
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


% --- Executes just before NEW1 is made visible.
function NEW1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to NEW1 (see VARARGIN)

% Choose default command line output for NEW1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global zwi;
global zwjz;
zwi=1
zwjz=ones(2,zwi);
global hsi;
global hsjz;
hsi=1;
hsjz=ones(2,hsi);

% UIWAIT makes NEW1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = NEW1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in .
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global vid;                %定义全局变量
global vidRes;
global nBands;
vid=videoinput('winvideo',1,'YUY2_1280x720');
vidRes=get(vid,'VideoResolution');
nBands=get(vid,'NumberOfBands');
set(handles.output,'Currentaxes',handles.axes1);
hlmage1=image(zeros(vidRes(2),vidRes(1),nBands));
preview(vid,hlmage1);

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global vid;           %定义全局变量
global l;
imageCurrent=ycbcr2rgb(getsnapshot(vid));       %对应RGB24格式，捉一帧图
set(handles.output,'Currentaxes',handles.axes1);
imshow(imageCurrent);
l=imageCurrent;

function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global l;
[filename,pathname]=uigetfile('*.bmp;*.jpg');
if pathname   %判断是否存在图像
    name=strcat(pathname,filename);
    l=imread(name)
end
set(handles.output,'Currentaxes',handles.axes1);
imshow(l);
set(handles.togglebutton2,'string','打开截图框');

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global h;      %定义全局变量
pos=getPosition(h);        %将值放入pos矩阵中
set(handles.edit1,'string',num2str(pos(1,1)));
%使数值变为字符，然后放到变量1文本中
set(handles.edit2,'string',num2str(pos(1,2)));
set(handles.edit3,'string',num2str(pos(1,3)));
set(handles.edit4,'string',num2str(pos(1,4)));
global l;
global p;
global x2
global y2
x1=abs(pos(1,1));
y1=abs(pos(1,2));
x2=abs(pos(1,3));
y2=abs(pos(1,4));
p=imcrop(l,[x1,y1,x2,y2]);
set(handles.output,'Currentaxes',handles.axes2);   %设axes2为当前对外输出画面框
imshow(p);
global a1;
global a2;
global zw;
global hs;
if a1==1
    zw=p;
    set(handles.text2,'string','子午方向数据保存成功');
end
if a2==1
    hs=p;
    set(handles.text2,'string','弧矢方向数据保存成功');
end
pg=double(rgb2gray(p));
zuid=max(pg(ceil(y2/2),:));
set(handles.edit5,'string',num2str(zuid));
zuix=min(pg(ceil(y2/2),:));
set(handles.edit6,'string',num2str(zuix));

function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in togglebutton2.
function togglebutton2_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton2
global h
a=get(hObject,'Value');
if a==1
    h=imrect(handles.axes1,[200,150,250,200]);
    setColor(h,'red');
    set(handles.togglebutton2,'string','隐藏截图框');
else
    delete(h);
    set(handles.togglebutton2,'string','打开截图框');
end

% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
global a1;
global a2;
a1=get(hObject,'Value');
a2=0;
if a1==1
    set(handles.radiobutton2,'value',0);
    set(handles.text2,'string',' ');
end
% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
global a1;
global a2;
a1=0;
a2=get(hObject,'Value');
if a2==1
    set(handles.radiobutton1,'value',0);
    set(handles.text2,'string',' ');
end

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel1,'visible','on');  %截图面板开
set(handles.uipanel7,'visible','off'); %子午关
set(handles.uipanel15,'visible','off'); %弧矢关
set(handles.uipanel17,'visible','off');%输出报告关
set(handles.uipanel19,'visible','off');%频谱分析关
set(handles.uipanel21,'visible','off');%图像监测关

function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global zw;
global x2;
global y2;
set(handles.uipanel1,'visible','off');  %截图面板关
set(handles.uipanel7,'visible','on'); %子午开
set(handles.uipanel15,'visible','off'); %弧矢关
set(handles.uipanel17,'visible','off');%输出报告关
set(handles.uipanel19,'visible','off');%频谱分析关
set(handles.uipanel21,'visible','off');%图像监测关
set(handles.output,'Currentaxes',handles.axes3);
imshow(zw);
y=line([0,ceil(x2)],[ceil(y2/2),ceil(y2/2)]);
set(y,'color','r');
set(y,'linewidth',1);


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global hs;
global x2;
global y2;
set(handles.uipanel1,'visible','off');  %截图面板关
set(handles.uipanel7,'visible','off'); %子午关
set(handles.uipanel15,'visible','on'); %弧矢开
set(handles.uipanel17,'visible','off');%输出报告关
set(handles.uipanel19,'visible','off');%频谱分析关
set(handles.uipanel21,'visible','off');%图像监测关
set(handles.output,'Currentaxes',handles.axes13);
imshow(hs);
y=line([ceil(x2/2),ceil(x2/2)],[0,ceil(y2)]);
set(y,'color','r');
set(y,'linewidth',1);

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel1,'visible','off');  %截图面板关
set(handles.uipanel7,'visible','off'); %子午关
set(handles.uipanel15,'visible','off'); %弧矢关
set(handles.uipanel17,'visible','on');%输出报告开
set(handles.uipanel19,'visible','off');%频谱分析关
set(handles.uipanel21,'visible','off');%图像监测关

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global b1;
global b2;
global zw;
global y2;
global zwgq;
zwg=double(rgb2gray(zw));
zwgq=(zwg(ceil(y2/2),:))/255;
set(handles.output,'Currentaxes',handles.axes4);
plot(zwgq);
if b1==1
    set(handles.text30,'visible','on');% 灰度文字显示
    set(handles.text28,'visible','on');
    set(handles.text32,'visible','off');%光强归一化图隐藏;
    bc=str2double(get(handles.edit7,'string'));%放入步长数据
    n=round(1+(255/bc));%步长转灰度级
    set(handles.output,'Currentaxes',handles.axes5);
    zwg1=rgb2gray(zw);
    imhist(zwg1,n)
end
if b2==1
    set(handles.text30,'visible','off');% 灰度文字隐藏
    set(handles.text28,'visible','off');
    set(handles.text32,'visible','on');%光强归一化图显示;
    [gyh,~]=mapminmax(zwg(ceil(y2/2),:),0,1); %光强数据归一化
    set(handles.output,'Currentaxes',handles.axes5);
    plot(gyh);
 end
    
% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4
global b1;
global b2;
b1=get(hObject,'Value');
b2=0;
if b1==1
   set(handles.radiobutton5,'value',0);
end

% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5
global b1;
global b2;
b2=get(hObject,'Value');
b1=0;
if b2==1
    set(handles.radiobutton4,'value',0);
end
    

function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global zw;
global y2;
global mtf;
zwg=double(rgb2gray(zw));
zuid=(max(zwg(ceil(y2/2),:)))/255;
set(handles.edit8,'string',num2str(zuid));
zuix=(min(zwg(ceil(y2/2),:)))/255;
set(handles.edit9,'string',num2str(zuix));
mtf=(zuid-zuix)/(zuid+zuix);
set(handles.edit10,'string',num2str(mtf));
% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mtf;
global zwi;
global zwjz;
xd=str2double(get(handles.edit11,'string'));
zwjz(1,zwi)=xd;%将线对数据放入矩阵第一行
zwjz(2,zwi)=mtf;%将MTF数据放入矩阵第二行
set(handles.output,'Currentaxes',handles.axes6);
plot(zwjz(1,:),zwjz(2,:),'-ob');%画出线对与MTF关系图
hold on;
zwi=zwi+1;


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global zwgq;
zwgq1=rot90(zwgq,3);%使 子午光强 矩阵逆时针旋转270度，并放入zwgq1
[fname,pname]=uiputfile('*.xlsx','save as');%对话框，默认文件格式是%.xlsx
if pname  %文件名非空则执行
    name=strcat(pname,fname);
    xlswrite(name,zwgq1);%将zwgq1的数据做excel表输出
end

% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global zwi;
global zwjz;
zwi=1;%zwi复位为1
zwjz=ones(2,zwi);%zwjz矩阵复位为全1矩阵
set(handles.output,'Currentaxes',handles.axes6);
cla;%清楚数据


% --- Executes on button press in pushbutton23.
function pushbutton23_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global c1;
global c2;
global hs;
global x2;
global hsgq;
hsg=double(rgb2gray(hs));
hsgq=(hsg(:,ceil(x2/2)))/255;
set(handles.output,'Currentaxes',handles.axes14);
plot(hsgq);
if c1==1
    set(handles.text45,'visible','on');%灰度显示
    set(handles.text43,'visible','on');
    set(handles.text47,'visible','off');%光强归一化隐藏
    bc=str2double(get(handles.edit23,'string'));
    n=round(1+(255/bc))
    set(handles.output,'Currentaxes',handles.axes15);
    hsg1=rgb2gray(hs);
    imhist(hsg1,n)
end
if c2==1
    set(handles.text45,'visible','off');%灰度隐藏
    set(handles.text43,'visible','off');
    set(handles.text47,'visible','on');%光强归一化显示
    hsceil=rot90(hsg(:,ceil(x2/2)),1);
    [gyh,~]=mapminmax(hsceil,0,1);
    set(handles.output,'Currentaxes',handles.axes15);
    plot(gyh);
end


function edit23_Callback(hObject, eventdata, handles)
% hObject    handle to edit23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit23 as text
%        str2double(get(hObject,'String')) returns contents of edit23 as a double


% --- Executes during object creation, after setting all properties.
function edit23_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit24_Callback(hObject, eventdata, handles)
% hObject    handle to edit24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit24 as text
%        str2double(get(hObject,'String')) returns contents of edit24 as a double


% --- Executes during object creation, after setting all properties.
function edit24_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit25_Callback(hObject, eventdata, handles)
% hObject    handle to edit25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit25 as text
%        str2double(get(hObject,'String')) returns contents of edit25 as a double


% --- Executes during object creation, after setting all properties.
function edit25_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit26_Callback(hObject, eventdata, handles)
% hObject    handle to edit26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit26 as text
%        str2double(get(hObject,'String')) returns contents of edit26 as a double


% --- Executes during object creation, after setting all properties.
function edit26_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit27_Callback(hObject, eventdata, handles)
% hObject    handle to edit27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit27 as text
%        str2double(get(hObject,'String')) returns contents of edit27 as a double


% --- Executes during object creation, after setting all properties.
function edit27_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global hs;
global x2;
global hsmtf;
hsg=double(rgb2gray(hs));
zuid=(max(hsg(:,ceil(x2/2))))/255;
set(handles.edit24,'string',num2str(zuid));
zuix=(min(hsg(:,ceil(x2/2))))/255;
set(handles.edit25,'string',num2str(zuix));
hsmtf=(zuid-zuix)/(zuid+zuix);
set(handles.edit26,'string',num2str(hsmtf));

% --- Executes on button press in pushbutton25.
function pushbutton25_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global hsmtf;
global hsi;
global hsjz;
xd=str2double(get(handles.edit27,'string'));
hsjz(1,hsi)=xd;
hsjz(2,hsi)=hsmtf;
set(handles.output,'Currentaxes',handles.axes16);
plot(hsjz(1,:),hsjz(2,:),'-ob');%画出MTF线对关系图
hold on;
hsi=hsi+1;

% --- Executes on button press in pushbutton26.
function pushbutton26_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global hsgq;
[fname,pname]=uiputfile('*.xlsx','save as');
if pname
    name=stract(pname,fname);
    xlswrite(name,hsgq);
end

% --- Executes on button press in pushbutton27.
function pushbutton27_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global hsi;
global hsjz;
hsi=1;
hsjz=ones(2,hsi);
set(handles.output,'Currentaxes',handles.axes16);
cla;

% --- Executes on button press in radiobutton10.
function radiobutton10_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton10
global c1;
global c2;
c1=get(hObject,'Value');
c2=0;
if c1==1
    set(handles.radiobutton11,'value',0);
end

% --- Executes on button press in radiobutton11.
function radiobutton11_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton11
global c1;
global c2;
c1=0;
c2=get(hObject,'Value');
if c2==1
    set(handles.radiobutton10,'value',0);
end



function edit28_Callback(hObject, eventdata, handles)
% hObject    handle to edit28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit28 as text
%        str2double(get(hObject,'String')) returns contents of edit28 as a double


% --- Executes during object creation, after setting all properties.
function edit28_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton28.
function pushbutton28_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fname;
[fname,pname]=uiputfile('*xlsx','save as');
set(handles.edit28,'string',pname);

% --- Executes on button press in pushbutton29.
function pushbutton29_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global zwjz;
global hsjz;
global fname;
zwjz1=rot90(zwjz,1);
hsjz1=rot90(hsjz,1);
jz=[zwjz1,hsjz1];
pname=get(handles.edit28,'string');
if pname
    if fname
        name=strcat(pname,fname);
    else
        name=strcat(pname,'朗奇光栅测试结果.xlsx');
    end
    xlswrite(name,jz);
end
set(handles.text52,'string','文件已保存');
pause(1.5);%暂停1.5秒
set(handles.text52,'string',' ');
fname=0;%文件名复位


% --- Executes on button press in pushbutton30.
function pushbutton30_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global zwjz;
global hsjz;
zwjz1=rot90(zwjz,1);
hsjz1=rot90(hsjz,1);
set(handles.uitable3,'data',zwjz1);
set(handles.uitable5,'data',hsjz1);


% --- Executes on button press in radiobutton12.
function radiobutton12_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton12
global d1;
global d2;
d1=get(hObject,'Value');
d2=0;
if d1==1
   set(handles.radiobutton13,'value',0);
end


% --- Executes on button press in radiobutton13.
function radiobutton13_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton13
global d1;
global d2;
d2=get(hObject,'Value');
d1=0;
if d2==1
    set(handles.radiobutton12,'value',0);
end



function edit29_Callback(hObject, eventdata, handles)
% hObject    handle to edit29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit29 as text
%        str2double(get(hObject,'String')) returns contents of edit29 as a double


% --- Executes during object creation, after setting all properties.
function edit29_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton31.
function pushbutton31_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global p;
set(handles.uipanel1,'visible','off');  %截图面板关
set(handles.uipanel7,'visible','off'); %子午关
set(handles.uipanel15,'visible','off'); %弧矢关
set(handles.uipanel17,'visible','off');%输出报告关
set(handles.uipanel19,'visible','on');%频谱分析开
set(handles.uipanel21,'visible','off');%图像监测关
set(handles.output,'Currentaxes',handles.axes17);   %设axes17为当前对外输出画面框
imshow(p);


% --- Executes on button press in pushbutton32.
function pushbutton32_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global d1;
global d2;
global p;
global x2;
global y2;
global GD;
global SJ;
set(handles.output,'Currentaxes',handles.axes18);   %设axes18为当前对外输出画面框
imshow(p);
GD=str2double(get(handles.edit29,'string'));
hd=double(rgb2gray(p));
if d1==1
y=line([0,ceil(x2)],[ceil(y2/GD),ceil(y2/GD)]);
set(y,'color','r');
set(y,'linewidth',1);
SJ=(hd(ceil(y2/GD),:))/255;
end
if d2==1
    y=line([ceil(x2/GD),ceil(x2/GD)],[0,ceil(y2)]);
set(y,'color','r');
set(y,'linewidth',1);
SJ=(hd(:,ceil(x2/GD)))/255;
end


% --- Executes on button press in pushbutton33.
function pushbutton33_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ai
global k
global f
global c
global SJ;
ai=fft(SJ);
k=max(abs(ai));
f=abs(fft(SJ));
f(1:1)=0;
f(1:2)=0;
f(1:3)=0;

c=fftshift(f/k);
[y,x]=size(c);
set(handles.output,'Currentaxes',handles.axes19);
x1=(-x/2:(x/2)-1)/x;
plot(x1,c);
% --- Executes on button press in pushbutton34.
function pushbutton34_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global c;
global FS;
FS=fftshift(c);
FS1=rot90(FS,3);
[fname,pname]=uiputfile('*xlsx','save as');
if pname
    name=strcat(pname,fname);
    xlswrite(name,FS1);%将FS的数据做excel表输出
end
set(handles.text59,'string','文件已保存');
pause(1.5);%暂停1.5秒
set(handles.text59,'string',' ');
fname=0;%文件名复位


% --- Executes on button press in pushbutton36.
function pushbutton36_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global vid;                %定义全局变量
global vidRes;
global nBands;
vid=videoinput('winvideo',1,'YUY2_1280x720');
vidRes=get(vid,'VideoResolution');
nBands=get(vid,'NumberOfBands');
set(handles.output,'Currentaxes',handles.axes20);
hlmage1=image(zeros(vidRes(2),vidRes(1),nBands));
preview(vid,hlmage1);

% --- Executes on button press in pushbutton37.
function pushbutton37_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton37 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global vid;           %定义全局变量
global jc;
imageCurrent=ycbcr2rgb(getsnapshot(vid));       %对应RGB24格式，捉一帧图
set(handles.output,'Currentaxes',handles.axes20);
imshow(imageCurrent);
jc=imageCurrent;

% --- Executes on button press in pushbutton38.
function pushbutton38_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton38 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global jc;
[fname,pname]=uiputfile('*.bmp','save as');
if pname  %文件名非空则执行
    name=strcat(pname,fname);
    imwrite(jc,name);
end


% --- Executes on button press in pushbutton35.
function pushbutton35_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel1,'visible','off');  %截图面板关
set(handles.uipanel7,'visible','off'); %子午关
set(handles.uipanel15,'visible','off'); %弧矢关
set(handles.uipanel17,'visible','off');%输出报告关
set(handles.uipanel19,'visible','off');%频谱分析关
set(handles.uipanel21,'visible','on');%图像监测开
