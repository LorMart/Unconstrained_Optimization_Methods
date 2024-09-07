function [eval] = Eval_Broyden(x_eval)
    n = length(x_eval);
    
    eval = ((3-2*x_eval(1))*x_eval(1)-2*x_eval(2)+1)^2;

    for i = 2:n-1
        eval = eval + ((3-2*x_eval(i))*x_eval(i)-x_eval(i-1)-2*x_eval(i+1)+1)^2;
    end

    eval = eval + ((3-2*x_eval(n))*x_eval(n)-x_eval(n-1)+1)^2;
    eval = eval/2;
end
