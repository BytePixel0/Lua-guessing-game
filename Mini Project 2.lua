
--# Main
print("Start")

local guessLimit = 5
local guessCount = 0
local minNumber = 1
local maxNumber = 20
local secretNumber = math.random(minNumber, maxNumber)

local guesses = {12, 14, 11, 1, 4}
local totalGuesses = table.concat(guesses, ", ")
local guessesMade = {}

for index, value in ipairs(guesses) do
    
    guessCount = guessCount + 1
    
    table.insert(guessesMade, value)
    
    if value == secretNumber then
        print("You guessed " .. value .. " ! Thats Right!. You won in " .. guessCount .. " guesses")
        break
    end
    if value > secretNumber then
        print("You guessed " .. value .. " ! Thats too high.") 
    end
    if value < secretNumber then
        print("You guessed " .. value .. " ! Thats too low.")
    end
    if guessCount >= guessLimit then
        print("You reached guess limit! The number was " .. secretNumber)
        break
    end
end
print("Your guesses were " .. table.concat(guessesMade, ", "))