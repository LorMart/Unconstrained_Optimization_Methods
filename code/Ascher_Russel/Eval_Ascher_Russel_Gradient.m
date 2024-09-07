function [Gradient] = Eval_AscherRussel_Gradient(x_eval)
    
    load("Gradient_AscherRussel_functions", "AR_dx0", "AR_dx1" , "AR_dxi", "AR_dn", "AR_dn1");

    n = length(x_eval)-2;
    h = 1/(1+n);

    Gradient = zeros(n+2, 1);

    Gradient(1) = AR_dx0(h, x_eval(1), x_eval(2), x_eval(3));
    Gradient(2) = AR_dx1(h, x_eval(2), x_eval(1), x_eval(3), x_eval(4));
    for i = 3:n
        Gradient(i) = AR_dxi(h, x_eval(i), x_eval(i-1), x_eval(i-2), x_eval(i+1), x_eval(i+2));
    end
    Gradient(n+1) = AR_dn(h, x_eval(n+1), x_eval(n), x_eval(n-1), x_eval(n+2));
    Gradient(n+2) = AR_dn1(h, x_eval(n+2), x_eval(n+1), x_eval(n));
end