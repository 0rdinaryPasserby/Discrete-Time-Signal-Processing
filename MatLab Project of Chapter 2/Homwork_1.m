%% Homework 1 - 1
%-----------------------------------------------------------------------------------
%  Write a MATLAB program to generate a discrete-time exponential signal. Use this 
%  function to plot the exponential x[n]=(0.9) n  over the range n=0, 1, 2, ¡K, 20. 
%-----------------------------------------------------------------------------------
n = 0:20;
x= power(0.9 ,n);
%---------------------------------
figure(1)
subplot(2,1,1);
plot(n,x);
xlabel('n');
ylabel('x(n)');
title('Discrete Analog Signals'); 
%----------------------------------
subplot(2,1,2);
x = stem(n,x);
xlabel('n');
ylabel('x(n)');
title('Discrete Digital Signals');
%----------------------------------
grid
saveas(gcf,'Hw1-1.png')
%% Homework 1 - 2a
%----------------------------------------------------------------------------------
% y[n] - 1.8*cos(pi/16)*y[n-1] + 0.81*y[n-2] = x[n] +1/2 x[n-1]
%----------------------------------------------------------------------------------
n = -10 :100 ; 
y_axis = []; 
for i = n
    y_axis(i+11) = func(y_axis,i);
end

figure(2)
subplot(2,1,1);
stem(n,y_axis);
xlabel('n');
ylabel('h[n]');
title('Recursion'); 

%% Homework 1 - 2b
%----------------------------------------------------------------------------------
x = zeros(1,111);

x(1,11) = 1 ; 

A = [1,0.5]; 
B = [1, -1.8 *cos(pi/16) , 0.81];
y =filter(A,B,x);
subplot(2,1,2);
stem(-10:100 , y);
xlabel('n');
ylabel('h[n]');
title('filter'); 
axis tight; 
saveas(gcf,'Hw1-2.png')

%% 1-2a function 
function x = delta(n)  
    if n == 0 
        x=1 ; 
    else
        x=0;
    end
end

function y = func(y_s, i ) 
    if ( i < -10) 
        y = 0; 
    elseif(i == -10)
        y =  delta( i + 11 ) + 1/2*delta( i+ 11 -1 );
    elseif(i == -9)
        y = 1.8 *cos(pi/16) * y_s(i-1 + 11) + delta(i + 11) + 1/2* delta(i+11 - 1) ; 
    else
        y = 1.8*cos(pi/16)* y_s(i - 1 + 11) - 0.81*y_s(i - 2 + 11) +delta(i + 11)+ 1/2 * delta(i-1 +11);
    end
end









