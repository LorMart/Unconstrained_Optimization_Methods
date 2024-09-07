function [eval] = Eval_AscherRussel(x_eval)
    n = length(x_eval)-2;
    eval = 0;
    h = 1 / (n+1);
    
    for i  = 2:n
        eval = eval + (x_eval(i) - 2*h^2*(x_eval(i)^2 + (x_eval(i+1) - x_eval(i-1))/2*h) )^2;
    end
    eval = eval/2;
end