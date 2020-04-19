[Binary search](#bs)   
<a name="bs">   
	
### Binary search: lower_bound     

```
int bsearch_low(int a[], int size, int v)
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
int bsearch_high(int a[], int size, int v)
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
