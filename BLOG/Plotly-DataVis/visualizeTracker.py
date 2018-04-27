from plotly.offline import plot
import plotly.graph_objs as go
import csv as csv

# Open the CSV file with data
readdata = csv.reader(open("cleanedTracks.csv"))

# Create empty lists for the data
miner_user_guides = []
miner_apps = []
store = []
miner_fs = []
extract =[]

# For every line in the CSV file, append respective list
for line in readdata:
    miner_user_guides.append(line[0])
    miner_apps.append(line[1])
    store.append(line[2])
    miner_fs.append(line[3])
    extract.append(line[4])



############# Scatter Plot

# map our data (in lists) to a Scatter plot
miner_user_guidesPlot = go.Scatter(y = miner_user_guides, opacity = 0.95, name = "miner user guides")
miner_appsPlot = go.Scatter(y = miner_apps, opacity = 0.95, name = "miner apps")
storePlot = go.Scatter(y = store, opacity = 0.95, name = "store")
miner_fsPlot = go.Scatter(y = miner_fs, opacity = 0.95, name = "miner")
extractPlot = go.Scatter(y = extract, opacity = 0.95, name = "extract")

# data to be plotted
data = [miner_user_guidesPlot, miner_appsPlot, storePlot, miner_fsPlot, extractPlot]
layout = go.Layout(
    title='Tracker Apps PIDs Against Reboots',
    xaxis=dict(
        title='Number of Reboot',
        titlefont=dict(
            family='Courier New, monospace',
            size=18,
            color='#7f7f7f'
        )
    ),
    yaxis=dict(
        title='Tracker PID',
        titlefont=dict(
            family='Courier New, monospace',
            size=18,
            color='#7f7f7f'
        )
    )
)

# Combine data and plot 
fig = go.Figure(data = data, layout = layout) 
plot(fig, filename = 'tracker-scatter.html')

############# Histogram Plot

# map our data (in lists) to a Histogram plot
miner_user_guidesPlot = go.Histogram(y = miner_user_guides, opacity = 0.95, name = "miner user guides")
miner_appsPlot = go.Histogram(y = miner_apps, opacity = 0.95, name = "miner apps")
storePlot = go.Histogram(y = store, opacity = 0.95, name = "store")
miner_fsPlot = go.Histogram(y = miner_fs, opacity = 0.95, name = "miner")
extractPlot = go.Histogram(y = extract, opacity = 0.95, name = "extract")

# data to be plotted
data = [miner_user_guidesPlot, miner_appsPlot, storePlot, miner_fsPlot, extractPlot]
layout = go.Layout(
    title='Tracker Apps PIDs Against Frequency',
    xaxis=dict(
        title='Number of Frequency',
        titlefont=dict(
            family='Courier New, monospace',
            size=18,
            color='#7f7f7f'
        )
    ),
    yaxis=dict(
        title='Tracker PID',
        titlefont=dict(
            family='Courier New, monospace',
            size=18,
            color='#7f7f7f'
        )
    )
)


# Combine data and plot 
fig = go.Figure(data = data, layout = layout) 
plot(fig, filename = 'tracker-histogram.html')
