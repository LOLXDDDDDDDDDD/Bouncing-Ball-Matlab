% modifiable value, time step of the calcuation in seconds
timeStep = 0.01;

% modifiable value, total time in seconds to be calculated
totalTime = 10;

% a is the acceleration of the ball, which is -9.81ms^-2 
% that is the acceleration affected by gravity
% negative value since going down is negative instead of positive
a = -9.81;

% initial velocity is 0
v = 0;

% number of calculation is determined by
% total time / (time step)
numberOfCal = totalTime / timeStep;

% make height array of 0 
% it will store all result
h = zeros(numberOfCal, 1);

% first element of array is the initial height
% entered by user
% the script below check if value is h(1) > 0
h(1) = input("Enter initial height ");
while true
    if h(1) < 0
        warning("Only value larger than 0 is accepted");
        h(1) = input("Enter initial height ");
    else
        break;
    end
end

% COR is the coefficient of restitution, 
% it is the ratio of the final to initial relative velocity 
% between two objects after they collide
% the script below check if value is 0 <= COR <= 1
COR = input("Enter COR ");
while true
    if COR < 0 || COR > 1
        warning("Only value ranges from 0 to 1 is accepted");
        COR = input("Enter COR ");
    else
        break;
    end
end

% i begins at 2 cause 1 is initial height
for i = 2 : length(h)
    
    % calcutae new velocity
    % derived from v = u + a*t
    v = v + a * timeStep;

    % calculate new height
    % derived from v = displacement / time
    h(i) = v * timeStep + h(i - 1);

    % if height is equals or less than 0, 
    % the ball should bounce next time step.
    % modify v so that in next increment it will goes up
    % modify h(i) so that it will not be negative
    if h(i) <= 0
        % v is changed to positive and reduced according to COR
        v = -v * COR;
        h(i) = 0;
    end
end

% "(1:numberOfCal) * timeStep" represents each "t" used in calculation
plot( (1:numberOfCal) * timeStep, h); 
title('height vs time of a bouncing ball');
ylabel('height (m)');
xlabel('time (s)');




