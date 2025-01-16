"""
This is the code for the technical challenge for Datamart.
Please refer to ..\notebooks\task_0.ipynb for more details
Author: Auberth Hurtado
"""

import uuid
import random
import pandas as pd
import numpy as np
from datetime import datetime, timedelta
import warnings

# Hide warnings
warnings.filterwarnings('ignore')

# Parameters
num_rows = 50000
max_customer_id = 10000
max_product_id = 1000
max_quantity = 20
max_price = 500
max_discount = 0.3
start_date = datetime(2023, 1, 1)
end_date = datetime(2024, 12, 31)
orders_weight = {2023: 0.4, 2024: 0.6}
noise_percent = 0.05
noise_options = ['NULL', -9999, np.nan]

def orders_date(start, end, weights):
    """
    Generates a random date between the given start and end dates,
    with a seasonal pattern and increasing trend based on year weights.

    Parameters:
    start (datetime): The start date of the range.
    end (datetime): The end date of the range.
    weights (dict): A dictionary with years as keys and weights as values,
                    indicating the probability of selecting a date in that year.

    Returns:
    datetime: A random date within the specified range, adjusted according to the year weights.
    """
    date = start + timedelta(days=random.randint(0, int((end - start).days)))
    while random.random() > weights[date.year]:
        date = start + timedelta(days=random.randint(0, int((end - start).days)))
    return date

def generate_discount(price, max_discount, max_price):
    """
    Generate a random discount inversely correlated with price.
    
    Args:
    price (float): Price of the product.
    max_discount (float): Maximum discount allowed.
    max_price (float): Maximum price of the product.
    
    Returns:
    float: Randomly generated discount.
    """
    discount = max_discount - (price / max_price) * max_discount
    return np.clip(discount, 0.0, max_discount)

def random_shipping_priority(region):
    """
    Generate a random shipping priority based on region.
    
    Args:
    region (str): Region of the order.
    
    Returns:
    str: Randomly generated shipping priority.
    """
    if region == 'North':
        shipping_priority = np.random.choice(['Low', 'Medium', 'High'], p=[0.1, 0.3, 0.6])
    elif region == 'South':
        shipping_priority = np.random.choice(['Low', 'Medium', 'High'], p=[0.3, 0.5, 0.2])
    elif region == 'East':
        shipping_priority = np.random.choice(['Low', 'Medium', 'High'], p=[0.4, 0.4, 0.2])
    elif region == 'West':
        shipping_priority = np.random.choice(['Low', 'Medium', 'High'], p=[0.5, 0.3, 0.2])
    return shipping_priority

def generate_dataset(num_rows):
    """
    Generate a dataset with the specified number of rows.
    
    Args:
    num_rows (int): Number of rows to generate.
    
    Returns:
    pd.DataFrame: Generated dataset.
    """
    data = []
    for _ in range(num_rows):
        price = np.random.uniform(1.0, max_price)
        region = random.choice(['North', 'South', 'East', 'West'])
        row = {
            "order_id": str(uuid.uuid4()),
            "customer_id": random.randint(1, max_customer_id + 1),
            "product_id": random.randint(1, max_product_id + 1),
            "quantity": random.randint(1, max_quantity + 1),
            "price": price,
            "discount": generate_discount(price, max_discount, max_price),
            "order_date": orders_date(start_date, end_date, orders_weight),
            "shipping_priority": random_shipping_priority(region),
            "region": region
        }
        data.append(row)
    return pd.DataFrame(data)

def introduce_noise(df, noise_percent=0.05):
    """
    Introduce noise and missing values in the dataset.
    
    Args:
    df (pd.DataFrame): DataFrame to introduce noise into.
    noise_percent (float): Fraction of rows to introduce noise into.
    
    Returns:
    pd.DataFrame: DataFrame with noise introduced.
    """
    noisy_rows = df.sample(n=int(noise_percent * len(df))).index
    columns = df.columns.tolist()
    columns.remove('order_id')  # I'll keep 'order_id' intact to maintain the primary key.

    for idx in noisy_rows:
        noisy_columns = random.sample(columns, 3)
        for col in noisy_columns:
            df.at[idx, col] = random.choice(noise_options)
    return df

def main():
    """
    Main function to generate dataset and save to CSV.
    """
    num_rows = 50000
    df = generate_dataset(num_rows)
    df = introduce_noise(df)
    df.to_csv(r'../data/raw/raw_sales_data.csv', index=False)

if __name__ == "__main__":
    main()