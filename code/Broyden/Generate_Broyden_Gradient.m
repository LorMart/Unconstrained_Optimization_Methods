function [] = Generate_Broyden_Gradient()

    syms x_p x_i x_s x_p_p x_s_s

    Broyden_1 = str2sym("(((3-2*x_i)*x_i-2*x_s+1)^2)/2 + (((3-2*x_s)*x_s-2*x_s_s-x_i+1)^2)/2");
    Broyden_2 = str2sym("(((3-2*x_p)*x_p-2*x_i+1)^2)/2 + (((3-2*x_i)*x_i-2*x_s-x_p+1)^2)/2 + (((3-2*x_s)*x_s-2*x_s_s-x_i+1)^2)/2");
    Broyden_i = str2sym("(((3-2*x_p)*x_p-2*x_i-x_p_p+1)^2)/2 + (((3-2*x_i)*x_i-2*x_s-x_p+1)^2)/2 + (((3-2*x_s)*x_s-2*x_s_s-x_i+1)^2)/2");
    Broyden_n_1 = str2sym("(((3-2*x_p)*x_p-2*x_i-x_p_p+1)^2)/2 + (((3-2*x_i)*x_i-2*x_s-x_p+1)^2)/2 + (((2-3*x_s)*x_s-x_i+1)^2)/2");
    Broyden_n = str2sym("(((3-2*x_p)*x_p-2*x_i-x_p_p+1)^2)/2 + (((3-2*x_i)*x_i-x_p+1)^2)/2");

    Broyden_G_1 = diff(Broyden_1, x_i);
    Broyden_G_2 = diff(Broyden_2, x_i);
    Broyden_G_i = diff(Broyden_i, x_i);
    Broyden_G_n_1 = diff(Broyden_n_1, x_i);
    Broyden_G_n = diff(Broyden_n, x_i);

    Broyden_G_1 = matlabFunction(Broyden_G_1);
    Broyden_G_2 = matlabFunction(Broyden_G_2);
    Broyden_G_i = matlabFunction(Broyden_G_i);
    Broyden_G_n_1 = matlabFunction(Broyden_G_n_1);
    Broyden_G_n = matlabFunction(Broyden_G_n);

    save("Broyden_Gradient", 'Broyden_G_1', "Broyden_G_2", 'Broyden_G_i', 'Broyden_G_n_1', 'Broyden_G_n' );    


