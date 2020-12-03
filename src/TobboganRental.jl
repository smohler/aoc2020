# Day 2 Password Philosophy
module TobogganRental 
export Password, TobogganPW
function Password(filename) 
    open(filename) do file 
        valid_pw=0
        for line in eachline(file)
            min, max, key, _, pw=split(line, r"-| |:")
            min, max = parse(Int, min), parse(Int, max)
            for letter in pw[min:max]
                if string(letter)==key
                   valid_pw+=1
                end
            end
        end
        return valid_pw
    end
end
function TobogganPW(filename) 
    open(filename) do file 
        valid_pw=0
        for line in eachline(file)
            min, max, key, _, pw=split(line, r"-| |:")
            first=parse(Int,min)
            last=parse(Int,max)
            char1=string(pw[first]); char2=string(pw[last])
            if (char1==key||char2==key)&&!(char1==key&&char2==key)#XOR 
                valid_pw+=1
            end
        end
        return valid_pw
    end
end
end
