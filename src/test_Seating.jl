# a generic tst file to write quick tests in which then get promoted to \tsts
# to copy the test cases from www.adventofcode.com/2020/day/x use copy, i, shift+insert

include("tmp.jl")
using Test 

RoundOne = Seats(seatmap("roundone-37.txt")...)
RoundTwo = Seats(seatmap("roundtwo-37.txt")...)
RoundThree = Seats(seatmap("roundthree-37.txt")...)
RoundFour = Seats(seatmap("roundfour-37.txt")...)
Airbus = Seats(seatmap("roundzero-37.txt")...)
@testset "Plane Seating Shuffle" begin
    roundone = shuffle(Airbus, adjacents, 4); @test equal(roundone, RoundOne) == true 
    roundtwo = shuffle(RoundOne, adjacents, 4); @test equal(roundtwo, RoundTwo) == true
    roundthree=shuffle(RoundTwo, adjacents, 4); @test equal(roundthree, RoundThree) == true
    roundfour = shuffle(RoundThree, adjacents, 4); @test equal(roundfour, RoundFour) == true
end
@testset "Plane Boarding" begin
    @test boarding(Airbus, adjacents, 4) == 37
end
@testset "Plane Boarding Part 2 -- firstseat()" begin
    soloseat = Seats(seatmap("firstseat-8.txt")...)
    @test firstseat(soloseat.Empty[1]) == 8
    leftseat = Seats(seatmap("firstseat-1.txt")...)
    @test firstseat(leftseat.Empty[1]) == 1
    centerseat = Seats(seatmap("firstseat-0.txt")...)
    @test firstseat(centerseat.Empty[1]) == 0
end
RoundOne = Seats(seatmap("roundone-26.txt")...)
RoundTwo = Seats(seatmap("roundtwo-26.txt")...)
RoundThree = Seats(seatmap("roundthree-26.txt")...)
RoundFour = Seats(seatmap("roundfour-26.txt")...)
Airbus = Seats(seatmap("roundzero-26.txt")...)
@testset "Plane Boarding Part 2 -- boarding()" begin
    roundone = shuffle(Airbus, adjacents, 4); @test equal(roundone, RoundOne) == true 
    roundtwo = shuffle(RoundOne, adjacents, 4); @test equal(roundtwo, RoundTwo) == true
    roundthree=shuffle(RoundTwo, adjacents, 4); @test equal(roundthree, RoundThree) == true
    roundfour = shuffle(RoundThree, adjacents, 4); @test equal(roundfour, RoundFour) == true
end
