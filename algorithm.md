[common problems](#common_problems)     
[Reverse Iteration](#riteration)      
[Binary search](#bs)   
[Binary search finding median](#bs_median)    
[Binary search finding 3 elements](#bs_3_elements)     
[Bit operations](#bit)   
[QuickSort Partition](#quicksort)   
[Tree Iterator](#tree_iter)     
[Dynamic Problem](#dp)     
[Dynamic Problem space optimization](#dp_space)    
[Interview Tips](#interview)   



<a name="dived_conquer">    
	
### Divide and Conquer     

[link](https://geeksforgeeks.org/largest-rectangular-area-in-a-histogram-set-1/)  

<a name="riteration">     

### Reverse iteration   
#### c++ has a nice way of reverse iteration which resolve many complex problem into very simple      
```
v.rbegin()
v.rend()
```
Particularly binary search problem with reverse order can be solved easily  with this   

<a name="bit">     
	
### Bit operation   
#### warning (n&right) == right is not same as n&right== right !!!!     
Keep only the rightmost 1 and set all to zeros   
```
ans = x & -x;
```
Set the rightmost 1 to zeros   
```
ans = x & (x-1)
```
[reference](https://leetcode.com/articles/power-of-two/)    

<a name="bs">   

### Binary search lower and upper bound     
#### equal to c++ lower_bound and uppper_bound function       
#### To remember for ascending
```
target < nums[mid]
```
### for descending
```
target > nums[mid]
```

```
private int extremeInsertionIndex(int[] nums, int target, boolean left) {
        int lo = 0;
        int hi = nums.length;

        while (lo < hi) {
            int mid = floor(lo + (hi -lo) / 2);
            if (target < nums[mid] || (left && target == nums[mid])) {
                hi = mid;
            }
            else {
                lo = mid+1;
            }
        }

        return lo;
    }
    
```
### Binary search: lower_bound     



```
int lower_bound(int a[], int size, int v)
{
    int mid, low = 0, high = size - 1;
    while(low < high){
	mid = low + (high - low) / 2;
	if(a[mid] >= v)
	    high = mid;
	else
	    low = mid + 1;
    }
    if(a[low] == v)
	return low;
    else
	return -1;
}

```
##### binary search: upper_bound    

```
int upper_bound(int a[], int size, int v)
{
    int mid, low = 0, high = size - 1;
    while(low < high){
	mid = low + (high - low + 1) / 2;
	if(a[mid] <= v)
	    low = mid;
	else
	    high = mid -1;
    }
    if(a[low] == v)
	return low;
    else
	return -1;
}

```
#### binary search normal     
```
int bsearch(int a[], int size, int v)
{
    int mid, low = 0, high = size - 1;
    while(low <= high){
	mid = low + (high - low) / 2;
	if(a[mid] == v)
	    return mid;
	else if(a[mid] < v)
	    low = mid + 1;
	else
	    high = mid - 1;
    }
    return -1;
}
```

<a name="bs_median">   

### Binary search finding median    

choosing left and right is very important     
right should be out of range, so initial assignment     
```
right = nums.size()
```
and always asignment of right will be out of range   
```
while(left < right)
```

<a name="quicksort">   

### QuickSort partition    
```
int partition(vector<int>& nums, int l, int r){
        int p = l + (r-l)/2;
        swap(nums[r], nums[p]);
        int pivot = nums[r];
        int i = l;
        for(int j = l; j < r; j++){
            if(nums[j]<pivot){
                swap(nums[j], nums[i]);
                i++;
            }
        }
        swap(nums[i], nums[r]);
        return i;
    }
```


<a name="bs_3_elements">     
	
## Finding 3 elements problem     
#### First sort the elements and keep one element fixed, from there find the sub-problem    
##### For example finding the valid triangle problem, You have two things    
1. One triangle side is the largest, so start from last element and keep it fixed (last element is the largest)   
2. Then you have to find pair of two sides which are larger than the fixed side !! Yahoo!! done   
```
int triangleNumber(vector<int>& nums) {
        int cnt = 0;
        sort(nums.begin(), nums.end());
        for(int i =  nums.size()-1; i >= 0; i--){
            
                int l = 0, r = i-1;
                int c = nums[i];
                while(l < r){
                    int s = nums[l]+nums[r];
                    if(c >= s){
                        l++;
                    }else{
                        cnt += r-l;
                        r--;
                    }
                    
                }
            
        }
        return cnt;
}
```
#### Second, keep one element fixed    
#### Third, choose left and right and check until left < right    

<a name="union_find">     

### Union-Find     

```
class Solution {
    vector<int> parents;
    vector<int> cnt;
    int find(int v){
        int p = parents[v];
        if(p != v){
           p = find(p);
            //shortcut
           parents[v] = p;
        }
        return p;
    }
    bool add(int v1, int v2){
        int p1 = find(v1);
        int p2 = find(v2);
        if(p1 == p2) return false;
        if(cnt[p1] > cnt[p2]){
            cnt[p1]+= cnt[p2];
            cnt[p2] = 0;
            parents[p2] = p1;
        }else{
            cnt[p2]+= cnt[p1];
            cnt[p1] = 0;
            parents[p1] = p2;
        }
        return true;
    }
public:
    bool validTree(int n, vector<vector<int>>& edges) {
        parents.resize(n, 0);
        cnt.resize(n, 1);
        iota(parents.begin(), parents.end(), 0);
        for(auto &e : edges){
           if(add(e[0], e[1]) == false) return false;
        }
        int p = find(0);
        for(int i = 1; i < n; i++){
            if(find(i) != p) return false;
        }
        return true;
    }
};
```
<a name="tree_iter">    
	
### Implement Tree iterator (Using stack to emulate recursion)    

#### Inorder traversal iterator   

##### Fist look at the tree traversal using recursion     
```
void Rec(TreeNode* r){
	if(r){
		Rec(r->left);
		print(r->val);
		Rec(r->right);
	}
}
```
In the above code, copiler will push these instruction in stack (in reverse order, last instruction first and so on)  
So, the stack insertion will be something like below   

st.push(Rec(r->right))
st.push(print(r->val))
st.push(Rec(r->left))

We will emulate the same thing in our code 

```
class BSTIterator {
    struct State{
        State(TreeNode* node, bool p):r(node), print(p){}
        TreeNode* r;
        
        bool print = false;
    };
    stack<State> st;
public:
    BSTIterator(TreeNode* root) {
        if(root){
           insert(root);
        }
    }
    void insert(TreeNode* r){
        if(r->right){
            st.push(State(r->right, false));
        }
        st.push(State(r, true));
        if(r->left)
            st.push(State(r->left, false));
    }
    /** @return the next smallest number */
    int next() {
        
        while(st.size()){
            auto top = st.top();
            st.pop();
            if(top.print){
                return top.r->val;
            }else{
                insert(top.r);
            }
           
        }
        return -1;
    }
    
    /** @return whether we have a next smallest number */
    bool hasNext() {
        return st.size();
    }
};
```

<a name="dp">     

## dynamic programming      

1. First figure out it has sub problem   
2. Define state (find complexity from possible states)  
3. If you see you can build from middle, meaning you can also start from both end and squeeze [problem](https://leetcode.com/problems/longest-palindromic-subsequence/)
4. You may also reduce the number of state by figuring out these states are actully same [problem](https://leetcode.com/problems/greatest-sum-divisible-by-three/)
5. You may have define a state, that takes the corresponding element too. Like LIS, LCS or others [problem](https://leetcode.com/problems/longest-arithmetic-subsequence/)

<a name="interview">      
	
	
## Interview Tips    

#### 1: if too complex logic brings little efficiency then go for simple logic      
#### 2: Do not go with the complex logic, implement the simple one first and at the end mention the complex one (don't code the complex one)     
#### 3: Binary tree problems code will be less than 4-5 lines, so spend more time on the whiteboard or building the actual idea [problem](https://leetcode.com/problems/distribute-coins-in-binary-tree/submissions/)        
 
 #### 4: Do not write code from memory (memorise tricks but the the code)    
 ## Complexity Analysis    
 #### 1: O(n^(n/m) runtime for this [problem](https://leetcode.com/problems/combination-sum/). In backtracking if you have option to use loop use loop that way you reduce the depth i.e reducing the call back stack memory also helps it to analyze the complexity well.
 
 
 <a name="common_problems">      
 
 ## Interview leetcode problems    
 #### Binary Search   
 1. [rotated bs array](https://leetcode.com/problems/search-in-rotated-sorted-array/)     
 
<a name="dp_space">     

## dynamic programming space optimization    

##### To evaluate the current state_i how manay previous states you need?
##### If you only look back only few last states (2), then you can optimize the space
##### However if it's like 0-1 knapsac then you cannot optimize

##### Another way to optimize is to look the state(i,j), can you convert the state space to only state(i) or state(j)
