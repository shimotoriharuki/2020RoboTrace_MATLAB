global FileName
% FileName = 'CoursePic/1000.png';
% FileName = 'CoursePic/4.png';
% FileName = 'CoursePic/10-5.png';
% FileName = 'CoursePic/1000Cross.png';
% FileName = 'CoursePic/R10.png';
% FileName = 'CoursePic/1000Straight.png';
FileName = 'CoursePic/500Circul.png';
% FileName = 'CoursePic/8.png';
Image = imread(FileName);
info = imfinfo(FileName);

global scale;
scale = 1;

Image = imresize(Image, scale);
imshow(Image);

Image = imbinarize(Image); %二値化

Height = info.Height * scale;
Width = info.Width * scale;

% 初期化
Pixels = zeros(Height, Width);

for row = 1 : Height
    for line = 1 : Width        
        Pixels(row, line) = Image(row, line);
    end
end

global MapData 
MapData = Pixels;
