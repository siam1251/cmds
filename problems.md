# Problems that I could not solve at first attempt

#### 1. If the problems says that you have solve in n times and looks like it's not possilbe, most probably you have to use map.

### 1. Given an array of integers and an integer k, you need to find the total number of continuous subarrays whose sum equals to k.

Example 1:
Input:nums = [1,1,1], k = 2
Output: 2
Note:
The length of the array is in range [1, 20,000].
The range of numbers in the array is [-1000, 1000] and the range of the integer k is [-1e7, 1e7].
https://leetcode.com/problems/subarray-sum-equals-k/

```
class Solution {
public:
    int subarraySum(vector<int>& nums, int k) {
        int s = nums.size();
        std::map<int, int> tb;
        int cnt = 0;
        int sum = 0;
        tb[0] = 1;
        for(int i = 0; i < s; i++){
            int cur = nums[i];
            sum += cur;
            if(tb.count(sum-k) > 0){
                cnt+=tb[sum-k];
            }
            if(tb.count(sum) > 0){
                tb[sum] += 1;
            }else{
                tb[sum] = 1;
            }
        }
        
        
        return cnt;
    }
};
```
### problem list
https://leetcode.com/discuss/career/449135/how-to-effectively-use-leetcode-to-prepare-for-interviews

https://leetcode.com/discuss/career/448285/list-of-questions-sorted-by-common-patterns
