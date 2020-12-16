module DataDocking
export memsum, masked, decoder, day14
using SparseArrays, IterTools

    function day14(input)
        program = split.(readlines(input), " = ")
        return [memsum(program, masked), memsum(program, decoder)]
    end

    function memsum(Program, Decoder)
        #take in a program and a decoder and return the 
        #the sum in memory. 

        global mem = spzeros(Int, 2^36)
        global mask = ['X' for i =1:36]
        for line in Program
            if line[1]=="mask"
                exp = Meta.parse("mask"*"="*"$(collect(line[2]))")
                eval(exp)
            else # line[1]=="mem[addr]"
                #assing to memory the masked value mem[addr]=masked(val, mask)
                if Decoder == masked
                    val = parse(Int, line[2])
                else
                    rgx = r"^mem\[(\d+)\]"
                    val = parse(Int, match(rgx, line[1]).captures[1])
                end            
                newvals = Decoder(val, mask)
                for newval in newvals
                    if Decoder == masked
                        str = line[1]*" = "*"$newval"
                        exp = Meta.parse(str)
                        eval(exp)
                    else #Decoder == decoder #Version 2.0!
                        assign = parse(Int, line[2])
                        str = "mem[$(newval+1)] = $assign"
                        exp = Meta.parse(str)
                        eval(exp)
                    end
                end
            end
        end
        return sum(mem)
    end

    function masked(val::Int, mask::Array{Char})
        #take in a value and return the decimal masked value
        
        bits = reverse(digits(val, base = 2, pad = 36))

        corrupt = findall(x->x!='X', mask)
        bits[corrupt] = map(x -> x = parse(Int, x), mask[corrupt])

        return parse(Int, join(bits); base = 2)
    end
    
    function decoder(addr, mask)
        #take the memory address and return array of all possible
        #new addresses considering floating bits

        bits = digits(addr, base = 2, pad = 36)|>reverse 

        corrupt = findall(x->x == '1', mask) #corrupt only 1's
        floating = findall(x -> x == 'X', mask)
        
        bits[corrupt] = map(x -> x = parse(Int, x), mask[corrupt])
        allbits = [[0,1] for i in 1:length(floating)]
        addrs = []
        for bit in product(allbits...)
            new = collect(bit)
            bits[floating] = new
            push!(addrs, parse(Int, join(bits); base = 2)) 
        end
        return sort(addrs)
    end
end #module

