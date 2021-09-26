
function closedhash(keys, n, h)
    res = string("\nSingle Closed Hash\n")
    res = string(res, "$keys\n")

    table = Vector{eltype(keys)}(undef, n)
    table .= -1

    m = size(keys, 1)

    for i = 1:m
        res = string(res, "Inserting $(keys[i]) into $(h(keys[i]))\n")
        if table[h(keys[i])+1] == -1
            table[h(keys[i])+1] = keys[i]
            res = string(res, "\tSucessfully inserted $(keys[i]) into $(h(keys[i]))\n")
        else

            j = h(keys[i]) + 1
            k = 0

            while table[j] != -1
                res = string(res, "\tCollision at $j with $(table[j])\n")

                k += 1
                if j < n
                    j += 1
                else
                    j = 1
                end

                if k > n
                    res = string(res, "ERROR!!!\n")
                    break
                end
            end

            res = string(res, "\tSucessfully inserted $(keys[i]) into $j\n")
            table[j] = keys[i]
        end
    end

    return table, res
end

function dclosedhash(keys, n, h, h2)
    res = string("\nDouble Closed Hash\n")
    res = string(res, "$keys\n")

    table = Vector{eltype(keys)}(undef, n)
    table .= -1

    m = size(keys, 1)

    for i = 1:m
        res = string(res, "Inserting $(keys[i]) into $(h(keys[i]))\n")
        if table[h(keys[i])+1] == -1
            table[h(keys[i])+1] = keys[i]
            res = string(res, "\tSuccess inserting $(keys[i]) into $(h(keys[i]))\n")
        else
            j = 1
            temp = (h(keys[i]) + j * h2(keys[i])) % n

            res = string(res, "\tCollision at $(h(keys[i])) with $(table[h(keys[i])+1])\n")
            res = string(res, "\tAttempting second hash #$j... \n")
            res = string(res, "\t\t(h(keys[i]) + i*h2(keys[i])) % TABLE_SIZE \n")
            res = string(res, "\t\t= ($(h(keys[i])) + $j*$(h2(keys[i]))) % $n = $temp\n")

            if table[temp+1] == -1
                table[temp+1] = keys[i]
                res = string(res, "\tSucessfully inserted $(keys[i]) into $(temp)\n")
            else
                j += 1
            end
        end
    end

    return circshift(table, 1), res
end
