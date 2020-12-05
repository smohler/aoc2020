module PlaneSeat
export findseatID, seatIDS
    function seatIDS(manifest)
        seats=readlines(manifest)
        IDS=[]
        for seat in seats
            push!(IDS,findseatID(seat)[3])
        end
        maxseat=maximum(IDS)
        myseat=maximum(setdiff(1:maxseat, IDS))
        return maxseat, myseat
    end


    function findseatID(seat)
        #row="BFFBBFB" which has binary 1001101
        #col="RLL" which is binary 100
        #seat="BFFBBFBRLL"
        rows, cols=seat[1:end-3], seat[end-2:end]
        binarycol=replace(replace(cols, "R"=>1), "L"=>0)
        binaryrow=replace(replace(rows, "F"=>0), "B"=>1)
        (row, col)=map(x->parse(Int, x, base=2), (binaryrow, binarycol))
        return row, col, row*8+col
    end
end
