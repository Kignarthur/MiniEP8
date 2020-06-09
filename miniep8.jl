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

function checkInsertion()
    @test insertion(["10♥", "10♦", "K♠", "A♠", "J♠", "A♠"]) == ["10♥","10♦","J♠","K♠","A♠","A♠"]
    @test insertion([]) == []
    @test insertion(["10♥"]) == ["10♥"]
    @test insertion(["K♦", "K♠"]) == ["K♦", "K♠"]
    @test insertion(["A♠","4♥", "3♦", "2♠", "K♠"]) ==["1♠","2♠","3♦","4♥","K♠","A♠"]
    @test insertion(["A♠","A♠","A♠","2♠"]) == ["2♠","A♠","A♠","A♠"]
    @test insertion(["10♥","K♠","A♠"]) == ["10♥","K♠","A♠"]
    println("OK")
end

function compareByValue(x, y)

    value = ["2","3","4","5","6","7","8","9","10","J","Q","K","A"]
    compX = compY = 0

    for index in 1 : length(value)

        if value[index] == x[1:length(x)-1]
            compX = index
        end

        if value[index] == y[1:length(y)-1]
            compY = index
        end

    end

    if compX < compY
        return true
    else
        return false
    end

end

checkValue()
