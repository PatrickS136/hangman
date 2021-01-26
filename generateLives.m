function lives=generateLives(wrongLetters, guess)
    % Generate lives
    if length(guess)>9
        lives=9;
    else
        lives=6;
    end
    lives=lives-length(wrongLetters);
end