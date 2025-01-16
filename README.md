# ds_test

## Tools used in this project
* python==3.12.8
* pandas
* numpy
* matplotlib
* ydata-profiling
* ipywidgets
* missingno
* seaborn
* scikit-learn


## Project Structure

```bash
.
├── config                      
│   ├── main.yaml                 # Main configuration file
│   ├── model                     # Configurations for training model
├── data            
│   ├── final                     # data after training the model
│   ├── processed                 # data after processing
│   └── raw                       # raw data
├── docs                          # documentation of the test
├── .gitignore                    # ignore files that cannot commit to Git
├── Makefile                      # store useful commands to set up the environment
├── models                        # store model
├── notebooks                     # store notebooks
    ├── task_0.ipynb              # process data for task 0
    ├── task_1.ipynb              # process data for task 1
    ├── task_2.ipynb              # process data for task 2
    ├── task_3.ipynb              # process data for task 3    
    └── task_4.ipynb              # process data for task 4 
├── pyproject.toml                # Configure black
├── README.md                     # This file
├── src                           # store source code
    ├── __init__.py               # make src a Python module 
    ├── task_0.py                 # source code requested for task_0
    └── task_2                    # sql files for task 2

```

## Set up the environment


1. Create the virtual environment:
```bash
python3 -m venv venv
```
2. Activate the virtual environment:

- For Linux/MacOS:
```bash
source venv/bin/activate
```
- For Command Prompt:
```bash
.\venv\Scripts\activate
```
3. Install dependencies:
- To install all dependencies, run:
```bash
pip install -r requirements-dev.txt
```

- To install a new package, run:
```bash
pip install <package-name>
```


## View and alter configurations

== Configuration groups ==
Compose your configuration from those groups (group=option)

model: random_forest



