# Monte Carlo Auto Insurance Scenario Generator

## About

This Git provides an application with code to generate scenarios for risk assessment for an auto insurance company, using Monte Carlo Simulations (GBM).

### Address for the app

* [APP link here](https://seagullskf.shinyapps.io/Monte_Carlo_Simulator/?_ga=2.71946896.281703162.1677177724-864900895.1677177724)

### Objective

This application is developed in order to generate scenarios to compare possible actions for pricing and underwriting for an auto insurance company.

## The Theory

### Deterministic versus Stochastic analysis

#### Deterministic

This method has known values for its premises, allowing the model to be simple and understandable. 
The main idea behind using deterministic analysis is to provide your model with your own premises and change it in a fast way. 
This is possible because the model can be treated through formulas, which can be easily changed. 
This method has known values for its premises, allowing the model to be simple and understandable. 
The main idea behind using deterministic analysis is to provide your model with your own premises and change it in a fast way. 
This is possible because the model can be treated through formulas, which can be easily changed.

But despite being easy to use, the model has its own disadvantages. 
It is not probabilistic, so you can't relate probabilities to the answers, leading to an approximation of reality, which can cause an ambiguous consideration.
Although simple, this can actually be bad because it won't bring reality to your analysis.

#### Stochastic

On the other hand, this method presents a probabilistic proxy for the analysis results.
When simulating results over probabilities, more information can be derived from complex matters; the more complex the problem is, the more complex simulations are needed and the better the results can be.
By that, Depending on the statistical distribution chosen for the simulation, the problem of using average and median can be easily solved.

Although, once the simulation is done, it becomes untreatable, forcing the creation of a new simulation with new results.
Every simulation demands a processing cost as it creates several iterations during the simulation's development.
For better results, more iterations and more processing time are needed.

### Monte Carlo Simulations

#### What is?

Named after a casino-based economy city, Monte Carlo simulation is a mathematical technique that is used to estimate the possible outcomes of an uncertain event, as they are for games like roulette, dice, and slot machines.
The method was created by Stanislaw Ulam, a mathematician who worked on the Manhattan Project, the secret effort to create the first atomic weapon. He shared his idea with John Von Neumann, a colleague at the Manhattan Project.

A Monte Carlo simulation is used to model the probability of different outcomes in a process that cannot easily be predicted due to the intervention of random variables. It is a technique used to understand the impact of risk and uncertainty.
Since its introduction, Monte Carlo simulations have assessed the impact of risk in many real-life scenarios, such as artificial intelligence, stock prices, sales forecasting, project management, and pricing. They also provide a number of advantages over predictive models with fixed inputs, such as the ability to conduct sensitivity analysis or calculate the correlation of inputs.

Unlike a normal forecasting model, Monte Carlo Simulation predicts a set of outcomes based on an estimated range of values versus a set of fixed input values. In other words, a Monte Carlo Simulation builds a model of possible results by leveraging a probability distribution, such as a uniform or normal distribution, for any variable that has inherent uncertainty. The model is then run and a result is provided. This process is repeated again and again while assigning many different values to the variable in question. Once the simulation is complete, the results are averaged to arrive at an estimate.

#### How to use

###### _Brownian Motion_

A standard Brownian motion is a random process X={Xt:t∈[0,∞)} with state space R that satisfies the following properties:

* X0=0 (with probability 1).
* X has stationary increments. That is, for  s,t∈[0,∞) with  s<t, the distribution of  Xt−Xs is the same as the distribution of  Xt−s.
* X has independent increments. That is, for  t1,t2,…,tn∈[0,∞) with  t1<t2<⋯<tn, the random variables  Xt1,Xt2−Xt1,…,Xtn−Xtn−1 are independent.
* Xt is normally distributed with mean 0 and variance t for each  t∈(0,∞).
* With probability 1,  t↦Xt is continuous on [0,∞).

X(t) − X(s) thus can be constructed (simulated) by generating a standard normal rv Z
and setting X(t) − X(s) = σ(t − s)^(1/2)Z + µ(t − s). 

Again, by the stationary and independent increments, we can simulate such a BM at times 0 = t0 < t1 < t2 < · · · < tk, by generating k iid unit normals Z1, Z2, . . . , Zk and using the recursion X(ti+1) = X(ti) + (X(ti+1) − X(ti)) = X(ti) + σ(ti+1 − ti)^(1/2)Zi+1 + µ(ti+1 − ti).

Simulating BM with drift µ and variance term σ at times 0 = t0 < t1 < t2 < · · · < tk:
Sequentially generate unit normals Z1, Z2, . . . , Zk, and recursively define

X(t1) = σ(t1)^(1/2)Z1 + µt1

X(t2) = X(t1) + σ(t2 − t1)^(1/2)Z2 + µ(t2 − t1) = σ(t1)^(1/2)Z1 + µt1 + σ(t2 − t1)^(1/2)Z2 + µ(t2 − t1)

.
.
.

X(tk) = ![image](https://user-images.githubusercontent.com/120825682/226754127-f8c0dcd6-a553-4c06-a204-a8c9fe6d6794.png)

###### _Geometric Brownian Motion_

One of the most common ways to estimate risk is the use of a Monte Carlo simulation (MCS). For example, to calculate the value at risk (VaR) of a portfolio, we can run a Monte Carlo simulation that attempts to predict the worst likely loss for a portfolio given a confidence interval over a specified time horizon).

Geometric Brownian motion (GBM) is given by:

S(t) = S(0)eX(t), t ≥ 0

where X(t) = σB(t) + µt, t ≥ 0, is a BM. eX(t) has a lognormal distribution for each fixed t > 0. In general if Y = eX is lognormal with X ∼ N(µ, σ2), then we can easily simulate Y via setting Y = eσZ+µ, with Z ∼ N(0, 1).

###### _Box-Muller Method_

This transformation is based on the assumption that the normal bivariate distribution Z1, Z2 ~ N(0, 1) will respect the following properties:

* R = z1² + z2² is exponentially distributed with an average equal to 2, i.e, P(R<=x) +1-e(-x/2)
* The coordinates (z1,z2) are uniformally distributed on the circle, with the radius (r)^(1/2) centered at the origin.

## The App

#### Sidebar Details:

* Vigentes: Number of clients in your portfolio
* Periodo: months of study
* Premio Medio: average premium
* Desvio Padrao Premio Medio: Standard deviation of the premium 
* Sinistro Medio: Average claims value
* Taxa de Risco: The probability of occurrence
* Perda Parcial: Probability of occurrence of a partial loss
* Perda Total: Probability of occurrence of a full loss
* Roubo:  Probability of occurrence of a theft
* Furto:  Probability of occurrence of a loot

![image](https://user-images.githubusercontent.com/120825682/226775413-d59881f2-f5d8-4eba-b61b-a4a9b6a61049.png)

#### Table:

Returns the simulation results

![image](https://user-images.githubusercontent.com/120825682/226775564-d69db6a2-1e90-4b66-8c3a-0c6d739e6b56.png)

#### Plots

![image](https://user-images.githubusercontent.com/120825682/226775626-7bf882f6-108a-4584-b4da-194edc794f3c.png)
![image](https://user-images.githubusercontent.com/120825682/226775650-8c75ec82-712b-48d0-8ef2-f2f3c287a098.png)


### DISCLAIMER

This app is used only for educational purposes.

## Sources

* https://www.investopedia.com/terms/m/montecarlosimulation.asp
* https://www.ibm.com/topics/monte-carlo-simulation#:~:text=The%20Monte%20Carlo%20Method%20was%20invented%20by%20John,modeling%20approach%2C%20similar%20to%20a%20game%20of%20roulette.
* http://www.columbia.edu/~ks20/4404-Sigman/4404-Notes-sim-BM.pdf
* http://www.columbia.edu/~mh2078/MonteCarlo/MCS_Generate_RVars.pdf
* http://marcoagd.usuarios.rdc.puc-rio.br/pdf/sim_stoc_proc.pdf
* https://www.britannica.com/science/probability-theory/Markovian-processes
