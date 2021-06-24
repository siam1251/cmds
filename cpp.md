## Table of Contents  
[C++ lambda](#cpp_lambda) 
[C++ erase, remove_if, container basics](#cpp_basics)    
[String](#string)  
[shared_lock vs lock](#lock)  
[Thread, wait and wait_until](#thread)   
[std::aync](#async)              
[Modern C++](#modern)  
[Time duration chrono](#chrono)  
[map, set, multimap, multiset, unordered_map](#map_set_multimap)   
[unorderd_map](#unordered_map)   
[C++ lambda vs python](#cpp_lambda)    
[C++ iterface class](#cpp_interface)    
[C++ Operators](#cpp_operators)    
[C++ Memory tracking](#mem_track)    
[copy ellision, move assignmet, move constructor](#copy_ellision)    

### C++ 17 if initialization      

```
if(int i = 0; i == 0) printf("condition satisfied");
```

```
if(int i = 0 && i == 0) printf("condition not satisfied");
```
There will be only one line of initialization
```
if(int i = 0, j = 3; j == 3 && i == 0) printf("condition satisfied");
```

### Do not delete the iterator    
NO NO
```
list<int> lst;
multiset<list<int>::iterator> m_set;
auto it = prev(lst.end());
lst.pop_back()// runtime error
m_set.erase(it)// runtime error because it will compare the value at that iterator
```

### VScode with gtags
install gtags in linux       
go to project folder:        
run: gtags            

### find_first_of, find_first_not_off          
Finds the first character equal to one of the characters in the given character sequence.
```
std::string str = std::string("Hello World!");
// strings and chars to search for
std::string search_str = std::string("o");
std::cout << str.find_first_of(search_str) << '\n';
```
#### all_of, any_of, none_of    
```
all_of(s.begin(), s.end(), ::isdigit)
```
#### Bit operation

Turn off rightmost set bit
```
n &= (n - 1) // using AND
```
Keep the rightmost set bit

```
x &= (-x) // using AND and reverse
// or
x &= (~x + 1) //because -x = ~x+1
```

Get postion of rightmost set bit

```
log2(n & -n); + 1 
```

### common syntax to remember      
#### priority queue
```
 auto f = [](auto &a, auto& b){ return a < b;}; //reverse of sorting comparator 
 priority_queue< int, vector<int>, decltype(f)> q(f);
```

<a name="cpp_lambda">     

### C++ lambda vs python    
transform == map     
accumulate == reduce    
copy_if  == filter     


<a name="cpp_basics">    
	
	
### C++ erase, remove_if, container basics     

##### You can only erase an element from its  member function only (obj.erase) 
##### When you pass iterator, you cannot change array structure !!!       
##### or passing container itself by reference erase(obj), inside erase function it will call member obj.erase  

```
auto it = remove_if(S.begin(), S.end(), [&mp](const char & c){ return mp[c-'a'] == 1;});
S.erase(it, S.end());

```


<a name="iterator">     
	
### Iterator and invalidation       
you should always assign to the return value of erase()
```
it = numbers.erase(it);
```
```
for (auto it = numbers.begin(); it != numbers.end(); ) {
    if (*it % 2 == 0) {
        it = numbers.erase(it);
    }
    else {
        ++it;
    }
}

```

<a name="string">    
	
### Substr   
```
 std::string a = "0123456789abcdefghij";
 
// count is npos, returns [pos, size())
std::string sub1 = a.substr(10);
std::cout << sub1 << '\n';

// both pos and pos+count are within bounds, returns [pos, pos+count)
std::string sub2 = a.substr(5, 3);
std::cout << sub2 << '\n';
```
### Erase a substring from a string     
```
#include <algorithm>
str.erase(std::remove(str.begin(), str.end(), 'a'), str.end());
```
### inserting a char or string     
```
s = s + char // this also works
s.insert(s.begin(), char) // for a char insert
s.insert(0, str) // for a string insert
s = s + str // this works
s.insert(0, 2, 'E'); // 2 times E will be inserted
```
### Replace all occurance of a char     
```
#include <algorithm>
#include <string>

void some_func() {
  std::string s = "example string";
  std::replace( s.begin(), s.end(), 'x', 'y'); // replace all 'x' to 'y'
  // not s.replace() that is differenct function
  
 // occurence of "abc" to "hij"
test.replace( test.find("abc"), 3, "hij");
while(auto index = test.find("abc") && index != std::string::npos){
	test.replace( test.find("abc"), 3, "hij");
}
```
### Replace all occurance of a string   
```
size_t pos = data.find("toSearch");
size_t pos = data.find("toSearch", from_position);
 
	// Repeat till end is reached
while( pos != std::string::npos)
{
	// Replace this occurrence of Sub String, repaceStr.size() == toSearch.size
	data.replace(pos, toSearch.size(), replaceStr);
	// Get the next occurrence from the current position
	pos =data.find(toSearch, pos + replaceStr.size());
}
```
### split a string by delimeter

```
stringstream ss(str); // Turn the string into a stream.
string tok;
while(getline(ss, tok, ' ')) {
    internal.push_back(tok);
}
```
### turn a string lowercase    
```
#include <algorithm>
#include <cctype>
#include <string>

std::string data = "Abc";
std::transform(data.begin(), data.end(), data.begin(),
    [](unsigned char c){ return std::tolower(c); });
```
### std::transform   
```
 std::vector<std::size_t> ordinals;
 std::transform(s.begin(), s.end(), std::back_inserter(ordinals),
                   [](unsigned char c) -> std::size_t { return c; });
```
### for C++ 11   
```
std::string data = "This is a sample string.";
 
// convert string to upper case
std::for_each(data.begin(), data.end(), [](char & c){
	c = ::toupper(c);
});
```


 
<a name="lock">   
	
## shared_lock:

```
// Multiple threads/readers can read the counter's value at the same time.
  unsigned int get() const {
    std::shared_lock lock(mutex_);
    return value_;
  }
 
  // Only one thread/writer can increment/write the counter's value unique_lock is available when none has acquired via shared_lock
  void increment() {
    std::unique_lock lock(mutex_);
    value_++;
  }
  
  ```
  The important thing is shared_lock is shared with other threads but since there is only one mutex (lock), 
  if shared_lock needs to acquire and if it able to acquire it can only share with shared_lock not with the unique_lock.
  
  The purpose is reading value by multiple threads won't hurt but at the time of changing value no other thread should
  able to read.
  
  <a name="thread">  

	  
  ## Thread       
	  ```
    std::thread t1; // t1 is not a thread
    std::thread t2(f1, n + 1); // pass by value
    std::thread t3(f2, std::ref(n)); // pass by reference
    std::thread t4(std::move(t3)); // t4 is now running f2(). t3 is no longer a thread
    std::thread t5(&foo::bar, &f); // t5 runs foo::bar() on object f
    std::thread t6(b); // t6 runs baz::operator() on a copy of object b
	  ```
  ## Wait_until:
  ```
   if(cv.wait_until(lk, std::chrono::system_clock::now()+std::chrono::microseconds(2000), [](){return i == 1;}))
        std::cerr << "Thread " << idx << " finished waiting. i == " << i << '\n';
    else
        std::cerr << "Thread " << idx << " timed out. i == " << i << '\n';
  ```
  wait_until works as below:
  ```
  while (!pred()) {
    if (wait_until(lock, timeout_time) == std::cv_status::timeout) {
       return pred();
    }
}
return true;

  ```
  
  ## wait:
  
  There is way big difference between wait_until vs wait that is wait_util doesn't wait anymore however wait continuesly wait until the pred function returns true;
  
  ```
  while (!pred()) {
    wait(lock);
}
  ```
  
 ## condition_variable_any
 if you use shared_lock and shared_mutex, you have to use condition_variable_any
 
<a name="modern">   
	
	
## Modern C++

### std::transform vs std::for_each
std::transform doesn't guarantee in order access means it may run in parallel based on the executation policy that you pass
while for_each access orderly and doesn't run in parallel


### map custom comparator

```
auto f = [](int a, int b){return a < b;};
map<char, bool, decltype(f)> mp(f);
```
#### Weird behavior, passing object properties as a parameter (int)
I was passing the object properties directly as a parameter like (this->controllerID) and It was crashing
However when I just passed as int id = this->controllerID and function(id), it resolved the problem (very weird)

### Tuple vs Tie
std::tie can be used to introduce lexicographical comparison to a struct or to unpack a tuple:


<a name="chrono">

### Evaluate execution time using chrono    

```
std::chrono::high_resolution_clock::time_point s = std::chrono::high_resolution_clock::now();					

    net_->Forward();
    std::chrono::high_resolution_clock::time_point e = std::chrono::high_resolution_clock::now();					
    int t = std::chrono::duration_cast<std::chrono::milliseconds>(e - s).count();
    printf("\n\n--------\n %s duration %d", this->name.c_str(), t);
```

<a name="unordered_map">   
	
### Unordered_map with hash function   

```
size_t operator()(const vector<int>& v) const{}
```
the last const is must   
```
#include <stdio.h>
#include <iostream>
#include <map>
#include <unordered_map>
#include<functional>
#include<memory>
using namespace std;
struct A{
    A(int i):x(i){}
    A(){}
    int x = -1;
    int z = -1;
    string first;
    string second;
    int third;
    // this one is needed for map
    bool operator<(const A& rhs)const{return x < rhs.x;}
    // this one is needed for unordered_map, bc when there is a conflict in key it checks equality
    bool operator==(const A& rhs)const{return x == rhs.x;}
    
};
// this one is needed for unordered_map
// another way to put inside std namespace, then you do not need to pass it 
namespace std{
	template<>
	struct hash<A>{
	    size_t operator()(const A& k)const{ return ..}
	};
}
struct KeyHasher
{
  std::size_t operator()(const A& k) const
  {
    

    return std::hash<int>()(k.x) << 1;
    // or complex hash
    return ((std::hash<string>()(k.first)
               ^ (std::hash<string>()(k.second) << 1)) >> 1)
               ^ (std::hash<int>()(k.third) << 1);
  }
};
using namespace std;
int main(int arch, char** argv)
{
    unordered_map<A, int,KeyHasher> mp = {{A(0), 100}, {A(1), 200}, {A(2), 300}, {A(3), 400}};
    unordered_map<A, int,KeyHasher>::iterator it = mp.find(A(1));
    //std::cout<<it->second<<std::endl;
    if(it != mp.end())std::cout<<it->second<<std::endl;
    
    std::shared_ptr<A> a1 = make_shared<A>(2);
    std::shared_ptr<A> a2 = make_shared<A>(2);
    A* a_raw1 = new A(100);
    A* a_raw2 = new A(100);
    if(a_raw1 == a_raw2){
      std::cout<<"two are equals"<<std::endl;
    }
    mp[*a1.get()] = 10;
    auto it2 = mp.find(*a2.get());
    if(it2 != mp.end())std::cout<<it2->second<<std::endl;
    return 0;
}
```
### typedef vs using     
#### using works best with template     
```
template<typename T1, typename T2> using Map = std::map<T1, std::vector<T2>>;
```

```
typedef [original-type] [your-alias]
typedef int Pixel;
typedef std::map<std::string, std::vector<std::string>> Map;
The other one, introduced in C++11, is with the using keyword:

using [your-alias] = [original-type];
using Pixel = int;
using Map   = std::map<std::string, std::vector<std::string>>;
```


<a name="map_set_multimap">     
	
## map, set, multimap, multiset, unordered_map, unordered_set     

#### While only unordered container uses hash to key values other uses Redblack tree to construct the containers    


<a name="cpp_operators">     
	
## Interface Class     
if a class is define virtual, the body must be there and it can be overriden in sub class.
For for interface, if you want not to add body of the function, you have to declare as pure      

```
virtual int f()=0;
```



<a name="cpp_operators>     


### C++ Operators    

#### Tracks memory allocation and deallocation   
```
void* operator new(size_t s){
	return malloc(s);
}
void operator delete(void* mem){
	free(mem);
}
```

<a name="mem_track">    
	
### Memory tracking     
```
void * operator new(std::size_t size) throw(std::bad_alloc) {
    // we are required to return non-null
    void * mem = std::malloc(size == 0 ? 1 : size);
    if(mem == 0) {
        throw std::bad_alloc();
    }
    (*get_map())[mem] = size;
    return mem;
}

void operator delete(void * mem) throw() {
    if(get_map()->erase(mem) == 0) {
        // this indicates a serious bug
        std::cerr << "bug: memory at " 
                  << mem << " wasn't allocated by us\n";
    }
    std::free(mem);
}
```


<a name="copy_ellision">    
	
### Copy Ellision     
##### Omits copy and move (since C++11) constructors, resulting in zero-copy pass-by-value semantics.	

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
```
##### Other common places where copy elision takes place is when a temporary is passed by value:
```
class Thing {
public:
  Thing();
  ~Thing();
  Thing(const Thing&);
};
void foo(Thing t);

foo(Thing());
```
##### copy ellision happens when exception is caught by value    

```int main() {
  try {
    foo();
  }
  catch(Thing c) {  
  }             
}
```
##### foo(A());// copy ellision so nothing will be called

#### foo(A &&a) is just a type saying that it will accept only rvalue
#### A(A && other)noexcept{} is move constructor  
#### A& operator=(A && other)noexcept{} is move copy constructor  
```
#include <iostream>
#include <cstring>

class A{
	
public:
	std::string m_name;
	A()=default;
	~A(){
		std::cout<<"destructor\n";
	}
	A(A && other)noexcept{
		std::cout<<"moved constructor\n";
		this->m_name = std::move(other.m_name);
		
		other.m_name = "value has been moved";
	}
	A& operator=(A && other)noexcept{
		std::cout<<"moved assignment\n";
		this->m_name = std::move(other.m_name);
		
		other.m_name = "value has been moved";
		return *this;
	}
};
// works both with rvalue and lvalue

// void foo(A b){
// 	std::cout<<"foo: copy "<<b.m_name<<"\n";
// 	//move constructor will be called
// 	//std::cout<<a.c<<std::endl;
// }
// works only with lvalue
void foo(A &b){
	std::cout<<"foo: reference "<<b.m_name<<"\n";
	//move constructor will be called
	//std::cout<<a.c<<std::endl;
}
// works only with rvalue
void foo(A &&b){
	std::cout<<"foo: rvalue "<<b.m_name<<"\n";
	//move constructor will be called
	//std::cout<<a.c<<std::endl;
}
int main(){
  A a;
  a.m_name = "apple";
  foo(A());// copy ellision so nothing will be called
  foo(std::move(a)); // this is type casting, so won't call move operators
  std::cout<<"a: "<<a.m_name<<"\n";
  //A aa = std::move(a);
  A b; b.m_name = "orange";
  // a.assign(b);
  a = std::move(b); // move assignment will be invoked not move constructor
  std::cout<<"a: "<<a.m_name<<"\n";
  std::cout<<"b: "<<b.m_name<<"\n";
  return 0;

}



```

<a name="async">      
### std::Async         
	
[leetcode link](https://leetcode.com/problems/web-crawler-multithreaded/)	 
```
 
class Solution {
    public:
    struct A{
        vector<string> crawl(HtmlParser htmlParser, string url){
            return htmlParser.getUrls(url);
        }
    };
    string getHost(string url){
        size_t pos = url.find('/',7);
        if(pos != string::npos){
            string host = url.substr(0,pos);
            
            return host;
        }else return url;
    }
    unordered_set<string> visited;
    queue<string> q;

    vector<string> crawl(string startUrl, HtmlParser htmlParser) {
        string host = getHost(startUrl);
        vector<string> ret_results;
        q.push(startUrl);
        visited.insert(startUrl);
        queue<future<vector<string>>> results;
        while(q.size() || results.size()){
            while(q.size() == 0 && results.size()){
              results.front().wait();
               // future<vector<string>> future_result = move(results.front());
               //  results.pop();
                
               
                for(string str: results.front().get()){
                   
                    //cout<<str<<","<<getHost(str)<<":"<<host<<endl;
                    if(str.size() && visited.count(str) == 0 && getHost(str) == host){
                        
                        visited.insert(str);
                        
                        q.push(str);
                    }
                        
                }
              
                results.pop();
                
            }
            if(q.size() == 0)break;
            string front = q.front();
            ret_results.push_back(front);
            //cout<<front<<endl;
            q.pop();//&X::foo, &x,
            A a;
            auto ret = std::async(std::launch::async, &A::crawl, a, htmlParser, front);
            //auto ret = async(&Solution::crawl, this, htmlParser, front);
            results.push(move(ret));
        }
         return ret_results;
    }
    
   
};
```

#### static, inline, static inline, normal function

##### normal function: they get exported to other TU ( transaltion units or source file)
##### static function: they don't get exported to other TU ( transaltion units) 
##### static inline function: they don't get exported to other TU ( transaltion units) 
##### inline function: it tells the compiler to replace with original code in wherever it is called 

###### A translation unit is the basic unit of compilation in C++. It consists of the contents of a single source file, plus the contents of any header files directly or indirectly included by it, minus those lines that were ignored using conditional preprocessing statements.
