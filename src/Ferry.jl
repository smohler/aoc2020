#Day 12 -- Rain Risk module Ferry struct Navg module Ferry    struct Nav
module Ferry
    struct Nav
        action::Char
        value::Int
    end

    mutable struct Boat
        N::Int
        E::Int
        S::Int
        W::Int
        bearing :: Char{'N', 'S', 'E', 'W'}
    end  
        
    function ferry(input::String)
        actions = first.(readlines(input))
        values = parse.(Int, map(x->x[2:end], readlines(input)))
        navigations = []
        for item in zip(actions, values)
            push!(navigations, Nav(item...))
        end
        ferry = Boat(0,0,0,0,'E')
        return [distance(navigations, ferry), relative_distance(navigations, ferry)]
    end
    
    function distance(navgiations, boat)
    end

    function advance!(inst::Nav, boat::Boat)
        return boat
    end
end #module
