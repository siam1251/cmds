[Binary search](#bs)   
[Binary search finding median](#bs_median)    
[Binary search finding 3 elements](#bs_3_elements)     
[Bit operations](#bit)   
[QuickSort Partition](#quicksort)   


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
#### First sort the elements    
#### Second, keep one element fixed    
#### Third, choose left and right and check until left < right    

