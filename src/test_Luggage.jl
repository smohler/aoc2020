# a generic tst file to write quick tests in which then get promoted to \tsts
# to copy the test cases from www.adventofcode.com/2020/day/x use copy, i, shift+insert
include("Luggage.jl")
import .Luggage
using .Luggage, Test
@testset "Handy Haversacks" begin
    @test Luggage.luggage("testdata\\luggage-4.txt")==4
    @test Luggage.allLuggage("testdata\\luggage-4.txt")==32
    @test Luggage.allLuggage("testdata\\allLuggage-126.txt")==126
end
