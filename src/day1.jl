#Report Repair Advent of Code 2020
module ReportRepair
export report, wrangleinput    
    function report(expense, value)
        for i in expense, j in expense
            if i+j==value
                return i*j
            end
        end
    end

    function wrangleinput() 
        #the input is a row of integers
        data=Int[]    
        open("input.txt") do puzzleInput
            for line in eachline(puzzleInput)
                append!(data,parse(Int,line))
            end
        end
        return data
    end
end
