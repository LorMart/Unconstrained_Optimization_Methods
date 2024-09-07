# -*- coding: utf-8 -*-
"""
Created on Fri May  5 20:59:54 2023

@author: Lorenzo
"""

import scipy.io as sp
import numpy as np

n_mean = 12
n_std = 4
n_samples = 10

mat = sp.loadmat(r'C:\Users\Lorenzo\Desktop\NumericalOptimization\Finale\Newton Problem 1 results Finale.mat')
data = mat['general_results']
data = np.array(data)


def iters_to_converge(data):
    results = np.zeros((n_mean, n_std, 4))
    
    for i in range(n_mean):
        for j in range(n_std):
            
                results[i,j,0] =  np.mean(data[i,j,:,0])
                results[i,j,1] =  np.std(data[i,j,:,0])
                results[i,j,2] =  np.max(data[i,j,:,0])
                results[i,j,3] =  np.min(data[i,j,:,0])
                
    return results;

def time_to_converge(data):
    results = np.zeros((n_mean, n_std, 4))
    
    for i in range(n_mean):
        for j in range(n_std):
            
                results[i,j,0] =  np.mean(data[i,j,:,1])
                results[i,j,1] =  np.std(data[i,j,:,1])
                results[i,j,2] =  np.max(data[i,j,:,1])
                results[i,j,3] =  np.min(data[i,j,:,1])
                                
    return results;

def convergend_results(data):
    results = np.empty((n_mean, n_std, 4))
    results[:] = np.nan
    
    for i in range(n_mean):
        for j in range(n_std):
                c1 = np.array([])
                c2 = np.array([])
                c3 = np.array([])
                c4 = np.array([])
                flag = 0;
                for k in range(n_samples):
                    
                    if(data[i,j,k,4] == 1):
                        c1 = np.append(c1, data[i,j,:,0])
                        c2 = np.append(c2, data[i,j,:,1])
                        c3 = np.append(c3, data[i,j,:,2])
                        c4 = np.append(c4, data[i,j,:,3])
                        flag = 1;

                if(flag == 1):
                    results[i,j,0] =  np.mean(c1)
                    results[i,j,1] =  np.std(c2)
                    results[i,j,2] =  np.max(c3)
                    results[i,j,3] =  np.min(c4)
                                
    return results;

def all_results(data):
    results = np.empty((n_mean, n_std, 4))
    results[:] = np.nan
    
    for i in range(n_mean):
        for j in range(n_std):

                    results[i,j,0] =  np.mean(data[i,j,:,2])
                    results[i,j,1] =  np.std(data[i,j,:,2])
                    results[i,j,2] =  np.max(data[i,j,:,2])
                    results[i,j,3] =  np.min(data[i,j,:,2])
                                
    return results;


def N_converged(data):
    results = np.zeros((n_mean, n_std))
    
    for i in range(n_mean):
        for j in range(n_std):
            
                results[i,j] =  np.sum(data[i,j,:,4])
    return results;

conv_res = convergend_results(data)
N_conv = N_converged(data)
time_to_conv = time_to_converge(data)
iters_to_conv = iters_to_converge(data)
all_res = all_results(data)

sum(data[:,:,:,2] < 1000)