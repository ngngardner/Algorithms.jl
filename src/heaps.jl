
function construct_heap(a)
    # bottom up approach
    res = string("\nHeap Construction\n")
    n = size(a, 1)

    for i = n÷2:-1:1
        res = string(res, a, "\n")
        k = i
        v = a[k]
        heap = false

        while !heap && 2 * k <= n
            j = 2 * k
            if j < n # there are two children
                if a[j] < a[j+1]
                    j = j + 1
                end
            end

            if v >= a[j]
                heap = true
            else
                a[k] = a[j]
                k = j
            end
        end

        if a[k] != v
            res = string(res, "swap $(a[k]) with $v \n")
        end

        a[k] = v
    end

    res = string(res, a, "\n")
    return a, res
end

function sort_heap(h)
    # maximum deletions
    res = string("\nHeap Sort\n")
    n = size(h, 1)

    deleted = []

    for i = 1:n
        res = string(res, "$h\n")

        temp = h[begin]
        res = string(res, "Deleting $temp\n")

        h[begin] = h[end]
        h[end] = temp
        setdiff!(h, h[end])
        push!(deleted, temp)

        h, str = construct_heap(h)
        res = string(res, str)
        res = string(res, "Reconstructed heap. \n")
    end

    res = string(res, "Sorted Array: \n $deleted\n")

    return deleted, res
end

function heapsort(a)
    h, res = construct_heap(a)
    h, res = sort_heap(h)
    return h, res
end
