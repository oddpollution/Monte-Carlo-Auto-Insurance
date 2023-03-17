# Monte-Carlo-Auto-Insurance

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

