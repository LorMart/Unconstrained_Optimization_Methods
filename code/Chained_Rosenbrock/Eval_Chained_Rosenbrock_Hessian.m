function [Hessian] = Eval_Chained_Rosenbrock_Hessian(x_eval)   
    
    load('Hessian_Rosenbrock_functions', "Ros_H_1_1", "Ros_H_1_2", "Ros_H_i_p",...
        "Ros_H_i_i", "Ros_H_i_s", "Ros_H_n_p", "Ros_H_n_n")

    n = length(x_eval);

    Hessian = zeros(n, 3);
    
    Hessian(1, 2) = Ros_H_1_1(x_eval(1), x_eval(2));                   %vpa(subs(Ros_H_1_1, [x_1, x_2], x_eval(1:2)'));
    Hessian(2, 3) = Ros_H_1_2(x_eval(1));                              %vpa(subs(Ros_H_1_2, x_1, x_eval(1)'));
    
    for i=2:n-1
        Hessian(i-1, 1) = Ros_H_i_p(x_eval(i-1));                        %-400*x_eval(i-1); %vpa(subs(Ros_H_i_p, x_p, x_eval(i-1)'));
        Hessian(i, 2) = Ros_H_i_i(x_eval(i),x_eval(i+1));              %1200*x_eval(i)^2 - 400*x_eval(i+1) + 202; %vpa(subs(Ros_H_i_i, [x_i, x_s], x_eval(i:i+1)'));
        Hessian(i+1, 3) = Ros_H_i_s(x_eval(i));                          %-400*x_eval(i); %vpa(subs(Ros_H_i_s, x_i, x_eval(i)'));
    end
    
    Hessian(n-1, 1) = Ros_H_n_p(x_eval(n-1));                            %vpa(subs(Ros_H_n_p, x_p, x_eval(n-1)));
    Hessian(n, 2) = Ros_H_n_n();
    
end
