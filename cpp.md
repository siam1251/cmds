## Table of Contents  
[String](#string)  
[shared_lock vs lock](#lock)  
[Thread wait and wait_until](#thread)  
[Modern C++](#modern)  
[Time duration chrono](#chrono)  
[unorderd_map](#unordered_map)   
 

<a name="string">    
	
### Erase a substring from a string     
```
#include <algorithm>
str.erase(std::remove(str.begin(), str.end(), 'a'), str.end());
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
size_t pos = data.find(toSearch);
 
	// Repeat till end is reached
while( pos != std::string::npos)
{
	// Replace this occurrence of Sub String
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
 
  // Only one thread/writer can increment/write the counter's value.
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
#include <stdio.h>
#include <iostream>
#include <map>
#include <unordered_map>
#include<functional>
#include<memory>

struct A{
    A(int i):x(i){}
    A(){}
    int x = -1;
    int z = -1;
    // this one is needed for map
    bool operator<(const A& rhs)const{return x < rhs.x;}
    // this one is needed for unordered_map
    bool operator==(const A& rhs)const{return x == rhs.x;}
    
};
// this one is needed for unordered_map
struct KeyHasher
{
  std::size_t operator()(const A& k) const
  {
    

    return std::hash<int>()(k.x) << 1;
    // or complex hash
    return ((hash<string>()(k.first)
               ^ (hash<string>()(k.second) << 1)) >> 1)
               ^ (hash<int>()(k.third) << 1);
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
    mp2[*a1.get()] = 10;
    auto it2 = mp2.find(*a2.get());
    if(it2 != mp2.end())std::cout<<it2->second<<std::endl;
    return 0;
    }
```
