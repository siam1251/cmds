#### for ddk 300, you need to spefify all the input and output nodes of the graph otherwise it will throw error    

#### convert a model to om    
```
./omg --model ./output_graph.pb --weight ./output_graph.pb --framework 3 --output ./out --input_shape "search_images:1,255,255,3" --input_shape "input_template:5,5,256,1" --out_nodes "detection/response:0" --out_nodes "output_embed:0"

```
