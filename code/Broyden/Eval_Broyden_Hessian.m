function[Hessian] = Eval_Broyden_Hessian(x_eval)

    load("Broyden_Hessian", 'Broyden_H_1_3', 'Broyden_H_1_4', 'Broyden_H_1_5', 'Broyden_H_2_2', 'Broyden_H_2_3', 'Broyden_H_2_4', 'Broyden_H_2_5', 'Broyden_H_i_1', 'Broyden_H_i_2', 'Broyden_H_i_3', 'Broyden_H_i_4', 'Broyden_H_i_5', 'Broyden_H_n1_1', 'Broyden_H_n1_2', 'Broyden_H_n1_3', 'Broyden_H_n1_4', 'Broyden_H_n_1', 'Broyden_H_n_2', 'Broyden_H_n_3')

    n = length(x_eval);

    Hessian = zeros(n, 5);

    Hessian(1, 3) = Broyden_H_1_3(x_eval(1), x_eval(2));            
    Hessian(2, 4) = Broyden_H_1_4(x_eval(1), x_eval(2));   
    Hessian(3, 5) = Broyden_H_1_5();               
    
    Hessian(1, 2) = Broyden_H_2_2(x_eval(2), x_eval(1));
    Hessian(2, 3) = Broyden_H_2_3(x_eval(2), x_eval(1), x_eval(3));
    Hessian(3, 4) = Broyden_H_2_4(x_eval(2), x_eval(3));
    Hessian(4, 5) = Broyden_H_2_5();

    for i = 3:n-2
        Hessian(i-2,1) = Broyden_H_i_1();
        Hessian(i-1,2) = Broyden_H_i_2(x_eval(i), x_eval(i-1));
        Hessian(i,  3) = Broyden_H_i_3(x_eval(i), x_eval(i-1), x_eval(i+1));
        Hessian(i+1,4) = Broyden_H_i_4(x_eval(i), x_eval(i+1));
        Hessian(i+2,5) = Broyden_H_i_5();
    end

    Hessian(n-3, 1) = Broyden_H_n1_1();
    Hessian(n-2, 2) = Broyden_H_n1_2(x_eval(n-1), x_eval(n-2));
    Hessian(n-1, 3) = Broyden_H_n1_3(x_eval(n-1), x_eval(n-2), x_eval(n));
    Hessian(n, 4) = Broyden_H_n1_4(x_eval(n-1), x_eval(n));

    Hessian(n-2, 1) = Broyden_H_n_1();            
    Hessian(n-1, 2) = Broyden_H_n_2(x_eval(n), x_eval(n-1));   
    Hessian(n, 3) = Broyden_H_n_3(x_eval(n), x_eval(n-1));    
    
end