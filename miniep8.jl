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
    @test insertion(["A♠","4♥", "3♦", "2♠", "K♠"]) ==["2♠","3♦","4♥","K♠","A♠"]
    @test insertion(["A♠","A♠","A♠","2♠"]) == ["2♠","A♠","A♠","A♠"]
    @test insertion(["10♥","K♠","A♠"]) == ["10♥","K♠","A♠"]
    println("OK")
end

function checkValueAndSuit() # ♦ < ♠ < ♥ < ♣
    @test compareByValueAndSuit("10♠", "10♥") == true
    @test compareByValueAndSuit("2♠", "A♠") == true
    @test compareByValueAndSuit("K♠", "10♥") == true
    @test compareByValueAndSuit("10♦", "K♠") == true
    @test compareByValueAndSuit("J♠", "A♠") == true
    @test compareByValueAndSuit("A♠","J♠") == false
    @test compareByValueAndSuit("2♠", "3♦") == false
    @test compareByValueAndSuit("J♠", "7♥") == true
    @test compareByValueAndSuit("J♣", "J♥") == false
    @test compareByValueAndSuit("K♣", "K♠") == false
    @test compareByValueAndSuit("Q♦", "Q♣") == true
    @test compareByValueAndSuit("A♣", "A♠") == false
    @test compareByValueAndSuit("A♣", "A♣") == false
    @test compareByValueAndSuit("10♠", "A♠") == true
    @test compareByValueAndSuit("A♠", "10♠") == false
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

function swap(vector, i, j)
    aux = vector[i]
    vector[i] = vector[j]
    vector[j] = aux
end

function insertion(vector)

    for i in 2 : length(vector)
        j = i

        while j > 1
            if compareByValue(vector[j], vector[j - 1])
                swap(vector, j, j - 1)
            else
                break
            end
            j -= 1
        end

    end
    
    return vector
end

checkInsertion()

function compareByValueAndSuit(x, y)

    if x[length(x)] == y[length(y)]
        return compareByValue(x,y)
    end

    suit = ['♦','♠','♥','♣']
    compX = compY = 0

    for index in 1 : length(suit)

        if suit[index] == x[length(x)]
            compX = index
        end

        if suit[index] == y[length(y)]
            compY = index
        end

    end

    if compX < compY
        return true
    else
        return false
    end

end

checkValueAndSuit()
