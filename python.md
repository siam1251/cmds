make sure input width height match with videowriter input width and height
```
fourcc = cv.VideoWriter_fourcc(*'mp4v')
w = video_capture.get(cv.CAP_PROP_FRAME_WIDTH)
h = video_capture.get(cv.CAP_PROP_FRAME_HEIGHT)
print("height, width")
print(w, h)
out = cv.VideoWriter('output.mp4',  fourcc, 30, (int(w),int(h)))
```
