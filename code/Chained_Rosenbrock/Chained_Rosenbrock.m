%Chained Rosenbrock calcolata iterativamente

function [eval] = Chained_Rosenbrock(x)
    eval = 0;
    for i=2:length(x)
        eval = eval + 100*(x(i-1)^2-x(i))^2 + (x(i-1)-1)^2;
    end
end
