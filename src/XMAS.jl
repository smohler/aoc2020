module XMAS
export hack, find_weakness
using Combinatorics 
    function hack(stream, preamble_length)
        ln = 1
        preamble = []
        xmas = []
        sums(p)  = unique([x + y for x in p, y in p if x != y])
        for line in eachline(stream)
            entry = parse(Int, line)
            if 1 <= ln < preamble_length   
                # generate the preamble list
                append!(preamble, entry)
                append!(xmas, entry)
            elseif ln == preamble_length
                #generate inital possible sums list
                append!(preamble, entry)
                append!(xmas, entry)
                valids = sums(preamble)
            elseif ln > preamble_length
                # generate xmas encrypted data stream
                append!(xmas, entry)
                # check if the entry
                if !(entry in sums(preamble))
                    invalid = entry
                    weakness = find_weakness(xmas, invalid)
                    return invalid, weakness 
                else
                    append!(preamble, entry)
                    popfirst!(preamble)
                    valids = sums(preamble)
                end
            end
            ln += 1
        end
    end

    function find_weakness(xmas, inv)
        #find a subrange in xmas that sum equals inv
        checks = collect(combinations(1:length(xmas), 2))
        #scan all ranges
        for pair in checks
            lower = minimum(pair)
            upper = maximum(pair)
            if sum(xmas[lower:upper]) == inv
                weakness = xmas[lower:upper]
                return maximum(weakness) + minimum(weakness)
            end
        end
        # no weakness found
        return false
    end
end
