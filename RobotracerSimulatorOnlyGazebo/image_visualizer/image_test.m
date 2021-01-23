test_image = zeros(2, 2, 3);

res = rescale([0 125 255], 0, 1);
test_image(1, 1, 1) = res(2);
test_image(1, 1, 2) = res(2);
test_image(1, 1, 3) = res(2);

imshow(test_image)