# a generic tst file to write quick tests in which then get promoted to \tsts
# to copy the test cases from www.adventofcode.com/2020/day/x use copy, i, shift+insert
include("Handheld.jl")
import .Handheld
using .Handheld, Test
@testset "Handheld" begin
    program=readlines("testdata\\handheld.txt")
    @test Handheld.RUN(program)==(5, false)
    @test Handheld.DEBUG("testdata\\handheld.txt")==8
end
