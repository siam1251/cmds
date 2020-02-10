### Erase a substring from a string  

<a name="string">    
	
### Erase a substring from a string     
```
#include <algorithm>
str.erase(std::remove(str.begin(), str.end(), 'a'), str.end());
```
### Replace all occurance    
```
#include <algorithm>
#include <string>

void some_func() {
  std::string s = "example string";
  std::replace( s.begin(), s.end(), 'x', 'y'); // replace all 'x' to 'y'
}
```
### split a string by delimeter

```
stringstream ss(str); // Turn the string into a stream.
string tok;
while(getline(ss, tok, delimiter)) {
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


<a name="thread">   
	
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
