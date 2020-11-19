# a generic tst file to write quick tests in which then get promoted to \tsts
# to copy the test cases from www.adventofcode.com/2020/day/x use copy, i, shift+insert
include ("tmp.jl")
import .tmp
using .tmp, Test

#Start by defining the test cases in a dictionary to loop over
tests=Dict("input1"=>"output1")#add more from website
 
@testset "test suite for advent of code day X" 
begin
    #define any constants
    for (input, ouput) in tests
        @test foo(input)=output
    end
end

