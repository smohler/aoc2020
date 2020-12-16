 # Unit Tests for Day 15 -- Recitation
module Recite 
include("tmp.jl")
using .tmp, Test
@testset "Recitation" begin
    #all test for Recitation each testset tests a unit function 
    @testset "recite!(numbers)" begin
        #unit test for recite!
        numbers = [0,3,6]; memory = Dict(numbers[i] => i for i in 1:2)
        recite!(3, numbers, memory); @test numbers[end] == 0  
        recite!(4, numbers, memory); @test numbers[end] == 3
        recite!(5, numbers, memory); @test numbers[end] == 3
        recite!(6, numbers, memory); @test numbers[end] == 1
        recite!(7, numbers, memory); @test numbers[end] == 0 
        recite!(8, numbers, memory); @test numbers[end] == 4
        recite!(9, numbers, memory); @test numbers[end] == 0
    end
    @testset "memorygame(numbers)" begin
        #unit test for the 2020th numbers
        @test memorygame([1,3,2], 2020) == 1
        @test memorygame([2,1,3], 2020) == 10
        @test memorygame([1,2,3], 2020) == 27
        @test memorygame([2,3,1], 2020) == 78
        @test memorygame([3,2,1], 2020) == 438
        @test memorygame([3,1,2], 2020) == 1836
    end
    @testset "Part 1" begin
        @test memorygame([0,3,6], 2020) == 436
        @test memorygame([2,15,0,9,1,20], 2020) == 1280
        println("Part 1 Answer :: $(memorygame([2,15,0,9,1,20], 2020))")
    end
    
    @testset "Part 2 memorygame(numbers, Year)" begin
        @test memorygame([0,3,6], 30000000) == 175594
        @test memorygame([1,3,2], 30000000) == 2578
    end
    
    @testset "Part 2" begin
        @elapsed test = memorygame([2,15,0,9,1,20], 30000000); @test test == 651639
        println("Part 2 Answer :: $test")
    end
end
end #module
