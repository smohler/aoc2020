include("Shuttle.jl")
import .Shuttle
using .Shuttle, Test
@testset "Shuttle Prime Puzzle" begin
    @test Shuttle.customs("testdata\\shuttle-939.txt") == (59,5)
end
