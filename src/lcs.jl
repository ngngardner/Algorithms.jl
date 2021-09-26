
function lcs(X, Y)
    n = size(X, 1) + 1
    m = size(Y, 1) + 1

    f = zeros(Int, n, m)

    for i = 2:n
        for j = 2:m
            if X[i-1] == Y[j-1]
                f[i, j] = 1 + f[i-1, j-1]
            else
                f[i, j] = max(f[i, j-1], f[i-1, j])
            end
        end
    end

    return f
end