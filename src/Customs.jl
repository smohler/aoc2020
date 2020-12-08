# Day 6: Custom Customs
module Customs
    export customs
    function customs(forms,count)
        if count=="anyone"
            forms=replace.(split(read(forms, String), "\n\n"), "\n"=>"")
            return sum([length(Set(x)) for x in forms])
        else #count=="everyone"
            forms=split.(split(read(forms, String), "\n\n"), "\n")
            everyone=0
            popat!(forms[end], length(forms[end])) #there is an extra "" for some reason
            for answers in forms
                groups=[Set(split(x, "")) for x in answers]
                everyone+=length(intersect(groups...))
            end
            return everyone
        end
    end
end
