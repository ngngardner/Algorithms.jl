module Algorithms

# Chapter 6.2 - Gaussian Elimination
include("gaussian.jl")
export gaussian_elimination

# Chapter 6.4 - Heap Sort
include("heaps.jl")
export heapsort

# Chapter 7.1 - Counting Sorts
include("countingsort.jl")
export comparisoncount, distributioncount

# Chapter 7.2 Horspool's Algorithm
include("horspool.jl")
export horspools

# Chapter 7.3 - Hashing
include("hashing.jl")
export closedhash, dclosedhash

# Chapter 8 - Least Common Subsequence
include("lcs.jl")
export lcs

# Chapter 8.1 - Coin Row, Change Making, and Coin-collecting
include("coins.jl")
export coinrow, makechange, coincollection

# Chapter 8.2 - Knapsack
include("knapsack.jl")
export knapsack

# Chapter 8.3 - Optimal Binary Search Tree
include("optimal_bst.jl")
export calculate_obst
# export get_points

end
