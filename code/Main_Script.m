clc
clear all

%Problem And Method Setup

Problem = 3;    % 1 = Chained Rosenbrock; 2 = Broyden; 3 = Ascher & Russel; 4 = Troesch
Method = 1;     % 1 = NLCGM; 2 = Newthon Method;

%                      Dimensione del problema e numero di Iterazioni

n = 10^4;
max_iters = 5000;
max_bt_iters = 500;

%                       Data Structures initialization



%                       Plot utilities

colors = ['r','b','g','c', 'k'];
methods_list = ["NLCGM", "Newton"];
problems_list = ["Chained Rosenbrock", "Broyden", "Ascher Russel", "Troesch"];

%                       Da cambiare in futuro



%                       Caricamento Funzioni specifiche del problema

switch(Problem)
    case 1
        load("Ch_Rs_rand_start_pts_alternati", "random_x_0");
        load("Ch_Rs_rand_start_pts_alternati", "mu_sigma_tuples");
        %Generate_Chained_Rosenbrock_Gradient();
        Function = @(x)Chained_Rosenbrock(x);
        Function_Gradient = @(x)Eval_Chained_Rosenbrock_Gradient(x);
        if(Method == 2)
            %Generate_Chained_Rosenbrock_Hessian();
            Function_Hessian = @(x)Eval_Chained_Rosenbrock_Hessian(x);
        end

    case 2
        load("Broy_rand_start_pts", "random_x_0");
        load("Broy_rand_start_pts", "mu_sigma_tuples");
        Generate_Broyden_Gradient();
        Function = @(x)Eval_Broyden(x);
        Function_Gradient = @(x)Eval_Broyden_Gradient(x);
        if(Method == 2)
            Generate_Broyden_Hessian();
            Function_Hessian = @(x)Eval_Broyden_Hessian(x);
        end

    case 3
        load("As_Ru_rand_start_pts_alternati", "random_x_0");
        load("As_Ru_rand_start_pts_alternati", "mu_sigma_tuples");
        n=n+1;
        Generate_Ascher_Russel_Gradient();
        Function = @(x)Eval_Ascher_Russel(x);
        Function_Gradient = @(x)Eval_Ascher_Russel_Gradient(x);
        if(Method == 2)
            Generate_Ascher_Russel_Hessian();
            Function_Hessian = @(x)Eval_Ascher_Russel_Hessian(x);
        end

    case 4
    load("Ch_Rs_rand_start_pts_alternati", "random_x_0");
    load("Ch_Rs_rand_start_pts_alternati", "mu_sigma_tuples");
    
    Generate_Troesch_Gradient();
    Function = @(x)Eval_Troesch(x);
    Function_Gradient = @(x)Eval_Troesch_Gradient(x);
    if(Method == 2)
        Generate_Troesch_Hessian();
        Function_Hessian = @(x)Eval_Troesch_Hessian(x);

    end
end

%                           Inizializzazione Parametri del Metodo

switch(Method)
    case 1
        alpha0 = 1;
        rho = 0.9;%[0.2, 0.4, 0.6, 0.8]; %prima0.4
        c = 10^-4;
        tol_gradfk_norm = 10^-3;
        tol_delta_xk = 10^-18;
        
    case 2
        rho = 0.9;
        c = 10^-6;
        tol_gradfk_norm = 10^-6;
        tol_delta_xk = 10^-20;
        
end


general_results = zeros(size(random_x_0, 1), size(random_x_0, 2), 6);
f_and_gradf_over_iters = zeros(size(random_x_0, 1),size(random_x_0, 2),2,max_iters+1);

%                           CALCOLO



