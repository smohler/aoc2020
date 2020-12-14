#Day 13 Advent of Code -- Shuttle Search
module Shuttle
    
    function besttimes(input)
        bustimes = writenotes(input)
        return [*(itinerary(bustimes)..), goldticket(bustimes.bus)]
    end

    struct  Notes
        depart::Int #departure time 
        bus::Array{Int} 
        wait::Array{Int}
    end

    function writenotes(filename::IOStream)::Notes
        return open(filename) do file
            inp = readlines(file)
            depart = parse(Int, inp[1])
            delays = parse.(Int, findall(x -> x != "x", split(inp[2], ",")))
            bus = split(inp[2],",")[delays]
            Notes(depart, parse.(Int, bus), delays)
    end

    function itinerary(bustimes::Notes)::Int
        times = Notes.depart .% Notes.bus
        wait,ID = findmin(-(Notes.depart, times))
        return wait, Notes.bus[ID]
    end

    function goldticket(IDS, Delays)
        N = *(IDS...) #mod N must be a solution to the problem
        inverses = [*(ids[findall(x->x!=ids[i], ids)]...) for i in 1:length(ids)]
        B = N./inverses 
        return #sum(delays.*B.*B')
    end
end #module

