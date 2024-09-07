function [Hessian] = Eval_Ascher_Russel_Hessian(x_eval)
    
    n = length(x_eval)-2;
    Hessian = zeros(n+2, n+2);
    h = 1/(n+1);

    load("Hessian_AscherRussel_functions", "AR_dx0_dx0", "AR_dx0_dx1", "AR_dx0_dx2", "AR_dx1_dx0", "AR_dx1_dx1", "AR_dx1_dx2", "AR_dx1_dx3", "AR_dxi_dx_p_p", "AR_dxi_dx_p"  , "AR_dxi_dx_i", "AR_dxi_dx_s", "AR_dxi_dx_s_s", "AR_dn_dx_p_p", "AR_dn_dx_p", "AR_dn_dx_i", "AR_dn_dx_s", "AR_dn1_dx_p_p", "AR_dn1_dx_p", "AR_dn1_dx_i")


    Hessian(1, 1) = AR_dx0_dx0(h);
    Hessian(1, 2) = AR_dx0_dx1(h, x_eval(2));
    Hessian(1, 3) = AR_dx0_dx2(h);

    Hessian(2, 1) = AR_dx1_dx0(h, x_eval(2));
    Hessian(2, 2) = AR_dx1_dx1(h, x_eval(2), x_eval(1), x_eval(3));
    Hessian(2, 3) = AR_dx1_dx2(h, x_eval(2), x_eval(3));
    Hessian(2, 4) = AR_dx1_dx3(h);

    for i = 3:n
        Hessian(i, i-2) = AR_dxi_dx_p_p(h);
        Hessian(i, i-1) = AR_dxi_dx_p(h, x_eval(i), x_eval(i-1));
        Hessian(i, i)   = AR_dxi_dx_i(h, x_eval(i), x_eval(i-1), x_eval(i+1));
        Hessian(i, i+1) = AR_dxi_dx_s(h, x_eval(i), x_eval(i+1));
        Hessian(i, i+2) = AR_dxi_dx_s_s(h);
    end
    
    Hessian(n+1, n-1) = AR_dn_dx_p_p(h);
    Hessian(n+1, n) = AR_dn_dx_p(h, x_eval(n+1), x_eval(n));
    Hessian(n+1, n+1) = AR_dn_dx_i(h, x_eval(n+1), x_eval(n), x_eval(n+2));
    Hessian(n+1, n+2) = AR_dn_dx_s(h, x_eval(n+1));

    Hessian(n+2, n) = AR_dn1_dx_p_p(h);
    Hessian(n+2, n+1) = AR_dn1_dx_p(h, x_eval(n+1));
    Hessian(n+2, n+2) = AR_dn1_dx_i(h);

    Hessian = spdiags(Hessian);
end