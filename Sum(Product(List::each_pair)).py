def ordinary(a):
    n = len(a)
    return sum (a[i]*a[j] for i in range(n) for j in range(i+1,n))
    
def use_combinator(nums):
    from itertools import combinations
    return sum(a*b for a,b in combinations(nums,2))
    
def innovative(a):
    return (sum(a)**2 - sum(x**2 for x in a))//2
    
import time
import random

a = []
for _ in range(100):
    a.append(random.randint(100,1000))
    
# Efficiency: Low
st = time.time_ns()
print(ordinary(a))
et = time.time_ns()
print(":::: Ordinary : ",(et-st))

# Efficiency: Medium
st = time.time_ns()
print(use_combinator(a))
et = time.time_ns()
print(":::: Use_combinator  : ",(et-st))

# Efficiency: Highly
st = time.time_ns()
print(innovative(a))
et = time.time_ns()
print(":::: Innovative  : ",(et-st))
