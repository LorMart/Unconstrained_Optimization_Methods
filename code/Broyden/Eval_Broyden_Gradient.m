function[Gradient] = Eval_Broyden_Gradient(x_eval)
load("Broyden_Gradient", 'Broyden_G_1', "Broyden_G_2", 'Broyden_G_i', 'Broyden_G_n_1', 'Broyden_G_n' )    

n = length(x_eval);

Gradient = zeros(n, 1);

Gradient(1) = Broyden_G_1(x_eval(1), x_eval(2), x_eval(3));
Gradient(2) = Broyden_G_2(x_eval(2), x_eval(1), x_eval(3),x_eval(4));

for i = 3:n-2
    Gradient(i) = Broyden_G_i(x_eval(i), x_eval(i-1), x_eval(i-2), x_eval(i+1), x_eval(i+2));
end

Gradient(n-1) = Broyden_G_n_1(x_eval(n-1), x_eval(n-2), x_eval(n-3), x_eval(n));
Gradient(n) = Broyden_G_n(x_eval(n), x_eval(n-1), x_eval(n-2));

end