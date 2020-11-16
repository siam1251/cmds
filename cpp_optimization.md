
```
#include <vector>
#include <string>
using namespace std;

struct A{
 int x = 0;
 int y = 0;
 A(){
  cout<<"constructor"<<endl;
 }
 A& operator=(const A& a){
  cout<<"copy assignment"<<endl;
  x = a.x;
   y = a.y;
  return *this;
}

A& operator=(A&& a){
  cout<<"move copy assignment"<<endl;
  x = std::move(a.x);
  y = move(a.y);
 return *this;
}
 A( A&& a){
  cout<<"move constructor"<<endl;
  x = move(a.x);
  y = move(a.y); 
}
A(A& a){
cout<<"copy constructor"<<endl;
this->x = a.x;
this->y = a.y;
}
};

A func(A a){
 //will call move operator
 return a;
}
A func3(){

 //will do RVO .. return value optimization
 return A();
}
```

A func2(){
 A a;
 //will do NRVO .. name return value optimization
 return a;
}

int main(){
 A aa;
 aa.x = 10;
 aa.x = 20;
 A a = func(aa);
 cout<<a.x<<" ,"<<a.y<<endl;
 return 0;
}
