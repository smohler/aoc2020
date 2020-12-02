# Day 2 Password Philosophy
module TobogganRental 
export Password, TobogganPW
function Password(filename) 
    open(filename) do file 
        data=0
        for line in eachline(file)
            min, max, key, _, pw=split(line, r"-| |:")
            range=parse(Int, min):parse(Int, max)
            pat=Regex(key)
            m=match(pat, pw)
            occurences = length([m.match for m=eachmatch(pat,pw)])
            if occurences in range
                data+=1
            end
        end
        return data
    end
end
function TobogganPW(filename) 
    open(filename) do file 
        data=0
        for line in eachline(file)
            min, max, key, _, pw=split(line, r"-| |:")
            first=parse(Int,min)
            last=parse(Int,max)
            char1=string(pw[first]); char2=string(pw[last])
            if (char1==key||char2==key)&&!(char1==key&&char2==key)#XOR 
                data+=1
            end
        end
        return data
    end
end
end
