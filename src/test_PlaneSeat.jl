# a generic tst file to write quick tests in which then get promoted to \tsts
# to copy the test cases from www.adventofcode.com/2020/day/x use copy, i, shift+insert
include("tmp.jl")
import .tmp
using .tmp, Test
seat=Seat(1,3,129)
@testset "Binary Boarding" begin
    @test tmp.findseatID("FBFBBFFRLR")==(44,5,357)
    @test tmp.findseatID("BFFFBBFRRR")==(70,7,567)
    @test tmp.findseatID("FFFBBBFRRR")==(14,7,119)
    @test tmp.findseatID("BBFFBBFRLL")==(102,4,820)
end
