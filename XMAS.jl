module XMAS
export

    function hack(stream, preamble_length)
        ln = 1
        combs(p) = unique([(x,y) for x in p, y in p if x != y]) 
        sums(p)  = unique([x + y for x in p, y in p if x != y])
        for line in eachline(stream)
            entry = parse(Int, line)
            if ln == 1
                #first line of xmas data stream
                preamble = [entry]
            elseif 1 < ln < preamble_length
                #generate the preamble list
                push!(preamble, entry)
            elseif ln == preamble_length
                #generate inital possible sums list
                push!(preamble, entry)
                Sums = sums(preamble)
            else # ln > preamble_length
                #xmas encrypted data stream
                if !(entry in sums(preamble))
                    #invalid entry as been found
                    return entry 
                else
                    push!(preamble, entry)
                    popfirst!(preamble)
                    #check for contagious string
                end
            end
        end
    end

end
