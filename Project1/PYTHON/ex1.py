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

# +
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
     
x = np.linspace(5.0,22.5, 50)
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
# -

# Visualizing J(theta_0, theta_1):
# Grid over which we will calculate J
theta0_vals = np.linspace(-10, 10, 100);
theta1_vals = np.linspace(-1, 4, 100);
# initialize J_vals to a matrix of 0's
J_vals = np.zeros((len(theta0_vals),len(theta1_vals)), dtype=float)
J_vals



# +
data = genfromtxt('ex1data1.txt', delimiter=',')
X=data[:,0]
y=data[:,1]
X_ii = np.column_stack((np.ones(m), X))

#print(theta0_vals)
#print(theta1_vals)
X_ii = np.column_stack((np.ones(m), X))

# Fill out J_vals
for i in  range(0,len(theta0_vals)):
    for j in range(0,len(theta1_vals)):
        t = [theta0_vals[i], theta1_vals[j]]
        J_vals[i,j] = computeCost(X_ii, y, t)

J_vals

# +
from mpl_toolkits import mplot3d
import numpy as np
import matplotlib.pyplot as plt

x = theta0_vals
y = theta1_vals
z = J_vals

#fig = plt.figure(figsize=(10,10))
fig, ax = plt.subplots(figsize=(10,10))
ax = plt.axes(projection='3d')
ax.view_init(elev=20., azim=150.0)
ax.plot_surface(x, y, z, cmap='viridis', edgecolor='none')
ax.set_title('Surface plot')
ax.set_xlabel('theta0_vals')
ax.set_ylabel('theta1_vals')
ax.set_zlabel('Cost')

# +
fig, ax = plt.subplots(figsize=(5,5))

x = theta0_vals
y = theta1_vals
z = J_vals
CS = ax.contour(x, y, z)
ax.clabel(CS, inline=10, fontsize=10)
ax.margins(10, 10) 
ax.set_title('Contour plot')
plt.plot(theta[0], theta[1], marker='x', markersize=10, color="red")
# -


