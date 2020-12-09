# p file to vdevelop aoc solutions
module Luggage
export rules, process, containers, luggage, allLuggage
    function rules(data)
        lines=split.(readlines(data), " bags contain ")
        pat=r"[0-9]{1} [a-z]+ [a-z]+"
        rules=Dict()
        for line in lines
            push!(rules, split(line[1], " ")=>[split(x.match, " ") for x in eachmatch(pat, line[2])])
        end
        inverse=Dict()
        for key in keys(rules), bags in rules[key]
            push!(inverse, bags[2:3]=>vcat(get(inverse, bags[2:3], []), [key]))
        end
        return rules, inverse 
    end
    function process(bag, rules)
        bags=Set()
        function look(Bag)
            for x in get(rules, Bag, [])
                println(x)
                push!(bags, x)
                look(x)
            end
        end
        look(bag)
        return length(bags)
    end
    function containers(bag, rules)
        function counter(Bag, n)
            res=n
            for x in rules[Bag]
                println(x)
                N=counter(x[2:3], parse(Int, x[1]))
                res+=(n*N)
            end
            res
        end
        Count=counter(bag,1)
        return Count-1
    end

    function luggage(input)
        _,bagrules=rules(input)
        return process(["shiny", "gold"],bagrules)
    end
    function allLuggage(input)
        bagrules,_=rules(input)
        return containers(["shiny", "gold"], bagrules)
    end
end
