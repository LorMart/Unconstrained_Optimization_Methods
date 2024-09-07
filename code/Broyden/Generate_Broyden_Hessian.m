function [] = Generate_Broyden_Hessian()

syms x_p x_i x_s x_p_p x_s_s

Broyden_G_1 = str2sym("x_i+x_s_s.*2.0+x_s.*(x_s.*2.0-3.0)+(x_i.*4.0-3.0).*(x_s.*2.0+x_i.*(x_i.*2.0-3.0)-1.0)-1.0");
Broyden_G_2 = str2sym("x_i.*5.0+x_s_s.*2.0+x_p.*(x_p.*2.0-3.0).*2.0+x_s.*(x_s.*2.0-3.0)+(x_i.*4.0-3.0).*(x_p+x_s.*2.0+x_i.*(x_i.*2.0-3.0)-1.0)-3.0");
Broyden_G_i = str2sym("x_i.*5.0+x_p_p.*2.0+x_s_s.*2.0+x_p.*(x_p.*2.0-3.0).*2.0+x_s.*(x_s.*2.0-3.0)+(x_i.*4.0-3.0).*(x_p+x_s.*2.0+x_i.*(x_i.*2.0-3.0)-1.0)-3.0");
Broyden_G_n_1 = str2sym("x_i.*5.0+x_p_p.*2.0+x_p.*(x_p.*2.0-3.0).*2.0+x_s.*(x_s.*3.0-2.0)+(x_i.*4.0-3.0).*(x_p+x_s.*2.0+x_i.*(x_i.*2.0-3.0)-1.0)-3.0");
Broyden_G_n = str2sym("x_i.*4.0+x_p_p.*2.0+x_p.*(x_p.*2.0-3.0).*2.0+(x_i.*4.0-3.0).*(x_p+x_i.*(x_i.*2.0-3.0)-1.0)-2.0");




Broyden_H_1_3 = diff(Broyden_G_1,x_i);
Broyden_H_1_4 = diff(Broyden_G_1,x_s);
Broyden_H_1_5 = diff(Broyden_G_1,x_s_s);

Broyden_H_2_2 = diff(Broyden_G_2, x_p);
Broyden_H_2_3 = diff(Broyden_G_2, x_i);
Broyden_H_2_4 = diff(Broyden_G_2, x_s);
Broyden_H_2_5 = diff(Broyden_G_2, x_s_s);

Broyden_H_i_1 = diff(Broyden_G_i, x_p_p);
Broyden_H_i_2 = diff(Broyden_G_i, x_p);
Broyden_H_i_3 = diff(Broyden_G_i, x_i);
Broyden_H_i_4 = diff(Broyden_G_i, x_s);
Broyden_H_i_5 = diff(Broyden_G_i, x_s_s);

Broyden_H_n1_1 = diff(Broyden_G_n_1, x_p_p);
Broyden_H_n1_2 = diff(Broyden_G_n_1, x_p);
Broyden_H_n1_3 = diff(Broyden_G_n_1, x_i);
Broyden_H_n1_4 = diff(Broyden_G_n_1, x_s);

Broyden_H_n_1 = diff(Broyden_G_n, x_p_p);
Broyden_H_n_2 = diff(Broyden_G_n, x_p);
Broyden_H_n_3 = diff(Broyden_G_n, x_i);



Broyden_H_1_3 = matlabFunction(Broyden_H_1_3);
Broyden_H_1_4 = matlabFunction(Broyden_H_1_4);
Broyden_H_1_5 = matlabFunction(Broyden_H_1_5);

Broyden_H_2_2 = matlabFunction(Broyden_H_2_2);
Broyden_H_2_3 = matlabFunction(Broyden_H_2_3);
Broyden_H_2_4 = matlabFunction(Broyden_H_2_4);
Broyden_H_2_5 = matlabFunction(Broyden_H_2_5);

Broyden_H_i_1 = matlabFunction(Broyden_H_i_1);
Broyden_H_i_2 = matlabFunction(Broyden_H_i_2);
Broyden_H_i_3 = matlabFunction(Broyden_H_i_3);
Broyden_H_i_4 = matlabFunction(Broyden_H_i_4);
Broyden_H_i_5 = matlabFunction(Broyden_H_i_5);

Broyden_H_n1_1 = matlabFunction(Broyden_H_n1_1);
Broyden_H_n1_2 = matlabFunction(Broyden_H_n1_2);
Broyden_H_n1_3 = matlabFunction(Broyden_H_n1_3);
Broyden_H_n1_4 = matlabFunction(Broyden_H_n1_4);

Broyden_H_n_1 = matlabFunction(Broyden_H_n_1);
Broyden_H_n_2 = matlabFunction(Broyden_H_n_2);
Broyden_H_n_3 = matlabFunction(Broyden_H_n_3);

save("Broyden_Hessian", 'Broyden_H_1_3', 'Broyden_H_1_4', 'Broyden_H_1_5', 'Broyden_H_2_2', 'Broyden_H_2_3', 'Broyden_H_2_4', 'Broyden_H_2_5', 'Broyden_H_i_1', 'Broyden_H_i_2', 'Broyden_H_i_3', 'Broyden_H_i_4', 'Broyden_H_i_5', 'Broyden_H_n1_1', 'Broyden_H_n1_2', 'Broyden_H_n1_3', 'Broyden_H_n1_4', 'Broyden_H_n_1', 'Broyden_H_n_2', 'Broyden_H_n_3')

