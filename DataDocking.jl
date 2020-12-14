module DataDocking
export memsum, masked
using SparseArrays

    function day14(input)
        program = split.(readlines(input), " = ")
        return [memsum(program), altmemsum(program)]
    end

    function memsum(program)
        global mem = spzeros(Int, 2^32)
        global mask = ['X' for i =1:36]
        for line in program
            if line[1]=="mask"
                exp = Meta.parse("mask"*"="*"$(collect(line[2]))")
                eval(exp)
            else # line[1]=="mem[addr]"
                #assing to memory the masked value mem[addr]=masked(val, mask)
                val = parse(Int, line[2])
                newval = masked(val, mask)
                str = line[1]*" = "*"$newval"
                exp = Meta.parse(str)
                eval(exp)
            end
        end
        return sum(mem)
    end

    function masked(val::Int, mask::Array{Char})
        bits = reverse(digits(val, base = 2, pad = 36))

        corrupt = findall(x->x!='X', mask)
        bits[corrupt] = map(x -> x = parse(Int, x), mask[corrupt])

        return parse(Int, join(bits); base = 2)
    end
                                 


end #module

