% Assingment 3
% Sean Bailey
% #1 Write a function that takes a number as input and returns a value 
% that is 2 times the number as output.

function [timestwo] = timestwo(inputone)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
timestwo = abs(inputone*2);
end

% #2 Write a function that takes 2 numbers as input and returns values 
% for the sum, difference, product and max of the two numbers as outputs.

function [bigfour] = bigfour(input1,input2)
%Answers will display in the workspace 
% S = Sum
% D = Difference
% M = Max
% P = Prodcut

assignin('base','S',(input1+input2));
assignin('base','D',(abs(input1-input2)));
assignin('base','M',(max(input1,input2)));
assignin('base','P',((input1)*(input2)));
end

% #3 Write a function that takes 2 numbers as inputs and returns Woo 
% if their sum is even and Hah if their sum is odd.

function [yee] = evenodd(inputArg1,inputArg2)

m = (inputArg1+inputArg2);

evenodd = rem(m,2) == 0 

Woo = 0

Hah = ~0
if evenodd == Woo fprintf 'Woo'
else fprint 'Hah'
end
end

% #4 Write a function that takes in a number of
% quarters, dimes, nickels, and pennies as inputs and returns the 
% total amount as output.

function [cash] = dollar(quarter,dime,nickel,penny)

quarter = quarter*.25;
dime = dime*.1;
nickel = nickel*.05;
penny = penny*.01;

cash = abs(quarter+dime+nickel+penny);
end

% #5 Write a function that accepts a single 3-element array (e.g. [3 4 5]), 
% and returns a logical value (0 or 1) indicating if the 3 elements of the array
% represent the sides of a valid triangle. 

function yes = validtri(a)
a=sort(a)
I1 = a(1,1);
I2 = a(1,2);
I3 = a(1,3);

yes = I1+I2

if yes >I3
    fprintf('1')
else 
    fprintf('0')
end


end

% #6 Write a function that takes a number as input and returns true 
% if the number is a prime number and false if the number is not prime.

function [apple] = primeo(inputArg1,inputArg2)

m = (inputArg1+inputArg2);

primeo = rem(m,2) == 0 

False = 0

True = ~0
if primeo == False fprintf 'False'
else fprint 'True'
end
end



% #7 Write a function that takes two vectors and plots their values on a 
% figure. This function should set up the figure with titles for the chart
% and each axis (can be generic names).

function [] = Scheme(inputArg1,inputArg2)

% example of how to call the funtion Scheme([70 80 90],[80,85,90])

plot(100,100) %The Table
hold 'on'
inputArg1_pos = inputArg1;
inputArg2_pos = inputArg2;
plot(inputArg1_pos,inputArg2_pos,'r*')
xlabel('This Label') %Name of the x Axis
ylabel('That Label') %Name of the y Axis
title('The Title') %Name of the Graph



end


% #8 Write a function that takes 2 numbers as input and displays a 
% counter from the lower number to the higher number.

function [Plus1] = Counter(inputArg1,inputArg2)
%UNTITLED15 Summary of this function goes here
%   Detailed explanation goes here

Kenobi = inputArg2 %Higher
Ani = inputArg1 %Lower

Ani < Kenobi;

while (Ani < Kenobi)
    fprintf('Previous Ani +1: %d\n', Ani); 
    Ani = Ani + 1
end 

end



% #9 Write a function that takes a string value as input and 
% returns the length of the string and the first and last character as 
% outputs.

%Doesnt work and is driving me crazy. No matter what word I type in it just
%give me "ans = 6". Mississippi = 6, Sean = 6, Ironman = 6, EastCarolina = 6
% everything equals 6 apparently 

function [] = Shark(inputArg1)
%UNTITLED25 Summary of this function goes here
%   Detailed explanation goes here

inputArg1 = strlength(chr)


end


%%
% #10 Write a function that does not take any input and displays
% “Thank goodness this assignment is over” when called.

function [] = ItsMillerTime

msgbox("Thank Goodness this assignment is over")



end

