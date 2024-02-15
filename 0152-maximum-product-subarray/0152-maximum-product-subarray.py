class Solution:
    def maxProduct(self, nums: List[int]) -> int:
        max_prod = min_prod = result = nums[0]
        
        for  i in range(1, len(nums)):
            temp = max_prod
            max_prod = max(nums[i], nums[i]*max_prod, nums[i]*min_prod)
            min_prod = min(nums[i], nums[i]*temp, nums[i]*min_prod)
            result = max(result, max_prod)
                
        return result
            