module ToboSled
    function trajectory(filename,step,down)
        trees=0; right=0
        forest=readlines(filename)
        for arbor in forest[1:down:end]
            if arbor[(right%length(arbor))+1]=='#'
                trees+=1
            end
            right+=step
        end
        return trees
    end      

    function encounters(filename,slopes)
        ans=1
        for slope in slopes
            ans=ans*trajectory(filename, slope[1], slope[2])
        end
        return ans
    end
end
