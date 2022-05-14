# FinalProject
## Segment 1 Machine Learning Model

For this segment we were asked to present a provisional machine learning model that stands in for the final machine model.  
We have chosen to use a clustering model of machine learning (unsupervised machine learning) because the data we are looking at has many features (76 columns after initial preprocessing) without a clear output (`y`).  So many features will make determining the right inputs and the right number of clusters difficult.  As an initial attempt at fitting to machine learning, we created an elbow curve to determine the number of appropriate clusters looking for best `K` in `KMeans`

![K Means Elbow Curve](/images/KMeansElbowCurve.png)


Mostly randomly choosing a selection of inputs (Total Enrollment, Average Tuition, and Total number of Applicants), and using the 7 clusters the KMeans Elbow Curve suggested, showed the following 3D Scatter diagram

![K Means Cluster 3D scatter diagram](/images/KMeansCluster3D.png)


Having so many possible features, we thought it would be wise to use PCA (Principal Component Analysis) to cluster.  We began by using `StandardScaler` to Standardize the data

![PCA Standard Scaler](/images/StandardScaler.png)


We then initialized the PCA model to 5 components (from the original 76).  The explained variance ratio shows that these five components only encompass 58% of the information.  We will need to explore this further as we move along in the project

![PCA Model](/images/PCAmodel.png)


Using these new five new Principal Components (`PC1`, `PC2`, `PC3`, `PC4`, and `PC5`) we created an Elbow Curve to determine the appropriate number of clusters to fit our model with (5)

![PCA Elbow Curve](/images/PCAElboCurve.png)


And then using the first three principal components (about 48% of the information) we displayed the five clusters in a 3D Scatter plot

![PCA Cluster 3D scatter diagram](/images/PCACluster3D.png)
