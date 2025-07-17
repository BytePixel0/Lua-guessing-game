inputActive = true
inputText = ""

local guessLimit = 5
local guessCount = 0
local secretNumber = math.random(1, 100)
local gameover = false
local waitingforguess = true

function setup()
    showKeyboard()
end

function draw()
    background(0)
    fill(255)
    
    if gameover then
        text("Game Over! Restart to play again.", WIDTH / 2, HEIGHT / 2 + 80)
        hideKeyboard()
    elseif waitingforguess then
        text("Guess a number between 1 and 100:", WIDTH / 2, HEIGHT / 2 + 100)
        text("Your Input: " .. inputText, WIDTH / 2, HEIGHT / 2)
        text("Guesses Left: " .. (guessLimit - guessCount), WIDTH / 2, HEIGHT / 2 - 50)
    end
end

function keyboard(key)
    if not waitingforguess or gameover then return end
    
    if key == RETURN then
        local guess = tonumber(inputText)
        
        if guess == nil then
            print("Invalid input. Type a number.")
        else
            guessCount = guessCount + 1
            
            if guess == secretNumber then
                print("You guessed " .. guess .. "! That's right! You won in " .. guessCount .. " guesses.")
                gameover = true
            elseif guess > secretNumber then
                print("You guessed " .. guess .. "! That's too high.")
            elseif guess < secretNumber then
                print("You guessed " .. guess .. "! That's too low.")
            end
            
            if guessCount >= guessLimit and not gameover then
                print("You reached the guess limit! The number was " .. secretNumber)
                gameover = true
            end
        end
        
        inputText = ""
    elseif key == BACKSPACE then
        inputText = string.sub(inputText, 1, #inputText - 1)
    else
        inputText = inputText .. key
    end
end