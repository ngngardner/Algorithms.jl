
function shifttable(p, t)
    m = length(p)
    n = length(t)

    c = sort(unique(p))
    d = sort(unique(t))

    shift = zeros(Int, size(d, 1))
    shift .= m

    for i = 1:size(c, 1)
        idx = findall(x -> x == c[i], p)
        t_idx = findall(x -> x == p[maximum(idx)], d)
        if m - maximum(idx) > 0
            shift[t_idx] .= m - maximum(idx)
        else
            idx = filter(x -> x != maximum(idx), idx)
            shift[t_idx] .= m - maximum(idx)
        end
    end

    return shift, d
end

function horspools(p, t)
    res = string("\nHorspool's Algorithm\n")

    m = length(p)
    n = length(t)

    shift, d = shifttable(p, t)

    i = m #position of the pattern's right end

    while i <= n
        res = string(res, "$t \n")
        for l = 1:i-m
            res = string(res, " ")
        end
        res = string(res, "$p \n")

        res = string(res)
        k = 0
        while k < m - 1 && p[m-k] == t[i-k]
            k = k + 1
        end

        if k == m - 1
            return i - m + 1, res
        else
            idx = maximum(findall(x -> x == t[i], d))
            i = i + shift[idx]
        end
    end

    return -1, res
end