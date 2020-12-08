# a generic tst file to write quick tests in which then get promoted to \tsts
# to copy the test cases from www.adventofcode.com/2020/day/x use copy, i, shift+insert
include("tmp.jl")
import .tmp
using .tmp, Test
@testset "Handheld" begin
    program=readlines("test-handheld.txt")
    @test tmp.RUN(program)==(5, false)
    @test tmp.DEBUG("test-handheld.txt")==8
end
