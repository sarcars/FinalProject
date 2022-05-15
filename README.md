# Presentation
### U.S. College Admissions
What Colleges/Universities are in the U.S. & how can they be grouped to compare student demographics?

For this project, we choose to look at U.S. college admission information as it provided considerable datasets. We will be using clustering models to determine the best predictions for our data. In order to conduct this predictive modeling endeavor, we sourced our data from [Kaggle.com](https://www.kaggle.com/datasets/samsonqian/college-admissions) which featured a csv file with information from 2010 to 2014.

# Database
For this first segment we are using the csv file as our mock database. With such a large dataset we used Pandas (performed get dummies to data into binary features) to help clean up the data and to start making it a workable file.

# Machine Learning Model
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

# Communication
Our team has made great use of slack to send messages back and forth with any questions or if we need to setup zoom meetings. We have been meeting almost every night, that we don’t have class, via zoom. This allows us to work more collaboratively when we can see each other and if something comes up we can address it right away. Each member then submits their work to their branch and then branches are merged to the main project page.
