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
