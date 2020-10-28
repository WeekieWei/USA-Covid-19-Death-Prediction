# USA Covid 19 Death Prediction
Covid-19 death cases prediction model based on real data in USA. USA data is used because dataset is large. Prediction taking cumulative positive cases, ICU case, and recovered cases into account. 

## Training Dataset
The Dataset is taken from [Kaggle](https://www.kaggle.com/sudalairajkumar/covid19-in-usa?select=us_covid19_daily.csv).

## Running Environment
MATLAB

## Implementation Technique
-	Non-linear Auto Regressive Exogenous (NARX)
-	Neural Network


## Editor's Words
The project took me quite a lot of time as real life data is harder to be predicted yet I wanted to obtain the best result as possible.

## Result Snapshots
>Data Validation (Reapply the same data into the trained neural network model to test how well it has learnt)
<img src="https://user-images.githubusercontent.com/60565482/97440285-3749b980-1962-11eb-9989-650a5affd8c5.png" alt="Fitting Plot"/>

>One Step Ahead Test (Applying new data into the trained model and compare the true output with predicted output from trained model)
<img src="https://user-images.githubusercontent.com/60565482/97440505-809a0900-1962-11eb-8686-1e1bf25c78b2.png" alt="One Step Ahead"/>
