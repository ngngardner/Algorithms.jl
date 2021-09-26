
using LinearAlgebra

function gaussian_elimination(s)
    res = string("\nGaussian Elimination\n")

    d, n = size(s)

    for k = 2:d
        t = deepcopy(s)
        for i = k:d
            for j = 1:n
                s[i, j] = t[i, j] - (t[i, k-1] / t[k-1, k-1]) * t[k-1, j]
            end
        end
        res = string(res, "$s\n")
    end

    # solve system
    A = s[:, 1:end-1]
    B = s[:, end]
    res = string(res, "Matrix A: $A\n")
    res = string(res, "Result B: $B\n")

    X = A \ B
    res = string(res, "Solution X: $X\n")

    return s, res
end