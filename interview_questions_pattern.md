### Quick coding style    

* Use enum whenver is possible
* Use class whenever is possible

### Quick Algorithm tips    

* If state representation is easy then bottom-up dp is also easy  
* start bottom-up from the opposite end of top-down  
* Start not only from a given position, try from end or from start

### if you need a sorting window which is removing from end    

* use set or multiset or map (every operation is log N which uses KD tree inside)   
* 
### AD hoc   
 [bulb switcher](https://leetcode.com/problems/bulb-switcher/)    
### stack pattern     
try both using stak and recursion
[exclusive function duration](https://leetcode.com/problems/exclusive-time-of-functions/)

### Binary Search Pattern  
finding some value that satisfies the conditons     
[minimum eating bananas](https://leetcode.com/problems/minimum-add-to-make-parentheses-valid/)        
[minimize max distance](https://leetcode.com/problems/minimize-max-distance-to-gas-station/)     

finding two elements from two sorted arrays that are closest [link](https://leetcode.com/problems/shortest-word-distance-ii)            

### Hashing pattern
put all the elements into the same bucket        
[group shifted strings](https://leetcode.com/problems/group-shifted-strings/)  

### Greedy pattern    
if there are schedules of time          
[employee free time](https://leetcode.com/problems/employee-free-time/)    
best choice at each state      
[gas station](https://leetcode.com/problems/gas-station/) similar approach maximum subarray sum  [kadane algorithm](https://en.wikipedia.org/wiki/Maximum_subarray_problem)                 
apply DP algorithm with greedy!!     
[jump game](https://leetcode.com/problems/jump-game/)     



### Bucket sort or counting sort pattern  

* If there is another feature where the value ranges are small (0-1000) then probably try buckek or counting sort     
* If there is a time series
*  [meeting rooms](https://leetcode.com/problems/meeting-rooms-ii/)      

### Creating O(1) access, insert, delete, search using Hashmap, vector, list, set    
* Ask the following questings

   * finding anything in constant time, use map or set
  * How to erase an element constant time (linkedlist)
  * Is order required in linkedlist or vector
  * you can pop last element from vector in constant time
  [insert delet getRandom](https://leetcode.com/problems/insert-delete-getrandom-o1-duplicates-allowed/)
 
