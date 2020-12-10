# a generic tst file to write quick tests in which then get promoted to \tsts
# to copy the test cases from www.adventofcode.com/2020/day/x use copy, i, shift+insert
include("XMAS.jl")
import .XMAS
using .XMAS, Test
@testset "XMAS" begin
    @test XMAS.hack("testdata\\xmas-5-127.txt", 5)==(127, 62)
end
