# Modern C++

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
