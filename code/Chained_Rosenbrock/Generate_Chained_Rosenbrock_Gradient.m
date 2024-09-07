function [] = Generate_Chained_Rosenbrock_Gradient()
    
    syms x_1 x_i x_n
    
    %n = length(x_eval);
    
    Ros_1 = str2sym("100*(x_1^2-x_2)^2 + (x_1-1)^2");
    Ros_i = str2sym("100*(x_p^2-x_i)^2 + (x_p-1)^2 + 100*(x_i^2-x_s)^2 + (x_i-1)^2");
    Ros_n = str2sym("100*(x_p^2-x_n)^2 + (x_p-1)^2");
    
    Ros_G_1 = diff(Ros_1,x_1); % 2*x_1 - 400*x_1*(- x_1^2 + x_2) - 2
    Ros_G_i = diff(Ros_i,x_i); % - 200*x_p^2 + 202*x_i - 400*x_i*(x_s - x_i^2) - 2
    Ros_G_n = diff(Ros_n,x_n); % - 200*x_p^2 + 200*x_n


    Ros_G_1 = matlabFunction(Ros_G_1);
    Ros_G_i = matlabFunction(Ros_G_i);
    Ros_G_n = matlabFunction(Ros_G_n);
    
    save('Gradient_Rosenbrock_functions', "Ros_G_1", "Ros_G_i", "Ros_G_n")

end