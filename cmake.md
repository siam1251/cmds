##### If any libray uses any other shared lib, then in it's cmake you have target that shared lib      
```
target_link_libraries(NNInferencer ${OPENCV_WORLD_LIB} HVisionLib  )
```
