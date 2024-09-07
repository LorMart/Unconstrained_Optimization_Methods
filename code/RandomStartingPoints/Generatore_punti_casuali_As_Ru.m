clear all 
clc

n = 10^4+1;

%mu = [1, -1, 3, -3, 5, 10, 50, 100, 250, 500];


                                    
mu_sigma_tuples = [[1, 0.5]
                   [3, 1]
                   [5, 1.5]
                   [10, 1.5]
                   [50, 1.5]
                   [50, 10]
                   [100, 5]
                   [100,20]

];

n_samples = 10;

random_x_0 = zeros(length(mu_sigma_tuples), n_samples, n);

for i = 1:length(mu_sigma_tuples)

    for k = 1:n_samples
        random_x_0(i,k,:) = normrnd(mu_sigma_tuples(i,1), mu_sigma_tuples(i,2),n, 1);

    end

end


save("As_Ru_rand_start_pts_alternati", "random_x_0", "mu_sigma_tuples");