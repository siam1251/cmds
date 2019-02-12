import tensorflow as tf
import sys
#Create a graph def object to read the graph
print(sys.argv[1])
with tf.gfile.GFile( str(sys.argv[1]), "rb") as f:
    graph_def = tf.GraphDef()
    graph_def.ParseFromString(f.read())

#Construct the graph and import the graph from graphdef
with tf.Graph().as_default() as graph:
    tf.import_graph_def(graph_def)
    for op in graph.get_operations():
        print ("Operation Name :",op.name)         # Operation name
        print ("Tensor Stats :",str(op.values()))  
