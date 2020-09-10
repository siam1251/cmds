#### for ddk 300, you need to spefify all the input and output nodes of the graph otherwise it will throw error    

#### convert a model to om    
```
./omg --model ./output_graph.pb --weight ./output_graph.pb --framework 3 --output ./out --input_shape "search_images:1,255,255,3" --input_shape "input_template:5,5,256,1" --out_nodes "detection/response:0" --out_nodes "output_embed:0"


 tflite_convert  --graph_def_file=output_graph.pb --output_file=output.tflite  --output_format=TFLITE  --input_shapes=1,255,255,3 --input_arrays=search_images --output_arrays=output_embed,detection/response --allow_custom_ops
 
  ./omg --om out.om --json abc.json --mode 1

```
