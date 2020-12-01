# a generic tst file to write quick tests in which then get promoted to \tsts
# to copy the test cases from www.adventofcode.com/2020/day/x use copy, i, shift+insert
include("tmp.jl")
import .tmp
using .tmp, Test

#Start by defining the test cases in a dictionary to loop over
tests=Dict(([1721, 979, 366, 299, 675, 1456], 2020, 2)=>514579
           ([1721, 979, 366, 299, 675, 1456], 2020, 3)=>241861950)#add more from website

@testset "Unit Tests" begin
    #define any constants
    for (input, output) in tests
        @test tmp.report(input)==output
    end
end

