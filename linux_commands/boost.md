
I built boost from source using 1.65
It has libboost_python3.so file and configured to use anaconda python3
It links perfectly however the so file gives a runtime error 
```
undefined symbol: PyClass_Type
```


But I installed boost from conda using:
conda install boost
It installed boost_python37 (boost 1.71) for python 3.7 and I linked them and it worked perfectly

What I think is boost 1.71 is only compatible to python 3.7!!!!

I even checked to build boost 1.65 with different parameter but did not work 
```
./b2 install --prefix=PREFIX python=3.7
```
I think you have to build 1.71 to work with python 3.7 so best to install using conda or pip
