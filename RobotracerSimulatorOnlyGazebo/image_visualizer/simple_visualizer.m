image_values = out.image_output.signals.values;
image_datas = image_values(20, :);    % ある時間の画像を切り取り
image_size = size(image_datas, 2);

% 公式のスマートなやり方
width = 10;
height = 10;
numOutputChannels = 3;
indexBase = (1:numOutputChannels:width*height*numOutputChannels)';
index = zeros(numel(indexBase),numOutputChannels);
for i = 1:numOutputChannels
    % Construct it as column-major index to ease later reshape
    index(:, i) = indexBase + i - 1;
end

% Reshape the data into a width x height x numOutputChannels matrix
img = reshape(image_datas(index), width, height, numOutputChannels);

% Since reshape works column-wise, bring image back to
% row-major order (transpose of 1st and 2nd dimension
% Result will be a height x width x numOutputChannels image matrix
img = permute(img, [2 1 3]);

imshow(img)

%%
%{
width = 10;
height = 10;
converted_image = zeros(height, width, 3);
cnt = 0;

for h = 1:height
    for w = 1:width
        converted_image(h, w, :) = [getRatio(image_datas(cnt + 1)); getRatio(image_datas(cnt + 2)); getRatio(image_datas(cnt + 3))];
            
        cnt = cnt + 3;
    end
end

imshow(converted_image)

function ret = getRatio(val)
    converted = rescale([0 val 255], 0, 1);   % 0～255を0～1に変換
    ret = converted(2);
end
%}