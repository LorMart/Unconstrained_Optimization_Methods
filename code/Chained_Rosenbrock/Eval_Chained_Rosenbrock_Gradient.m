function [Gradient] = Eval_Chained_Rosenbrock_Gradient(x_eval)   

    load("Gradient_Rosenbrock_functions.mat", "Ros_G_1", "Ros_G_i", "Ros_G_n")

    n = length(x_eval);
    
    Gradient = zeros(n,1);
      
    Gradient(1) = Ros_G_1(x_eval(1), x_eval(2));
    
    for i=2:n-1
        Gradient(i) = Ros_G_i(x_eval(i),x_eval(i-1),x_eval(i+1));
    end
    
    Gradient(n) = Ros_G_n(x_eval(n),x_eval(n-1));

end
