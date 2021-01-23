image_values = out.image_output.signals.values;
image_datas = image_values(80, :);    % ある時間の画像を切り取り

image_size = size(image_datas, 2);

width = 320;
height = 240;
converted_image = zeros(height, width, 3);
cnt = 0;

for h = 1:height
    for w = 1:width
        converted_image(h, w, 1) = getRatio(image_datas(cnt + 1));
        converted_image(h, w, 2) = getRatio(image_datas(cnt + 2));
        converted_image(h, w, 3) = getRatio(image_datas(cnt + 3));
        
        cnt = cnt + 3;
    end
    
end
I = rgb2gray(converted_image);

imshow(I)

function ret = getRatio(val)
    res = rescale([0 val 255], 0, 1);
    ret = res(2);
end