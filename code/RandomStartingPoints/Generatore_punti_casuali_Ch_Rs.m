clear all 
clc

n = 10^4;

%mu = [1, -1, 3, -3, 5, 10, 50, 100, 250, 500];
mu = [1, 3, 5, 10, 50, 100];
sigma = [0.5, 1, 1.5, 10, 20];

                                    %mu and sigma for Chained Rosenbrock
mu_sigma_tuples = [[1, 0.5]
                   [3, 1]
                   [5, 1.5]
                   [10, 1.5]
                   [50, 1.5]
                   [100, 20]
                   [1000, 100]
                   [10000,5000]

];

n_samples = 10;

random_x_0 = zeros(length(mu_sigma_tuples), n_samples, n);

for i = 1:length(mu_sigma_tuples)

    for k = 1:n_samples
            tmp_sampling_1 = normrnd(mu_sigma_tuples(i,1), mu_sigma_tuples(i,2),n/1, 1);
            tmp_sampling_2 = normrnd(-mu_sigma_tuples(i,1), mu_sigma_tuples(i,2),n/1, 1);
            p=1;
            n=1;

       for index = 1:n

           if mod(index,2)==0
                    random_x_0(i, k, index) = tmp_sampling_1(p);
                    p=p+1;
           else
                    random_x_0(i, k, index) = tmp_sampling_2(n);
                    n=n+1;
           end
       end
    end

end


save("Ch_Rs_rand_start_pts_alternati", "random_x_0", "mu_sigma_tuples");