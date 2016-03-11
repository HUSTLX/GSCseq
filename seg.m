function segH=seg(img,labels)
opts=gscSeq.segOpts(); % You can use other methods such as gsc.opts() or gscSeq.opts();

% Customise the options if you need
% opts.postProcess=1;
opts.gcGamma=400;

% Intialize the segmentation object 
segH=gscSeq.segEngine(0,opts); % Again, you can use other methods such as gsc.segEngine() or
                           % gscSeq.segEngine(), but make sure you call the same
                           % package you used to build the options for

% preProcess image
segH.preProcess(im2double(img)); % Only takes in double images

% Get the first segmentation
ok=segH.start(labels);

% You can access the segmentation obtained using
% figure;
% imshow(segH.seg);