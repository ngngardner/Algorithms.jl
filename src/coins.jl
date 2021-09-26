
using Infinity

function coinrow(c)
    res_str = string("\nCoin Row \n")
    res_str = string(res_str, "F[0] = 0, F[1] = c1 = $(c[1])\n")

    n = size(c, 1) + 1
    f = Vector{eltype(c)}(undef, n)
    f[1] = 0
    f[2] = c[1]
    for i = 3:n
        f[i] = max((c[i-1] + f[i-2]), f[i-1])
        res_str = string(res_str, "F[$(i-1)] = max{$(c[i-1]) + $(f[i-2]), ")
        res_str = string(res_str, "$(f[i-1])} = $(f[i])\n")
    end
    return f, res_str
end

function makechange(d, n)
    res_str = string("\nMaking Change \n")

    m = size(d, 1)
    f = Vector{eltype(d)}(undef, n + 1)
    f[1] = 0
    for i = 2:n+1
        temp = ∞
        j = 1
        res_str = string(res_str, "F[$(i-1)] = min{")
        while j <= m && i > d[j]
            res_str = string(res_str, "F[$(i-1)-$(d[j])], ")
            temp = min(f[i-d[j]], temp)
            j += 1
        end
        f[i] = float(temp + 1)
        res_str = string(res_str, "} + 1 = $(f[i])\n")
    end

    return f, res_str
end

function coincollection(c)
    res_str = string("\nCoin Collection\n")
    n, m = size(c)
    f = zeros(n, m)

    res_str = string(res_str, "F[1, 1] = $(c[1, 1])\n")
    f[1, 1] = c[1, 1]

    # init top row
    for j = 2:m
        res_str = string(res_str, "F[1, $j] = $(f[1, j-1]) + $(c[1, j])\n")
        f[1, j] = f[1, j-1] + c[1, j]
    end

    for i = 2:n
        # init left column
        f[i, 1] = f[i-1, 1] + c[i, 1]
        res_str = string(res_str, "F[$i, 1] = $(f[i-1, 1]) + $(c[i, 1])\n")
        for j = 2:m
            res_str = string(res_str, "F[$i, $j] = ")
            res_str = string(res_str, "max{$(f[i-1, j]) + $(f[i, j-1])} ")
            res_str = string(res_str, "+ $(c[i, j])\n")
            f[i, j] = max(f[i-1, j], f[i, j-1]) + c[i, j]
        end
    end

    return f, res_str
end