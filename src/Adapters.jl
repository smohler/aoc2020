module Adapters
    function adapters(input::String)
        jolts = sort(parse.(Int,readlines(input)))
        return [joltsdiffsi(jolts), joltcombs(jolts)]
    end
    
end #module

