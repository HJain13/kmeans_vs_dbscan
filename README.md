# kmeans_vs_dbscan

In this exercise I compare the Clustering algorithms KMeans & DBSCAN:

KMeans - Works by intuitively assigning each data point to a cluster whose mean has the least squared Eucledian Distance.

The algorithm converes when the assignement no longer change.

DBSCAN - Density Based Spatial Clustering of Applications with Noise. Works by forming clusters based on density based on epsilon & minimum number of points required to form a dense region.

All points that are found in the Epsilon neibourhood are added as cluster to a datapoint, similarly this is checked for each point. The process coninues till the density-connected cluster is completely found.

The analysis uses a dataset recently added on UCI ML library:
https://archive.ics.uci.edu/ml/datasets/Sales_Transactions_Dataset_Weekly

Dataset contains:

Sales Transactions for 52 weeks, basically a pattern of purchases classified with product code, It has 811 observations & 107 columns.

I load the dataset & seperate the normalized columns as they are not needed for analysis.

Applied Elbow Method to determine the best K value for Kmeans:

<img width="796" alt="screen shot 2017-11-13 at 2 30 30 pm" src="https://user-images.githubusercontent.com/26288770/32746406-84bf9028-c883-11e7-82a2-94e8679c492c.png">


Clustering with K = 4, Viz the pattern for 2 of the weeks choosen at once:

<img width="966" alt="screen shot 2017-11-13 at 2 34 22 pm" src="https://user-images.githubusercontent.com/26288770/32746451-a6bba900-c883-11e7-9781-310a881de487.png">
<img width="778" alt="screen shot 2017-11-13 at 2 35 25 pm" src="https://user-images.githubusercontent.com/26288770/32746452-a6cfc61a-c883-11e7-9262-ff3da00ba955.png">

Applying DBSCAN with default values of eps = 0.15 & minimum points = 5, gives just one cluster with 811 observation.

However, I will determine the optimum eps by using the Knee method.

<img width="684" alt="screen shot 2017-11-13 at 2 37 12 pm" src="https://user-images.githubusercontent.com/26288770/32746560-16d05c2c-c884-11e7-9374-a53a8066f707.png">

This gives the optimum Epsilon value as 60.

Applying DBSCAN with eps=60 -- Gives 3 clusters which is def. close to KMeans answer of 4.

<img width="1044" alt="screen shot 2017-11-13 at 2 38 33 pm" src="https://user-images.githubusercontent.com/26288770/32746634-3f77c638-c884-11e7-8f12-545dcf72712e.png">



