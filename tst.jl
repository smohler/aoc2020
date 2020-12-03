# a generic tst file to write quick tests in which then get promoted to \tsts
# to copy the test cases from www.adventofcode.com/2020/day/x use copy, i, shift+insert
include("tmp.jl")
import .tmp
using .tmp, Test

#Start by defining the test cases in a dictionary to loop over
tests=Dict("testcase2.txt"=>7)

@testset "Unit Tests" begin
    #define any constants
    for (input, output) in tests
        @test tmp.report(input)==output
    end
end

