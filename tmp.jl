# tmp file to develop aoc solutions
module tmp
export report, wrangleinput    
    function report(expense, value)
        for i in expense, j in expense 
            if i+j==value
                return i*j
            end
        end
    end


    function wrangleinput() 
        data=Int[]    
        open("input.txt") do puzzleInput
            for line in eachline(puzzleInput)
                append!(data,parse(Int,line))
            end
        end
        return data
    end 
    #add more definitions here
end
