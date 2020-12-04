# a generic tst file to write quick tests in which then get promoted to \tsts
# to copy the test cases from www.adventofcode.com/2020/day/x use copy, i, shift+insert
include("tmp.jl")
import .tmp
using .tmp, Test
@testset "Passport Processing" begin
@test tmp.reader("\\testdata\\passport_2valid.txt")==2
@test tmp.Byr("2002")==true
@test tmp.Byr("2003")==false
@test tmp.Hgt("60in")==true
@test tmp.Hgt("190cm")==true
@test tmp.Hgt("190in")==false
@test tmp.Hgt("90")==false
@test tmp.Hcl("#123abc")==true
@test tmp.Hcl("#123abz")==false
@test tmp.Hcl("123abc")==false
@test tmp.Ecl("brn")==true
@test tmp.Ecl("wat")==false
@test tmp.Pid("000000001")==true
@test tmp.Pid("0123456789")==false
@test tmp.reader("\\testdata\\passport_4valids.txt")==4
@test tmp.reader("\\testdata\\passport_0valids.txt")==0
valid1="pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:1980 hcl:#623a2f"
@test tmp.scanner(valid1)==1
valid2="eyr:2029 ecl:blu cid:129 byr:1989 iyr:2014 pid:896056539 hcl:#a97842 hgt:165cm"
@test tmp.scanner(valid2)==1
valid3="hcl:#888785 hgt:164cm byr:2001 iyr:2015 cid:88 pid:545766238 ecl:hzl eyr:2022"
@test tmp.scanner(valid3)==1
valid4="iyr:2010 hgt:158cm hcl:#b6652a ecl:blu byr:1944 eyr:2021 pid:093154719"
@test tmp.scanner(valid4)==1
end;
