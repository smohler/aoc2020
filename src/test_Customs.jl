# a generic tst file to write quick tests in which then get promoted to \tsts
# to copy the test cases from www.adventofcode.com/2020/day/x use copy, i, shift+insert
include("tmp.jl")
import .tmp
using .tmp, Test
@testset "Custom Customs" begin
    @test tmp.customs("test-data-6.txt", "anyone")==6
    @test tmp.customs("test-data-11.txt", "anyone")==11
    @test tmp.customs("test-data-11.txt", "everyone")==6
end
