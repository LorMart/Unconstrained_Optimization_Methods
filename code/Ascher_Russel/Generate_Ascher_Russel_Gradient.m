function [] = Generate_AscherRussel_Gradient()
    syms x_p_p x_p x_i x_s x_s_s

    AR_dx0 = str2sym("(1/2)*(2*x_s - 2*(h^2)*(x_s^2 + (x_s_s - x_i)/(2*h)) - x_i - x_s_s)^2");
    AR_dx1 = str2sym("(1/2)*((2*x_i - 2*(h^2)*(x_i^2 + (x_s - x_p)/(2*h)) - x_p - x_s)^2 + (2*x_s - 2*h^2*(x_s^2+(x_s_s + x_i)/(2*h)) - x_i - x_s_s)^2)");
    AR_dxi = str2sym("(1/2)*((2*x_p - 2*(h^2)*(x_p^2 + (x_i-x_p_p)/(2*h)) - x_p_p - x_i)^2 + (2*x_i - 2*(h^2)*(x_i^2 + (x_s - x_p)/(2*h)) - x_p - x_s)^2 + (2*x_s - 2*h^2*(x_s^2+(x_s_s + x_i)/(2*h)) - x_i - x_s_s)^2)");
    AR_dn  = str2sym("(1/2)*((2*x_p - 2*(h^2)*(x_p^2 + (x_i-x_p_p)/(2*h) - x_p_p - x_i))^2 + (2*x_i - 2*(h^2)*(x_i^2 + (x_s - x_p)/(2*h)) - x_p - x_s)^2)");
    AR_dn1 = str2sym("(1/2)*((2*x_p - 2*(h^2)*(x_p^2 + (x_i-x_p_p)/(2*h)) - x_p_p - x_i)^2)");

    AR_dx0 = diff(AR_dx0, x_i);
    AR_dx1 = diff(AR_dx1, x_i);
    AR_dxi = diff(AR_dxi, x_i);
    AR_dn  = diff(AR_dn, x_i);
    AR_dn1 = diff(AR_dn1, x_i);

    AR_dx0 = matlabFunction(AR_dx0);
    AR_dx1 = matlabFunction(AR_dx1);
    AR_dxi = matlabFunction(AR_dxi);
    AR_dn  = matlabFunction(AR_dn);
    AR_dn1 = matlabFunction(AR_dn1);

    save('Gradient_AscherRussel_functions', "AR_dx0", "AR_dx1" , "AR_dxi", "AR_dn", "AR_dn1");


end