# Day 14 -- Data Docking -- Unit Test
module test_DataDocking
include("DataDocking.jl")
using .DataDocking, Test

@testset "masked(val, mask)" begin
    mask = collect("XXXXXXXXXXXXXXXXXXXXXXXXXXXXX1XXXX0X")
    @test masked(11, mask) == 73
    @test masked(101, mask) == 101
    @test masked(0,mask) == 64
end

readInput(x) = split.(readlines(x), " = ")
@testset "memsum(program)" begin
    input = "test-DataDocking-165.txt"
    program = readInput(input)
    firststep = program[1:2]
    secondstep = program[1:3]
    @test memsum(firststep) == 73
    @test memsum(secondstep) == 174
    @test memsum(program) == 165
end
input = "input-14.txt"
program = readInput(input)
@testset "Part 1" begin
    @test memsum(program) == 10452688630537
end

end #module 
