function recog = recog()
for i=1:3
imgs(i,:)=strcat('iris', num2str(i), '.jpg');
disp(strcat("adding file ", imgs(i,:)))
end

% [temp, task] = createiristemplate('iris1.jpg');



disp("select a file for matching");
filename = uigetfile();

[filetemp, filemask] = createiristemplate(filename)

hd = 100000000000000;
hdi = -1;

for i=1:3
	disp(strcat("creating iris template for :", imgs(i,:)))
	[temp1, mask1] = createiristemplate(imgs(i,:));
	nhd = gethammingdistance(filetemp, filemask, temp1, mask1, 0);
	if nhd < hd
		hd = nhd;
		hdi = i;
	end
end

disp(hdi)
imshow(imread(imgs(hdi,:)))

% for i=1:3
% 	[temp1, mask1] = temps{i};
% 	nhd = gethammingdistance(filetemp, filemask, temp1, mask1, 0);
% 	if(nhd < hd)
% 		hdi = i
% 	end
% end

