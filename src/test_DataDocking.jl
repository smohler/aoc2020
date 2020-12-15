# Day 14 -- Data Docking -- Unit Test
module test_DataDocking
include("DataDocking.jl")
using .DataDocking, Test

@testset "DataDocking :: masked(val, mask)" begin
    mask = collect("XXXXXXXXXXXXXXXXXXXXXXXXXXXXX1XXXX0X")
    @test masked(11, mask) == 73
    @test masked(101, mask) == 101
    @test masked(0,mask) == 64
end

readInput(x) = split.(readlines(x), " = ")
@testset "DataDocking :: memsum(program, masked)" begin
    input = "test-DataDocking-165.txt"
    program = readInput(input)
    firststep = program[1:2]
    secondstep = program[1:3]
    @test memsum(firststep, masked) == 73
    @test memsum(secondstep, masked) == 174
    @test memsum(program, masked) == 165
end
input = "input-14.txt"
program = readInput(input)
@testset "Part 1" begin
    @test memsum(program, masked) == 10452688630537
end

@testset "DataDocking :: decoder(val, mask)" begin
    mask = collect("000000000000000000000000000000X1001X")
    val = 42
    @test decoder(val, mask) == [26, 27, 58, 59]
    mask = collect("00000000000000000000000000000000X0XX")
    val = 26
    @test decoder(val, mask) == [16,17,18,19,24,25,26,27]
end
@testset "DataDocking :: memsum(program, decoder)" begin
    input = "test-DataDocking-208.txt"
    program = readInput(input)
    firststep = program[1:2]
    secondstep = program[1:4]
    
    @test memsum(firststep, decoder) == 400
    @test memsum(secondstep, decoder) == 208
end
@testset "Part 2" begin
    input = "input-14.txt"
    program = readInput(input)
    memsum(program, decoder)|>println
end
end #module 
