# a generic tst file to write quick tests in which then get promoted to \tsts
# to copy the test cases from www.adventofcode.com/2020/day/x use copy, i, shift+insert
include("Customs.jl")
import .Customs
using .Customs, Test
@testset "Custom Customs" begin
    @test Customs.customs("testdata\\customs-6.txt", "anyone")==6
    @test Customs.customs("testdata\\customs-11.txt", "anyone")==11
    @test Customs.customs("testdata\\customs-11.txt", "everyone")==6
end
