getwd()
list.files()

#loading dataset in R # this dataset has purchase behavior pattern of 52 weeks of a particular customer
#Dataset has 811 observations & 107 columns
basket <- read.csv('Sales_Transactions_Dataset_Weekly.csv')
str(basket)
table(basket$Product_Code,basket$W11)

#creating product column
col_1 <- basket[1]

#splitting basket data set into normalized & notnormalized columns as bask & ket
bask<- subset(basket[1:53])
ket <- subset(basket[56:107])

summary(col_1)
str(bask)
summary(ket)
str(ket)

#assigning product code column as NULL in bask as it is a categorical column
bask$Product_Code <- NULL

#creating max column with 50 
max <- 50

# checking kmeans clustering for optimum k value (optimum value)
k_clust <- sapply(1:max,function(k){kmeans(bask, k, nstart=50,iter.max = 35 )$tot.withinss})
plot(1:max, k_clust,type="b", pch = 19,xlab="Number of clusters K",ylab="Total within-clusters sum of squares")

#applying kmeans with 4 clusters as per findings from Elbow method
cluster_4 <- kmeans(bask,centers = 4,nstart = 10)
cluster_4$cluster <- as.factor(cluster_4$cluster)
cluster_4
#plotting pattern of weeks as per clustering from kmeans columns
ggplot(bask, aes(W1,W44,color =cluster_4$cluster)) +geom_point()

#clearly kmeans works as it gives proper 4 clusters of he purchase patterns in 52 weeks
#cluster sum of squares by cluster -- between_SS/ total_SS = 90%

#applying clustering by DBSCAN 
install.packages('dbscan')
install.packages('fpc')
library('dbscan')

#running dbscan with default values of epsilon gives just one cluster
#dbscan fails in this dataset
library("fpc")
db <- fpc::dbscan(bask, eps = 0.15, MinPts = 5)
print(db)

#trying to get optimum value for dbscan via knn distance plot with any random k value
dbscan::kNNdistplot(bask, k =  9)

#the knee method here suggests best epsilon value as 60 for this dataset
abline(h = 60, lty = 4)

#running dbscan with eps as 60 as suggested by the knee method
db_2 <- fpc::dbscan(bask, eps = 60, MinPts = 5)
db_2

ggplot(bask, aes(W1,W44,color =db_2$cluster)) +geom_point()

ggplot(bask, aes(W1,W44,color =cluster_4$cluster)) +geom_point()
#dbscan with optimum epsilon achieves 3 clusters which is not ideal as kmeans gives 4 clusters which seems optimum.