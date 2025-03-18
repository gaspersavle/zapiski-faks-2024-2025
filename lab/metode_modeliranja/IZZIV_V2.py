import pandas as pd
import json
import datetime
import numpy as np
from sklearn.metrics import mean_absolute_error

class DataLoader:
    def __init__(self, file: str):
        self.file = file
    
    def load_json_data(self) -> list:
        with open(self.file, 'r') as f:
            data = json.load(f)
        return data
    
    def create_dataframe(self) -> pd.DataFrame:
        """
        Converts the loaded JSON data into a Pandas DataFrame.
        """
        data = self.load_json_data()
        
        # Convert the data to a DataFrame
        df = pd.DataFrame(data)
        
        # Convert the timestamp to a datetime object
        df['date'] = pd.to_datetime(df['timestamp'])
        
        # Drop the timestamp column
        df.drop(columns="timestamp", inplace=True)
        
        return df
    
    def preprocess(self) -> pd.DataFrame:
        df = self.create_dataframe()
        
        # Ensure that the date is in UTC
        df["date"] = df["date"].dt.tz_convert("UTC") 
        
        # Calculate NetPosition before setting the index
        df['NetPosition'] = df['sent'] - df['recieved']
        
        # Create datetime index
        df = df.set_index('date')
        
        return df

# Data for loading and preprocessing
loader = DataLoader(file='energy_readings.json')
df = loader.preprocess()  # Use preprocess() instead of create_dataframe()
df.head()



#%%

# Sort the DataFrame by date
df_sorted = df.sort_index()

# Plot using Plotly
import plotly.graph_objs as go

# Create traces for each unique ID
traces = []
for id_value in df_sorted['ID'].unique():
    subset = df_sorted[df_sorted['ID'] == id_value]
    trace = go.Scatter(
        x=subset.index, 
        y=subset['NetPosition'], 
        mode='lines', 
        name=str(id_value)
    )
    traces.append(trace)

# Create the layout
layout = go.Layout(
    title='NetPosition Over Time by ID',
    xaxis={'title': 'Date'},
    yaxis={'title': 'Net Position'}
)

# Create figure
fig = go.Figure(data=traces, layout=layout)

# Show the plot
fig.show()

# Optional: Save the plot
fig.write_html("netposition_plot.html")





















