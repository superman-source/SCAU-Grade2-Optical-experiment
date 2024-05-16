function img = load_img(type)
% 用于读取图片(.bmp格式)的函数，输出读取的图片

if type=="auto"% 自动执行的用默认图片路径进行读取
    img= imread("D:\桌面\guangxueshiyan\Sample\10.bmp");
elseif  type =="default"
    % 正常模式使用此函数

    % 显示文件选择对话框
    [filename, pathname] = uigetfile('*.bmp', 'Select BMP File');

    % 验证用户是否选择了文件
    if isequal(filename, 0) || isempty(filename)
        disp('No file selected.')
        return
    end

    % 构建完整文件路径
    fullFilePath = fullfile(pathname, filename);

    % 读取图像数据
    img = imread(fullFilePath);


end

