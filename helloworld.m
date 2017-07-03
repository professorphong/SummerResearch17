%This is our first MA222 Function
t=linspace(0,10*pi,1000); %t goes from 0 to 1000 in increments of 10*pi
plot3(cos(t),sin(t),t)% The vector function
hold on %This tells us that we are going to plot a second graph in the plotting window
plot3(-sqrt(2)/2, -sqrt(2)/2, 5*pi/4, '*')%This plots the asterix at the correct point
t=linspace(-1,1);
plot3(-sqrt(2)/2+t*sqrt(2)/2, -sqrt(2)/2-t*sqrt(2)/2, 5*pi/4+t) %This plots the tangent line
hold off 
clearvars('t')
%Here is a new comment @11:49am on 6/3/17
%Here is another new comment @11:57 on 6/3/17
%Here is another new comment @12:29pm on 6/3/17
%Here is another new comment test @12:34pm on 6/3/17