for h = 3:length(mu_sigma_tuples)

    for i = 1:5
                                  
        x0 = reshape(random_x_0(h, i, :), n, 1); %Selecting starting point


                        % APPLICAZIONE DELL'ALGORITMO SELEZIONATO AL PROBLEMA
                        
        switch(Method)

            %              NLCG METHOD

            case 1

                [F_values, gradf_values,time_to_converge, iters_to_converge, min_at_stopping_criterion, mean_bt_iters, converged, grad_norm_at_termination] = ...
                    General_NLCGM(Function, Function_Gradient, x0, max_iters, alpha0, c, rho, tol_delta_xk, tol_gradfk_norm);
                
                %          SAVING RESULTS   
                f_and_gradf_over_iters(h,i,1,:) = F_values;
                f_and_gradf_over_iters(h,i,2,:) = gradf_values;
                general_results(h, i, 1) = iters_to_converge;
                general_results(h, i, 2) = time_to_converge;
                general_results(h, i, 3) = min_at_stopping_criterion;
                general_results(h, i, 4) = mean_bt_iters;
                general_results(h, i, 5) = converged;
                general_results(h, i, 6) = grad_norm_at_termination;
                %save(strcat('Method=NLCGM Problem=',num2str(Problem),' Mean=',num2str(mu(h)),' Std=',num2str(sigma(j)),'Test=',num2str(i)),'F_values')
                
                %               NLCGM PLOT DEI RISULTATI

                if(i <= 5)
                    fig1 = figure(str2num(strcat(num2str(h),'1')));
                    ln = plot(1:1:length(F_values),log10(F_values));
                    title(strcat('Log Scale ',problems_list(Problem), ' Mean=',num2str(mu_sigma_tuples(h,1)),' std=',num2str(mu_sigma_tuples(h,2)),' 1 to 5'))
                    xlabel('k-th iteration')
                    ylabel('Log(F(x_k))')
                    xlim([0 1000])
                    ln.LineWidth = 2;
                    ln.Color = colors(i);
                    ln.Marker = 'o';
                    ln.MarkerSize = 2;
                    ln.MarkerEdgeColor = colors(i);
                    hold on
                    fig1
                else
                    fig2 = figure(str2num(strcat(num2str(h),'2')));
                    ln = plot(1:1:length(F_values),log10(F_values));
                    title(strcat('Log Scale ',problems_list(Problem), ' Mean=',num2str(mu_sigma_tuples(h,1)),' std=',num2str(mu_sigma_tuples(h,2)),' - 6 to 10'))
                    xlabel('k-th iteration')
                    ylabel('Log(F(x_k))')
                    xlim([0 1000])
                    ln.LineWidth = 2;
                    ln.Color = colors(i-5);
                    ln.Marker = 'o';
                    ln.MarkerSize = 2;
                    ln.MarkerEdgeColor = colors(i-5);
                    hold on
                    fig2
                end

                                %       NEWTON METHOD

            case 2

                [F_values, time_to_converge, iters_to_converge, min_at_stopping_criterion, mean_bt_iters, converged, grad_norm_at_termination] = General_Newton(x0, Function, Function_Gradient, Function_Hessian, max_iters, c, rho, max_bt_iters, tol_delta_xk, tol_gradfk_norm, Problem);

                general_results(h, i, 1) = iters_to_converge;
                general_results(h, i, 2) = time_to_converge;
                general_results(h, i, 3) = min_at_stopping_criterion;
                general_results(h, i, 4) = mean_bt_iters;
                general_results(h, i, 5) = converged;
                general_results(h, i, 6) = grad_norm_at_termination;
                
                %save(strcat('Method=Newthon Problem=',num2str(Problem),' Mean=',num2str(mu(h)),' Std=',num2str(sigma(j)),'Test=',num2str(i)),'F_values')

                %                 NEWTON PLOT DEI RISULTATI

                if(i <= 5)
                    fig1 = figure(str2num(strcat(num2str(h),'1')));
                    ln = plot(1:1:length(F_values),log10(F_values));
                    title(strcat('Log Scale ', problems_list(Problem), ' Mean=',num2str(mu_sigma_tuples(h,1)),' std=',num2str(mu_sigma_tuples(h,2)),' 1 to 5'))
                    xlabel('k-th iteration')
                    ylabel('Log(F(x_k))')
                    xlim([0 1000])
                    ln.LineWidth = 2;
                    ln.Color = colors(i);
                    ln.Marker = 'o';
                    ln.MarkerSize = 2;
                    ln.MarkerEdgeColor = colors(i);
                    hold on
                    fig1
                else
                    fig2 = figure(str2num(strcat(num2str(h),'2')));
                    ln = plot(1:1:length(F_values),log10(F_values));
                    title(strcat('Log Scale', problems_list(Problem), ' Mean=',num2str(mu_sigma_tuples(h,1)),' std=',num2str(mu_sigma_tuples(h,2)),' - 6 to 10'))
                    xlabel('k-th iteration')
                    ylabel('Log(F(x_k))')
                    xlim([0 1000])
                    ln.LineWidth = 2;
                    ln.Color = colors(i-5);
                    ln.Marker = 'o';
                    ln.MarkerSize = 2;
                    ln.MarkerEdgeColor = colors(i-5);
                    hold on
                    fig2
                end
        end
    end

        saveas(fig1,(strcat(strcat('Method=',methods_list(Method), 'Problem=',problems_list(Problem),' Mean=',num2str(mu_sigma_tuples(h, 1)),' Std=',num2str(mu_sigma_tuples(h, 2)),'Test=',num2str(i)),'1.fig')));
        %saveas(fig2,(strcat(strcat('Method=',methods_list(Method), 'Problem=',problems_list(Problem),' Mean=',num2str(mu_sigma_tuples(h, 1)),' Std=',num2str(mu_sigma_tuples(h, 2)),'Test=',num2str(i)),'2.fig')));
        close(fig1)
        %close(fig2)
end


save(strcat("RESULTS-", problems_list(Problem), "-", methods_list(Method)), "general_results");
save(strcat("F_and_gradF_over_iters-", problems_list(Problem), "-", methods_list(Method)), "f_and_gradf_over_iters");










































