#Report Repair Advent of Code 2020
module ReportRepair
export report, puzzleinput
    function report(expense, value, entries)
	#part 1
    expense=puzzleinput()
        if entries==2 #part 1
            for i in expense, j in expense
                if i+j==value
                    return i*j
                end
            end
        else #part 2, entries==3
            for i in expense, j in expense, k in expense
                if i+j+k==value
                    return i*j*k
                end
            end
        end
    end

    function puzzleinput() 
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
