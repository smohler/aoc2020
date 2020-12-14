# a generic tst file to write quick tests in which then get promoted to \tsts
# to copy the test cases from www.adventofcode.com/2020/day/x use copy, i, shift+insert
include("PlaneSeat.jl")
import .PlaneSeat
using .PlaneSeat, Test
@testset "Binary Boarding" begin
    @test PlaneSeat.findseatID("FBFBBFFRLR")==(44,5,357)
    @test PlaneSeat.findseatID("BFFFBBFRRR")==(70,7,567)
    @test PlaneSeat.findseatID("FFFBBBFRRR")==(14,7,119)
    @test PlaneSeat.findseatID("BBFFBBFRLL")==(102,4,820)
end
