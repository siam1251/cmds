
I built boost from source using 1.65
It has libboost_python3.so file and configured to use anaconda python3
It links perfectly however the so file gives a runtime error " undefined symbol: PyClass_Type"


But I installed boost from conda using:
conda install boost
It installed boost_python37 for python 3.7 and I linked them and it worked perfectly
