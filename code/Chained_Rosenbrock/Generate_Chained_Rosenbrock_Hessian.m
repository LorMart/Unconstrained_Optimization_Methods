function [] = Generate_Chained_Rosenbrock_Hessian()    
    syms x_1 x_2 x_p x_i x_s x_n

    %Hessiano
    
    %n = length(x_eval);
    
    %Defining the generic Gradient
    
    Ros_G_1 = str2sym("2*x_1 - 400*x_1*(- x_1^2 + x_2) - 2");
    Ros_G_i = str2sym("- 200*x_p^2 + 202*x_i - 400*x_i*(x_s - x_i^2) - 2");
    Ros_G_n = str2sym("- 200*x_p^2 + 200*x_n");
    
    %Finding the partial derivatives as symbolic functions
    
    Ros_H_1_1 = diff(Ros_G_1,x_1);                                         %1200*x_1^2 - 400*x_2 + 2
    Ros_H_1_2 = diff(Ros_G_1,x_2);                                         %-400*x_1
    
    Ros_H_i_p = diff(Ros_G_i,x_p);                                         %-400*x_p
    Ros_H_i_i = diff(Ros_G_i,x_i);                                         %1200*x_i^2 - 400*x_s + 202
    Ros_H_i_s = diff(Ros_G_i,x_s);                                         %-400*x_i
    
    Ros_H_n_p = diff(Ros_G_n,x_p);                                         %x_p
    Ros_H_n_n = diff(Ros_G_n,x_n);                                         %200
    
    
    %Converting symbolic functions to matlab functions for improved
    %efficiency

    Ros_H_1_1 = matlabFunction(Ros_H_1_1);                               %1200*x_1^2 - 400*x_2 + 2
    Ros_H_1_2 = matlabFunction(Ros_H_1_2);                                %-400*x_1
    
    Ros_H_i_p = matlabFunction(Ros_H_i_p);
    Ros_H_i_i = matlabFunction(Ros_H_i_i);
    Ros_H_i_s = matlabFunction(Ros_H_i_s);
    
    Ros_H_n_p = matlabFunction(Ros_H_n_p);                                %x_p
    Ros_H_n_n = matlabFunction(Ros_H_n_n);                                %200
    
    save('Hessian_Rosenbrock_functions', "Ros_H_1_1", "Ros_H_1_2", "Ros_H_i_p",...
        "Ros_H_i_i", "Ros_H_i_s", "Ros_H_n_p", "Ros_H_n_n")

end