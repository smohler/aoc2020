xmas=map(x -> parse(Int, x), readlines("input-9.txt"))
prelude=xmas[1:25]
stream=xmas[26:end]
Sums(p) = unique([x + y for x in prelude, y in prelude if x != y])
global invalid = 0
for entry in stream
    #println("$entry is in $(Sums(prelude)) :: $(in(entry, sums))")
    if !in(entry, Sums(prelude)) 
        println("RULE BREAKER :: $entry")
        global invalid = entry
        break
    end
    push!(prelude, entry)
    popfirst!(prelude)
end

function contagious(xmas, inv)
    ranges = unique([ (x, y) for x in 1:length(xmas), y in 1:length(xmas) if x != y])
    for range in ranges
        upper, lower = range
        if sum(xmas[lower:upper])==inv
            return maximum(xmas[lower:upper])+minimum(xmas[lower:upper])
        end
    end
end

println("CONTANGION :: $(contagious(xmas, invalid))")
