
struct Item
    weight::Int
    value::Int
end

function init_items(n, weights, values)
    #size(weights, 1) == size(values, 1) || return "weights and values must match"

    items = Vector{Item}(undef, n)

    for i = 1:n
        items[i] = Item(weights[i], values[i])
    end

    return items
end

function helper(table, i, j)
    if i == 0 && j >= 0
        return 0
    elseif i >= 0 && j == 0
        return 0
    else
        return table[i, j]
    end
end

function knapsack(n, weights, values, capacity)
    items = init_items(n, weights, values)

    n += 1
    capacity += 1

    table = zeros(n, capacity)

    for i = 2:n
        w = weights[i-1]
        v = values[i-1]
        for j = 2:capacity
            base = table[i-1, j]
            if j - w - 1 < 0
                table[i, j] = base
            else
                x = v + helper(table, i - 1, j - w)
                if base > x
                    table[i, j] = base
                else
                    table[i, j] = x
                end
            end
        end
    end

    return table
end