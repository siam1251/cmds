[pytorch code](https://github.com/siam1251/cmds/blob/master/pytorch.md)                    
[basics](https://www.analyticsvidhya.com/blog/2020/04/comprehensive-popular-deep-learning-interview-questions-answers/)   
[pdf](https://github.com/siam1251/cmds/blob/master/ML%20Interview%20Cheat%20sheet.pdf)     
[different activation functions](https://towardsdatascience.com/activation-functions-neural-networks-1cbd9f8d91d6)
another link [activation functions](https://towardsdatascience.com/activation-functions-in-deep-neural-networks-aae2a598f211)       
[avoid overfitting (variance)](https://machinelearningmastery.com/introduction-to-regularization-to-reduce-overfitting-and-improve-generalization-error/)  
[Different loss function](https://medium.com/@zeeshanmulla/cost-activation-loss-function-neural-network-deep-learning-what-are-these-91167825a4de)      
[Batch, Mini Batch & Stochastic Gradient Descent ](https://towardsdatascience.com/batch-mini-batch-stochastic-gradient-descent-7a62ecba642a#:~:text=Batch%20Gradient%20Descent%20can%20be,converges%20faster%20for%20larger%20datasets.)       
[epoch, batch, iteration](https://towardsdatascience.com/epoch-vs-iterations-vs-batch-size-4dfb9c7ce9c9)    


L1 vs L2 Regularization ?

### Regression Loss vs Classification loss [link](https://machinelearningmastery.com/how-to-choose-loss-functions-when-training-deep-learning-neural-networks/)      

Regression Loss Functions     

    * Mean Squared Error Loss         
    * Mean Squared Logarithmic Error Loss         
    * Mean Absolute Error Loss         
Binary Classification Loss Functions     

    * Binary Cross-Entropy         
    * Hinge Loss         
    * Squared Hinge Loss         
Multi-Class Classification Loss Functions      

    * Multi-Class Cross-Entropy Loss         
    * Sparse Multiclass Cross-Entropy Loss         
    * Kullback Leibler Divergence Loss         


#### Batch Gradient Descent            
In Batch Gradient Descent, all the training data is taken into consideration to take a single step. We take the average of the gradients of all the training examples and then use that mean gradient to update our parameters. So that’s just one step of gradient descent in one epoch.

#### gradient vanishing problem          
we use other activation that sigmoid (since the gradient of sigmoind for very high or very low value tends to zero)

