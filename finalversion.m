% Patrick Sumarli a1811952
% Project Matlab

% This program is a text guessing game of country names
% Source of csv file: https://stefangabos.github.io/world_countries/
% Countries excluded due to naming difficulty : CÃ´te d'Ivoire

clear;
clc;

% Generate table of words
list=importdata('countries.csv');
[row, col]=size(list);

% Generate random word from list and convert it into a suitable type
rng('shuffle');
randomDraw=randi(192);
word=list(randomDraw, col);
word=char(word);
word=upper(word);

% Turn word into asterisks (*)
guess=[];
for i=1:length(word)
    guess=[guess '*'];
end

% Turn space into spaces instead of asterisks
for i=1:length(word)
    if word(i)==' '
        guess(i)=' ';
    end
end

% Lives and states
playerWon=false;
usedLetters=[];
wrongLetters=[];
lives=generateLives(wrongLetters, guess);

% Generate instructions
disp('The country names are in uppercase');
disp('Guess the letters in the asterisks (*)');
fprintf('You have %d lives, good luck!\n',lives);
disp('                                   ');
disp(guess);
disp('                                   ');


% Loop until win or lost
while ~playerWon
    
    % Ask for input and convert the letter into upper
    letter=input('Enter a letter : ','s');
    letter=upper(letter);
    disp('                                   ');
    
    % Check for invalidity of input
    % Reject spaces or empty inputs
    if letter =="" || letter == " "
        disp('Invalid input');
        disp('                                   ');
        continue
        
    % Reject everything that is not 1 character
    elseif length(letter)~=1
        disp('Invalid input');
        disp('                                   ');
        continue
    end
    
    % Generate states
    correct=0;
    wrong=0;
    
    % Check if the letter is included in the word
    for i=1:length(word)
        if letter==word(i) && guess(i)=='*'
            % Replacing the asterisks with the guessed letters
            guess(i)=word(i); 
        % Checking if no characters in the word match the letter from user
        else
            wrong=wrong+1;
            if wrong==length(word)
                wrongLetters=[wrongLetters letter];
                lives=generateLives(wrongLetters, guess);
                disp('                                   ');
            end
        end
    end
    
    % Display current progress
    disp(guess);
    
    % Display used letters
    usedLetters=[usedLetters, letter];
    disp('                                   ');
    disp('You used: ');
    disp(usedLetters);
    disp('                                   ');
    
    % Display false or correct
    if wrong==length(guess)
        fprintf('False, you have %d lives left.\n',lives);
    else
        fprintf('Correct, you have %d lives left.\n',lives);
    end
    disp('                                   ');
    
    % Check if player has lost
    if lives==0
        fprintf('You lost, the word was %s\n',word);
        break
    end
    
    % Check if all letters are discovered
    for i=1:length(guess)
        if guess(i)~='*'
            correct=correct+1;
        end
    end
    
    % Check if player has won
    if correct==length(word)
        fprintf('You won, the word was %s, congratulations!\n',word);
        break
    end
    
end





