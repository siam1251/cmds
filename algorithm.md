[common problems](#common_problems)     
[Reverse Iteration](#riteration)      
[Binary search](#bs)   
[Binary search finding predessor](#bs_predessor)    
[Binary search finding median](#bs_median)    
[Binary search finding 3 elements](#bs_3_elements)     
[Bit operations](#bit)   
[QuickSort Partition](#quicksort)   
[Quick Select Algorithm](#quick_select)    
[Tree Iterator](#tree_iter)     
[Dynamic Problem](#dp)     
[Dynamic Problem space optimization](#dp_space)    
[Backtracking top-down or bottom up](#back_tracking)    
[Interview Tips](#interview)   
[Union find, set algorithm](#union_find)    
[Topological sort (kahn algorithm)](#topological_sort)     
[Bucket sort](#bucket_sort)     
[Heap algorithm](#heap)  
[Approching any unknown problem](#unknown)  
[LinkedList](#linkedlist)   
[Approching Any unknown problem](#unknown)        


Knuth-Morris Pratt (kmp algorithm) [my code link](https://github.com/siam1251/algorithms/blob/master/algorithm%20interview/KMP.cpp)                   
<a name="bs_predessor">           

#### Finding a successor or predessor of a given node        
   the path we traversed will must have predessor or sucessor 
```
pair<TreeNode*, TreeNode*> successor(TreeNode* root, TreeNode* p){
        if(root){
            TreeNode* mx_node = nullptr, *min_node = nullptr;
            if(p->val < root->val){
                tie(mx_node, min_node) = successor(root->left, p);
                //cout<<mx_node->val<<endl;
                if(!result && mx_node == p) result = root;
                if(min_node == nullptr) min_node = root; 
            }else{
                tie(mx_node, min_node) = successor(root->right, p);
                if(root == p && min_node && !result) result = min_node;
                if(mx_node == nullptr) mx_node = root;
            }
            return {mx_node, min_node};
        }
        return {nullptr, nullptr};
    }
```
[link](https://www.youtube.com/watch?v=5cPbNCrdotA&t=13s)
```
	//Function to find Inorder Successor in a BST
struct Node* Getsuccessor(struct Node* root,int data) {
	// Search the Node - O(h)
	struct Node* current = Find(root,data);
	if(current == NULL) return NULL;
	if(current->right != NULL) {  //Case 1: Node has right subtree
		return FindMin(current->right); // O(h)
	}
	else {   //Case 2: No right subtree  - O(h)
		struct Node* successor = NULL;
		struct Node* ancestor = root;
		while(ancestor != current) {
			if(current->data < ancestor->data) {
				successor = ancestor; // so far this is the deepest node for which current node is in left
				ancestor = ancestor->left;
			}
			else
				ancestor = ancestor->right;
		}
		return successor;
	}
}
struct Node* FindMin(struct Node* root) {
	if(root == NULL) return NULL;
	while(root->left != NULL)
		root = root->left;
	return root;
}
```
#### Reverse Polish Notation for expression evaluation [my code](https://github.com/siam1251/algorithms/blob/master/algorithm%20interview/RPN_reverse_polish_notation.cpp)               

<a name="interview">      
	
	
## Interview Tips    

##### : cannot think of anything, try finding subproblem or divide and conquer [link](https://leetcode.com/problems/arithmetic-slices/)            
##### : New subproblem may be dependendent on many other subproblems or on a single subproblem [link](https://leetcode.com/problems/burst-balloons/)                  
##### : can you send them to same bucket by applying  has to the values?
##### : If index is not clear draw it (do not skip it will come back again)
#### 1: if too complex logic brings little efficiency then go for simple logic      
#### 2: Do not go with the complex logic, implement the simple one first and at the end mention the complex one (don't code the complex one)     
#### 3: Binary tree problems code will be less than 4-5 lines, so spend more time on the whiteboard or building the actual idea [problem](https://leetcode.com/problems/distribute-coins-in-binary-tree/submissions/)        
 
 #### 4: Do not write code from memory (memorise tricks but the the code)    
 ## Complexity Analysis    
 #### 1: O(n^(n/m) runtime for this [problem](https://leetcode.com/problems/combination-sum/). In backtracking if you have option to use loop use loop that way you reduce the depth i.e reducing the call back stack memory also helps it to analyze the complexity well.
 
 

### Matrix problem    
  if you can solve the same problem for an arry then you can just extend this to marix (take up and down to point all possible combinations of all rows)
  [count submatrices](https://leetcode.com/problems/count-submatrices-with-all-ones/)               
  [max sum matrix](https://leetcode.com/problems/max-sum-of-rectangle-no-larger-than-k/)            
  
  
### Finding a distance from source to destination            
 
 * if all the costs of the connections are same that is going from one node to another is same you can apply BFS otherwise you have apply Dijkstrs's algorithm  
### Common Algorithm source code    

[DFS_recursion](https://github.com/siam1251/algorithms/blob/master/algorithm%20interview/DFS_recursion.cpp)

<a name="segment">
	
#### Segment tree  
[shafayet blog](http://www.shafaetsplanet.com/planetcoding/wp-content/uploads/2014/08/2014-08-19-17.08.10.jpg)              

[segment tree code (Binary indexed tree)](https://github.com/mission-peace/interview/blob/master/src/com/interview/tree/SegmentTreeMinimumRangeQuery.java)
[my link](https://github.com/siam1251/algorithms/blob/master/algorithm%20interview/BIT_segment_tree.java)    


<a name="heap">  
	
#### Heap algorithm  
[heap code](https://github.com/siam1251/algorithms/blob/master/algorithm%20interview/heap.py)


<a name="linkedlist">           
	  
#### LinkedList                 
we can solve any linkedlist problem using the following approach    
	
* Two pointers is the most important technique [link](https://leetcode.com/problems/intersection-of-two-linked-lists)        
* Reversing the pointers   
* Reversing values if poisitive make neagative [link](https://leetcode.com/problems/intersection-of-two-linked-lists)         
* keeping a dummy node             
	
	
	

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
	
* lower_bound: (position-1) where all the elements are strictly smaller than target
* when lower_bound() == upper_bound, target does not exist 
* upper_bound: from (position) all the elements are strictly greater  than target
* Binary search lower and upper bound     
* equal to c++ lower_bound and uppper_bound function       
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
<a name="quick_select"> 
	
### Quick Select algorithm     

```
int partition(int l, int r, vector<int>& nums, int pivot){
	swap(nums[pivot], nums[r]);
	int j = l;
	for(int i = l; i < r; i++){
	    if(nums[i] < nums[r]){
		swap(nums[i], nums[j]);
		j++;
	    }
	}
	swap(nums[j], nums[r]);
	return j;
}
int quickSelect(vector<int>& nums, int k){
        int l = 0, r = nums.size()-1;
        while(l < r){
            int pivot = l + rand()%(r-l+1);
            
            pivot = partition(l, r, nums, pivot);
            if(pivot == k) return nums[k];
            else if(pivot < k){
                l = pivot+1;
            }else {
                r = pivot-1;
            }
        }
        return nums[l];
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
Time complexity:
```
Algorithm	Average		Worst case
Space		O(n)[1]		O(n)
Search		O(α(n))		O(α(n))
Merge		O(α(n))		O(α(n))
DFS with coloring would take O(V+E) vs union find would take O(ElogV) reference:
```
 where α(n) is the extremely slow-growing inverse Ackermann function. In fact, α(n) is less than 5 for any practical input size n, since A(4, 4) is on the order of {\displaystyle 2^{2^{2^{2^{16}}}}}2^{2^{2^{2^{16}}}}.
```
class Solution {
    vector<int> parents;
    vector<int> sizes;
    int find(int p){
       
        if(parents[p] != p){
	   //shortcut	
           parents[p] = find(p);
           p = parents[p];
        }
        return p;
    }
    bool add(int v1, int v2){
        int p1 = find(v1);
        int p2 = find(v2);
        if(p1 == p2) return false;
	// make p1 greater than p2
        if(size[p1] < size[p2]){
           swap(p1, p2);
        }
	parents[p2] = p1;
	sizes[p1] += sizes[p2];
	
        return true;
    }
public:
    bool validTree(int n, vector<vector<int>>& edges) {
        parents.resize(n, 0);
        sizes.resize(n, 1);
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
```
st.push(Rec(r->right))
st.push(print(r->val))
st.push(Rec(r->left))
```
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


 
 <a name="common_problems">      
 
 ### Hash Map   
  group the words together where in each group all the words has same isomorphic structure
  ```
  	Input: ["apple", "apply", "dog", "cog", "romi"]
	Output: [["dog", "cog"], ["romi"], ["apple", "apply"]]
```
  
 ## Interview leetcode problems    
 #### Binary Search   
 1. [rotated bs array](https://leetcode.com/problems/search-in-rotated-sorted-array/)     
 
<a name="dp_space">     

## dynamic programming space optimization    

##### To evaluate the current state_i how manay previous states you need?
##### If you only look back only few last states (2), then you can optimize the space
##### However if it's like 0-1 knapsac then you cannot optimize

##### Another way to optimize is to look the state(i,j), can you convert the state space to only state(i) or state(j)

<a name="back_tracking">

## Backtracking

#### You may try both ways to see which one works
    #### Fist try top-down
    #### then try bottom-up  
    #### for back-tracking you don't have same sub-problem as in DP because each state is completely different so you dont have common subproblems
    
    
<a name="topological_sort"> 

### Topological Sort     

```
vector<int> topSort()  {
  queue<int> Q;
  for(int i=1; i<=n; i++) {
    if(inDegree[i] == 0)  {
      Q.push(i);
    }
  }
  vector<int> res;
  while(not Q.empty())  {
    int now = Q.front();
    res.push_back(now);
    for(int next: graph[now]) {
      if(inDegree[next] > 0)  {
        inDegree[next]--;
        if(inDegree[next] == 0) {
          Q.push(next);
        }
      }
    }
  }
  return res;
}
```

#### Number of sub-matrix in a Matrix     

```
private int helper(int[] A) {

	int[] sum = new int[A.length];
	Stack<Integer> stack = new Stack<>();

	for (int i = 0; i < A.length; ++i) {

		while (!stack.isEmpty() && A[stack.peek()] >= A[i]) stack.pop();

		if (!stack.isEmpty()) {
			int preIndex = stack.peek();
			sum[i] = sum[preIndex];
			sum[i] += A[i] * (i - preIndex);
		} else {
			sum[i] = A[i] * (i + 1);
		}

		stack.push(i);
	}

	int res = 0;
	for (int s : sum) res += s;

	return res;
}
```
<a name="bucket_sort">

### Bucket sort     


##### if any range is small then try changing the input dimension to frequency dimension  



<a name="unknown">   

### Approching Any unknown problem   
	
#### Sorting      

	* if you don't need position information, try sorting        
	
* Pattern matching (try to match the pattern with previous problems)
* start from base case, can you build up n from n-1  
* Simplify and now look for matching with algorithm
* 
