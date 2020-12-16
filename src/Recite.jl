# Day 15 -- Recitation
module Recite

export readInput, recite!, memorygame

function readInput(filename)
    return parse.(Int64,split( readline(filename), ","))
end

function recite!(N :: Int64, numbers:: Array{Int64, 1}, memory :: Dict{Int64, Int64})
    prev = last(numbers)

    if haskey(memory, prev)
        push!(numbers, N - memory[prev])
        memory[prev] = N
    else
        push!(numbers, 0)
        push!(memory, prev => N)
    end
    return (numbers, memory)
end

function memorygame(numbers:: Array{Int64, 1}, Year:: Int64) :: Int64
    k = length(numbers)
    memory = Dict(numbers[i] => i for i in 1:k-1)
    while k+1 <= Year
        recite!(k, numbers, memory)
        k += 1
    end
    return last(numbers)
end

end #module
