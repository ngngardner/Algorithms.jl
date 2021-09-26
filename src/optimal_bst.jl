
using Infinity

function init_main(p, n)
    main_table = zeros(n + 1, n)

    for i = 2:n
        main_table[i, i] = p[i-1]
    end

    return main_table
end

function init_root(n)
    root_table = zeros(n + 1, n)
    for i = 2:n
        root_table[i, i] = i - 1
    end
    return root_table
end

function get_points(n)
    i = 2
    points = []
    for j = i+1:n
        x, y = i, j
        while x <= n + 1 && y <= n
            t = (x, y)
            push!(points, t)
            x += 1
            y += 1
        end
    end

    return points
end

function calculate_obst(p)
    n = size(p, 1) + 1

    c = init_main(p, n)
    root_table = init_root(n)
    points = get_points(n)
    res_str = string()

    for point in points
        i = point[1]
        j = point[2]

        min = ∞
        min_k = 0

        res_str = string(res_str, "C($(i-1), $(j-1)) = min[\n")

        for k = i:j
            x = round(sum(p[s] for s = i-1:j-1), digits = 1)
            res = round(c[i, k-1] + c[k+1, j] + x, digits = 1)
            if res < min
                min = round(res, digits = 1)
                min_k = k - 1
            end
            res_str = string(res_str, "	k = $k : C($(i-1), $(k-2)) + C($(k), $(j-1))")
            res_str = string(res_str, " + sum(ps for s = $(i-1):$(j-1))")
            res_str = string(res_str, " = $(c[i, k-1]) + $(c[k+1, j]) + $x")
            res_str = string(res_str, " = $res\n")
        end

        res_str = string(res_str, "] = $min\n")
        c[i, j] = min
        root_table[i, j] = min_k
    end

    return c, root_table, res_str
end