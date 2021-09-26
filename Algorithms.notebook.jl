### A Pluto.jl notebook ###
# v0.12.9

using Markdown
using InteractiveUtils

# ╔═╡ 9df9b162-22b3-11eb-1191-11d5ec32431f
begin
	using Revise	
	using Algorithms
end

# ╔═╡ 980a1812-23c3-11eb-1252-8bf66b53c441
begin
	"chapter 6.2 - gaussian elimination"
	#"x + y + z = 2"
	#"2x + y + z = 3"
	#"x - y + 3z = 8"
	# s = zeros(Int, 3, 4)
	# s[1, :] = [1, 1, 1, 2]
	# s[2, :] = [2, 1, 1, 3]
	# s[3, :] = [1, -1, 3, 8]
	
	# textbook example
# 	s = zeros(3, 4)
# 	s[1, :] = [2, -1, 1, 1]
# 	s[2, :] = [4, 1, -1, 5]
# 	s[3, :] = [1, 1, 1, 0]
	
	# quiz example
# 	s = zeros(3, 4)
# 	s[1, :] = [1, -2, 1, 1]
# 	s[2, :] = [2, 1, -8, -3]
# 	s[3, :] = [-3, 2, 1, 3]
	
# 	s, res = gaussian_elimination(s)
# 	print(res)
# 	s
end

# ╔═╡ ab630160-239d-11eb-01a7-29f445226717
begin
	"chapter 7.1.1 - comparison counting sort"
	# a = [62, 31, 84, 96, 19, 47]
	# d, res_str = comparisoncount(a)
	# print(res_str)
	# d
end

# ╔═╡ 6bfe7664-23a0-11eb-3366-07ab80a6e315
begin
	"chapter 7.1.2 - distribution counting sort"
	# a = [13, 11, 12, 13, 12, 12]
	# # a = [2, 3, 4, 3, 2, 1, 1, 2] # a = [b, c, d, c, b, a, a, b]
	# d, str = distributioncount(a)
	# print(str)
	# d
end

# ╔═╡ 5caee20e-23a3-11eb-0a0c-61f14fc6f89d
begin
	"chapter 7.2 - horspool's algorithm"
# 	# p = "BARBER"
# 	# t = "JIM_SAW_ME_IN_A_BARBERSHOP"
	
# 	p = "BAOBAB"
# 	t = "BESS_KNEW_ABOUT_BAOBABS"
	
# 	idx, str = horspools(p, t)
# 	print(str)
# 	t[begin:idx]
end

# ╔═╡ 0c4186b8-23b8-11eb-30ff-998434679e3e
begin
	"chapter 7.3 - hashing"
	# single closed hash
	# n = 11
	# keys = [30, 20, 56, 75, 31, 19]
# 	function h(x)
#         return x % 11
#     end
	
# 	d, str = closedhash(keys, n, h)
# 	print(str)
# 	d
	
	# double closed hash
# 	function h(x)
#         return x % 11
#     end

#     function h2(x)
#         return x ÷ 11 + 1
#     end
	
# 	d, str = dclosedhash(keys, n, h, h2)
# 	print(str)
# 	d
end

# ╔═╡ 8680d8c6-2394-11eb-2e31-992a6f60bee6
begin
	"chapter 8 - longest common subsequence"
	# X = [1, 0, 0, 1, 0, 1, 0, 1]
	# Y = [0, 1, 0, 1, 1, 0, 1, 1, 0]
	# lcs(X, Y)
end

# ╔═╡ 17b73790-238b-11eb-032d-2131feceea80
begin
	"chapter 8.1.1 - coin row"
	# c = [5, 1, 2, 10, 6, 2]
	# d, str = coinrow(c)
	# print(str)
	# d
end

# ╔═╡ 6f3d8518-238c-11eb-3065-c7a7315a2327
begin
	"chapter 8.1.2 - make change"
	
	# d = [1, 3, 5]
	# r, str = makechange(d, 9)
	# print(str)
	# r
end

# ╔═╡ 5cfe8624-238f-11eb-1684-339777e4ab6e
begin
	"chapter 8.1.3 - coin collecting"
	
# 	n = 5
# 	m = 6
# 	c = zeros(n, m)
# 	points = [
# 		CartesianIndex(1, 5),
# 		CartesianIndex(2, 2),
# 		CartesianIndex(2, 4),
# 		CartesianIndex(3, 4),
# 		CartesianIndex(3, 6),
# 		CartesianIndex(4, 3),
# 		CartesianIndex(4, 6),
# 		CartesianIndex(5, 1),
# 		CartesianIndex(5, 5),
# 	]
# 	c[points] .= 1
	
# 	# blocked = [
# 	# 	CartesianIndex(2, 3),
# 	# ]
# 	# c[blocked] .= -1
	
#     d, res_str = coincollection(c)
# 	print(res_str)
# 	d
end

# ╔═╡ 8f19b680-22cf-11eb-24e9-25dc2da1d3e3
# for finding optimal subset of items for knapsack
begin
	"chapter 8.2 - find items for knapsack"
			
# 	weights = [2, 1, 3, 2]
# 	values = [12, 10, 20, 15]
# 	n = size(weights, 1)
	
# 	f = knapsack(n, weights, values, 5)
# 	f
end

# ╔═╡ 38b9dad2-22b5-11eb-0b93-b1e0d02e3b11
begin
	"chapter 8.3 - find optimal bst"
	
	# keys = ["A", "B", "C", "D"]
	# probability = [0.1, 0.2, 0.4, 0.3]
	# c, r, str = calculate_obst(probability)
	# # print(str)
	# c, r
end

# ╔═╡ 3c0d3468-2436-11eb-19d8-b12a056926d6
begin
	"chapter 6.4 heapsort"
	a = [2, 9, 7, 6, 5, 8]
	h, str = heapsort(a)
	print(str)
	h
end

# ╔═╡ Cell order:
# ╠═9df9b162-22b3-11eb-1191-11d5ec32431f
# ╟─980a1812-23c3-11eb-1252-8bf66b53c441
# ╟─ab630160-239d-11eb-01a7-29f445226717
# ╟─6bfe7664-23a0-11eb-3366-07ab80a6e315
# ╟─5caee20e-23a3-11eb-0a0c-61f14fc6f89d
# ╟─0c4186b8-23b8-11eb-30ff-998434679e3e
# ╟─8680d8c6-2394-11eb-2e31-992a6f60bee6
# ╟─17b73790-238b-11eb-032d-2131feceea80
# ╟─6f3d8518-238c-11eb-3065-c7a7315a2327
# ╟─5cfe8624-238f-11eb-1684-339777e4ab6e
# ╟─8f19b680-22cf-11eb-24e9-25dc2da1d3e3
# ╟─38b9dad2-22b5-11eb-0b93-b1e0d02e3b11
# ╠═3c0d3468-2436-11eb-19d8-b12a056926d6
