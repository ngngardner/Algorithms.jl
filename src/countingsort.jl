
function comparisoncount(a)
    n = size(a, 1)
    res = string("\nComparison Count\n")
    res = string(res, "Array A[1...$(n-1)] \t\t $a \n")

    count = zeros(Int, n)
    res = string(res, "Initially \t\t $count \n")

    for i = 1:n-1
        for j = i+1:n
            if a[i] < a[j]
                count[j] = count[j] + 1
            else
                count[i] = count[i] + 1
            end
        end
        res = string(res, "After pass i=$(i-1) \t\t $count \n")
    end

    s = zeros(Int, n)

    for i = 1:n
        s[count[i]+1] = a[i]
    end

    res = string(res, "Array S[1...$(n-1)] \t\t $s \n")

    return s, res
end

function distributioncount(a)
    res = string("\nDistribution Count\n")

    l = minimum(a)
    u = maximum(a)
    n = size(a, 1)
    s = zeros(Int, n)  # sorted array
    d = zeros(Int, u - l + 1) # frequencies

    # compute frequencies
    for i = 1:n
        d[a[i]-l+1] = d[a[i]-l+1] + 1
    end

    # compute distribution
    for j = 2:u-l+1
        d[j] = d[j-1] + d[j]
    end

    for i = n:-1:1
        j = a[i] - l + 1
        s[d[j]] = a[i]

        # for output
        temp = zeros(Int, n)
        temp[d[j]] = a[i]
        res = string(res, "A[$(i-1)] = $(a[i]) \t $d \t $temp \n")

        d[j] = d[j] - 1

    end

    return s, res
end