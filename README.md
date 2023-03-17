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

* Brownian Motion



* Geometric Brownian Motion



* Box-Muller Method



## The App

#### Sidebar Details:
* Input the data extracted from [here](https://www.b3.com.br/pt_br/market-data-e-indices/servicos-de-dados/market-data/historico/mercado-a-vista/cotacoes-historicas/) and transformed from raw data to field delimited by comma;
* Select Asset type (stocks, real estate funds or investiment funds);
* Set a price limit (if not, just drag the pointer to the end);

![image](https://user-images.githubusercontent.com/120825682/216088663-8fbceaa1-dc84-4899-b4ed-a868b2aa8e6e.png)

* Select a stock option to check its historical data or forecast.

![image](https://user-images.githubusercontent.com/120825682/216089314-d6874947-0331-40fd-8e41-a8854f6064b1.png)


#### Tabsets:
* BASE B3

A dataset providing more information about the stock during that day.

![image](https://user-images.githubusercontent.com/120825682/216089439-5ea83e0f-60ff-46e6-84f1-961168e9936f.png)

* RANKING ALTAS

Plot ordering the highest positive variations during the analised date.

![image](https://user-images.githubusercontent.com/120825682/216089494-6f241e04-0e7e-4557-ac2a-4d92d091ae33.png)

* RANKING BAIXAS

Plot ordering the highest negative variations during the analised date.

![image](https://user-images.githubusercontent.com/120825682/216089536-5dae54dc-f3ae-4c48-9893-9a450b82777c.png)

* CONSULTA HISTÓRICO AÇÃO

Plot for historical or forecast visualization.

* CÓDIGOS B3

Dataset to inform codes used by B3 to identify asset type.

### DISCLAIMER

This app is used only for educational purposes.

