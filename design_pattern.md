
### Functional vs Object oriented     

#### Functionl best fits when you need data transformation, input arr and output is squared of inputs    
#### Functional (you can remember things by using clousure)     
```
def Friend(friend_names):
  def is_my_friend(name):
    return name in friend_names
  def instance(method, *args):
    if method == 'is_friend_of':
      return is_my_friend(*args)
 return instance
buddy = Friend(['alan', 'alonzo'])
buddy('is_friend_of','guy') # False
```

#### Object oriented     
```
class Friend:
 def __init__(self, friends):
 self.friends = friends
def is_friend_of(self, name):
 return name in self.friends
```
