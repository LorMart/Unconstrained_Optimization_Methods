function [alpha, k] = line_search(f, f_grad, p, x_k, alpha0, c, rho)
    %p = -(f_grad(x_k));
    alpha = alpha0;
    k=0;
    max_iter = 500;
    grad_fk = f_grad(x_k);
    
    while max_iter > k && (f(x_k + alpha*p) > f(x_k) + c*alpha*(grad_fk)'*p)                   
        alpha = rho*alpha;
        %plot(x_k+alpha, f(x_k+alpha), 'r*')
        k=k+1;
    end
    
end
