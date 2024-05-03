
% Ensure Python is installed and properly configured with MATLAB
if count(py.sys.path,'') == 0
    insert(py.sys.path,int32(0),'');
end

% Import necessary Python modules
py.importlib.import_module('cv2');
py.importlib.import_module('numpy');

% Load YOLO
net = py.cv2.dnn.readNet("C:\Users\hp\yolov3.weights","C:\Users\hp\yolov3.cfg");

% Load image
img = py.cv2.imread("C:\Lokesh\Minor 2_Nvidia\Very_low_Exposure_Image\Pictures\istockphoto-611295844-612x612.jpg");
img = py.cv2.resize(img, (320, 320));

% Detect objects
blob = py.cv2.dnn.blobFromImage(img, 0.00392, (320, 320), (0, 0, 0), True, crop=False);
net.setInput(blob);
outs = net.forward(get_output_layers(net));

% Display detected objects
for out in outs:
    for detection in out:
        scores = detection[5:]
        class_id = np.argmax(scores)
        confidence = scores[class_id]
        if confidence > 0.5:
            print('Object detected')
