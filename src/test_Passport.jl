# a generic tst file to write quick tests in which then get promoted to \tsts
# to copy the test cases from www.adventofcode.com/2020/day/x use copy, i, shift+insert
include("Passport.jl")
import .Passport
using .Passport, Test
@testset "Passport Processing" begin
@test Passport.reader("testdata\\passport_2.txt")==2
@test Passport.Byr("2002")==true
@test Passport.Byr("2003")==false
@test Passport.Hgt("60in")==true
@test Passport.Hgt("190cm")==true
@test Passport.Hgt("190in")==false
@test Passport.Hgt("90")==false
@test Passport.Hcl("#123abc")==true
@test Passport.Hcl("#123abz")==false
@test Passport.Hcl("123abc")==false
@test Passport.Ecl("brn")==true
@test Passport.Ecl("wat")==false
@test Passport.Pid("000000001")==true
@test Passport.Pid("0123456789")==false
@test Passport.reader("testdata\\passport_4.txt")==4
@test Passport.reader("testdata\\passport_0.txt")==0
valid1="pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:1980 hcl:#623a2f"
@test Passport.scanner(valid1)==1
valid2="eyr:2029 ecl:blu cid:129 byr:1989 iyr:2014 pid:896056539 hcl:#a97842 hgt:165cm"
@test Passport.scanner(valid2)==1
valid3="hcl:#888785 hgt:164cm byr:2001 iyr:2015 cid:88 pid:545766238 ecl:hzl eyr:2022"
@test Passport.scanner(valid3)==1
valid4="iyr:2010 hgt:158cm hcl:#b6652a ecl:blu byr:1944 eyr:2021 pid:093154719"
@test Passport.scanner(valid4)==1
end;
