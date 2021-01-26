clear;
clc;

% If you have guessed wrongly 3 times and the word is 10 characters
fprintf('You should have 6 lives\n');
wrongLetters=['A' 'B' 'C'];
lives=generateLives(wrongLetters, '**********');
disp(lives);

% If you have guessed wrongly 5 times and the word is 6 characters
fprintf('You should have 1 life\n');
wrongLetters=['A' 'B' 'C' 'D' 'E'];
lives=generateLives(wrongLetters, '******');
disp(lives);

% If you have guessed wrongly 0 times and the word is 6 characters
fprintf('You should have 6 lives\n');
wrongLetters=[];
lives=generateLives(wrongLetters, '******');
disp(lives);

% If you have guessed wrongly 2 times and the word is 3 characters
fprintf('You should have 4 lives\n');
wrongLetters=['A' 'B'];
lives=generateLives(wrongLetters, '***');
disp(lives);


% If you have guessed wrongly 0 times and the word is 10 characters
fprintf('You should have 9 lives\n');
wrongLetters=[];
lives=generateLives(wrongLetters, '**********');
disp(lives);
