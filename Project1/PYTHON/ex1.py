# -*- coding: utf-8 -*-
"""
Created on Mon Jan  6 01:40:03 2020

@author: OZGUR
"""

from numpy import genfromtxt, ones
import numpy as np
from matplotlib import pyplot as plt 

def computeCost(X_ii, y, theta):
    m = len(y)
    J = 0
      
    Hx = X_ii.dot(theta)
    J = sum((Hx-y)**2)/(2*m)
    
    return J
    
def gradientDescent(X_ii, y, theta, alpha, num_iters):

    m = len(y)
    J_history = np.zeros(num_iters)
    
    for iter in range(0, len(J_history)):
        
        theta = theta - (alpha * (X_ii.transpose() * ((X_ii.dot(theta)-y)/m))).sum(axis = 1)
        
        J_history[iter] = computeCost(X_ii, y, theta)  
    
    return [theta, J_history]
    
def main():
    
    data = genfromtxt('ex1data1.txt', delimiter=',')
    X=data[:,0]
    y=data[:,1]
    theta = [0, 0]
    num_iters = 1500
    alpha = 0.01
    m = len(y)
    X_ii = np.column_stack((np.ones(m), X))
    J_historyX = list(range(0, 1500))
    
    plt.figure()
    plt.plot(X,y,'x',linewidth=0)
    plt.title('Profit vs. Population')
    plt.ylabel('Profit in $10,000s')
    plt.xlabel('Population of City in 10,000s')
    
    theta, J_history = gradientDescent(X_ii, y, theta, alpha, num_iters)
     
    x = np.linspace(5,22.5,2.5)
    y = x*theta[1]+theta[0]
    plt.plot(x, y, '-r', label='y=2x+1')
    plt.show()
    print("theta = ", theta)
       
    plt.figure()
    plt.plot(J_historyX, J_history,'r-')
    plt.title('Cost Function History')
    plt.xlabel('Iteration Number')
    plt.ylabel('Cost')
    plt.show()
    print("J_history = " , J_history)
    
if __name__ == '__main__':
    main()