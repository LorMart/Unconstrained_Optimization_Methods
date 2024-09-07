clear all 
clc

n = 10^4;




                                    
mu_sigma_tuples = [[-1, 0.2]
                   [-5, 1]
                   [-10, 2]
                   [100, 10]
                   [1000, 100]
                   [10000, 5000]
];

n_samples = 10;

random_x_0 = zeros(length(mu_sigma_tuples), n_samples, n);

for i = 1:length(mu_sigma_tuples)

    for k = 1:n_samples
        random_x_0(i,k,:) = normrnd(mu_sigma_tuples(i,1), mu_sigma_tuples(i,2),n, 1);
        random_x_0(i,k,1) = 0;
        random_x_0(i,k,n) = 0;
    end

end


save("Broy_rand_start_pts_alternati", "random_x_0", "mu_sigma_tuples");