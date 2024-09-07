function [] = Generate_AscherRussel_Hessian()
    
    syms x_p_p x_p x_i x_s x_s_s

    %@(h,x_i,x_s,x_s_s)
    AR_dx0 = str2sym("-(h-1.0).*(x_i-x_s.*2.0+x_s_s-h.^2.*((x_i-x_s_s)./(h.*2.0)-x_s.^2).*2.0)");
    %@(h,x_i,x_p,x_s,x_s_s)
    AR_dx1 = str2sym("(h+1.0).*(x_i-x_s.*2.0+x_s_s+h.^2.*((x_i+x_s_s)./(h.*2.0)+x_s.^2).*2.0)-(h.^2.*x_i.*4.0-2.0).*(x_i.*2.0-x_p-x_s+h.^2.*((x_p-x_s)./(h.*2.0)-x_i.^2).*2.0)");
    %@(h,x_i,x_p,x_p_p,x_s,x_s_s)
    AR_dxi = str2sym("(h+1.0).*(x_i-x_s.*2.0+x_s_s+h.^2.*((x_i+x_s_s)./(h.*2.0)+x_s.^2).*2.0)+(h+1.0).*(x_i-x_p.*2.0+x_p_p+h.^2.*((x_i-x_p_p)./(h.*2.0)+x_p.^2).*2.0)-(h.^2.*x_i.*4.0-2.0).*(x_i.*2.0-x_p-x_s+h.^2.*((x_p-x_s)./(h.*2.0)-x_i.^2).*2.0)");
    %@(h,x_i,x_p,x_p_p,x_s)
    AR_dn  = str2sym("-(h.^2.*x_i.*4.0-2.0).*(x_i.*2.0-x_p-x_s+h.^2.*((x_p-x_s)./(h.*2.0)-x_i.^2).*2.0)-h.^2.*(1.0./(h.*2.0)-1.0).*(x_p.*2.0+h.^2.*(x_i+x_p_p-(x_i-x_p_p)./(h.*2.0)-x_p.^2).*2.0).*2.0");
    %@(h,x_i,x_p,x_p_p)
    AR_dn1 = str2sym("(h+1.0).*(x_i-x_p.*2.0+x_p_p+h.^2.*((x_i-x_p_p)./(h.*2.0)+x_p.^2).*2.0)");

    AR_dx0_dx0 = matlabFunction(diff(AR_dx0, x_i));
    AR_dx0_dx1 = matlabFunction(diff(AR_dx0, x_s));
    AR_dx0_dx2 = matlabFunction(diff(AR_dx0, x_s_s));

    AR_dx1_dx0 = matlabFunction(diff(AR_dx1, x_p));
    AR_dx1_dx1 = matlabFunction(diff(AR_dx1, x_i));
    AR_dx1_dx2 = matlabFunction(diff(AR_dx1, x_s));
    AR_dx1_dx3 = matlabFunction(diff(AR_dx1, x_s_s));

    AR_dxi_dx_p_p = matlabFunction(diff(AR_dxi, x_p_p));
    AR_dxi_dx_p   = matlabFunction(diff(AR_dxi, x_p));
    AR_dxi_dx_i   = matlabFunction(diff(AR_dxi, x_i));
    AR_dxi_dx_s   = matlabFunction(diff(AR_dxi, x_s));
    AR_dxi_dx_s_s = matlabFunction(diff(AR_dxi, x_s_s));

    AR_dn_dx_p_p  = matlabFunction(diff(AR_dn, x_p_p));
    AR_dn_dx_p    = matlabFunction(diff(AR_dn, x_p));
    AR_dn_dx_i    = matlabFunction(diff(AR_dn, x_i));
    AR_dn_dx_s    = matlabFunction(diff(AR_dn, x_s));
    
    AR_dn1_dx_p_p = matlabFunction(diff(AR_dn1, x_p_p));
    AR_dn1_dx_p   = matlabFunction(diff(AR_dn1, x_p));
    AR_dn1_dx_i   = matlabFunction(diff(AR_dn1, x_i));

    save("Hessian_AscherRussel_functions", "AR_dx0_dx0", "AR_dx0_dx1", "AR_dx0_dx2", "AR_dx1_dx0", "AR_dx1_dx1", "AR_dx1_dx2", "AR_dx1_dx3", "AR_dxi_dx_p_p", "AR_dxi_dx_p"  , "AR_dxi_dx_i", "AR_dxi_dx_s", "AR_dxi_dx_s_s", "AR_dn_dx_p_p", "AR_dn_dx_p", "AR_dn_dx_i", "AR_dn_dx_s", "AR_dn1_dx_p_p", "AR_dn1_dx_p", "AR_dn1_dx_i")

end
