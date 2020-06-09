using Test

function checkValue()
    @test compareByValue("10♠", "10♥") == false
    @test compareByValue("2♠", "A♠") == true
    @test compareByValue("K♥", "10♥") == false
    @test compareByValue("10♦", "K♠") == true
    @test compareByValue("J♠", "A♠") == true
    @test compareByValue("A♠","J♠") == false
    @test compareByValue("2♠", "3♥") == true
    @test compareByValue("J♠", "7♥") == false
    @test compareByValue("J♥", "J♥") == false
    @test compareByValue("K♦", "K♠") == false
    @test compareByValue("Q♦", "Q♠") == false
    @test compareByValue("A♦", "A♠") == false
    println("OK")
end
