module Seating
    function final_occupied(input)
        seats = hcat(collect.(readlines("input"))...)
        return [occupied(seats; adjacent, maxOccupied=4 ), occupied(seats; firstseen, maxOccupied=5)] 
    end
    function boarding(seats, choose, maxOccupied)
        rows, cols = size(seats)
        if shuffle(seats) == seats
            return seats
        else
            seats = shuffle(seats)
        end
        function shuffle(seats)
            #shuffle seats according to rules
            #pick seats accoring to choose
            #passengers care about max occupied
            newseats = zeros(rows,cols)
            for i in rows, j in cols
                if !(i==0&&j==0)
                    if seats[i,j] == 'L'
                        if choose(seats[i,j], seats) == 0
                            newseats[i,j] = '#'
                        else
                            newseats[i,j] = seats[i,j]
                        end # Empty Check

                    elseif seats[i,j] == '#'
                        if choose(seats[i,j], seats) >= maxOccupied
                            newseats[i,j] = 'L'
                        else
                            newseats[i,j] = seats[i,j]
                        end # Occupied Check

                    else #seasts[i,j]=='.'
                        newseats[i,j] = seats[i,j]

                    end # Seat is Floor
                end # 'L'/'#' check
            end # !(i==0&&j==0)
        end # (i,j) index loop
    end # shuffle

    function adjacent(row, col, seats)
        occupied = 0
        (N,M) = size(seats)
        for dx in (-1,0,1), dy in (-1,0,1)
            if  !(dx==0 && dy==0) 
                && (0 < row+dx <= N) 
                && (0 < row+dy <= M) 
                
                if seats[row+dx, col+dy] =='#'
                    occupied+=1
                end
            end
        end
    end

    function firstseen(row, col, seats)
        occupied = 0
        for dx in (-1,0,1), dy in (-1,0,1)
            
    end
    
    function occupied(seats, choose, maxOccupied)
        final = boarding(seats, choose, maxOccupied)
        return length(findall(x -> '#', final))
    end 
end #module
