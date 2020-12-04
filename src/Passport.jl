# tmp file to develop aoc solutions
module tmp
    export reader, scanner
    function reader(batch)
        valids=0
        people=split(read(batch, String),"\n\n")
        for person in people
            passport=replace(person, r"\n"=>' ')
            println(passport)
            valids+=scanner(passport)
        end
        return valids
    end
    function scanner(passport)
        validkeys=["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid", "cid"]
        fields=split(passport, r":| ")
        keys=fields[1:2:end]
        data=fields[2:2:end]
        if length(keys)<7 #valid passports contain at least 7 fields
            return 0
        end    
        if length(keys)==7&&setdiff(validkeys, keys)!=["cid"]
            #the one missing field has to "cid" to be valid
            return 0
        end
        if length(keys)>=7
            return validdata(keys, data)
        end
    end
    function validdata(keys, data)
        pass=Dict(zip(keys, data))
        if Byr(pass["byr"])&&Iyr(pass["iyr"])&&Eyr(pass["eyr"])&&Hgt(pass["hgt"])&&Hcl(pass["hcl"])&&Ecl(pass["ecl"])&&Pid(pass["pid"])
            return 1
        else
            return 0
        end
    end
    function Byr(data)
        year=parse(Int, data)
        if year in 1920:2002
            return true
        else
            return false
        end
    end

    function Iyr(data)
        year=parse(Int, data)
        if year in 2010:2020 
            return true
        else
            return false
        end
    end

    function Eyr(data)
        year=parse(Int, data)
        if year in 2020:2030
            return true
        else
            return false
        end
    end

    function Hgt(entry)
        unit=entry[end-1:end]
        if !(unit=="cm"||unit=="in")
            return false
        end
        height=parse(Int, entry[1:end-2])
        if unit=="cm"
            if height in 150:193
                return true
            else
                return false
            end
        end

        if unit=="in"
            if height in 59:76
                return true
            else
                return false
            end
        end
    end

    function Hcl(entry)
        validchars=Set(['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'])
        if entry[1]=='#'&& length(entry[2:end])==6 && issubset(entry[2:end], validchars)
            return true
        else
            return false
        end
    end

    function Ecl(entry)
        valideyes=["amb", "blu", "brn","grn","gry", "hzl", "oth"]
        if entry in valideyes
            return true
        else
            return false
        end
    end
    
    function Pid(entry)
        if length(entry)==9 && all(isdigit, entry)
            return true
        else
            return false
        end
    end
end
