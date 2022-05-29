# Presentation
### U.S. College Admissions
What Colleges/Universities are in the U.S. & how can they be grouped to compare student demographics?

For this project, we choose to look at U.S. college admission information as it provided considerable datasets. We will be using clustering models to determine the best predictions for our data. In order to conduct this predictive modeling endeavor, we sourced our data from [Kaggle.com](https://www.kaggle.com/datasets/samsonqian/college-admissions) which featured a csv file with information from 2010 to 2014.

# Database
## Segment 1
In the first segment of this project, we used the main csv file as our mock database. With such a large dataset we used Pandas (used the `get.dummies` action to convert a couple of data object data columns into multiple binary data columns).  We also reduced the number of columns to create a workable file.

## Segment 2
In the second segment of this project, the true database was created by paring down the data from each of the original csv files (using Jupyter Notebook), exporting to new csv files and merging the files using multiple joins in pgAdmin. The database was then pushed to AWS. 

![ERD](https://github.com/sarcars/FinalProject/blob/main/Images/QuickDBD-Free%20Diagram.png))


# Machine Learning Model

## Segment 1
We have chosen to use a clustering model of machine learning (unsupervised machine learning) because the data we are looking at has many features (76 columns after initial preprocessing) without a clear output (`y`).  So many features will make determining the right inputs and the right number of clusters difficult.  As an initial attempt at fitting to machine learning, we created an elbow curve to determine the number of appropriate clusters looking for best `K` in `KMeans` (file `simple_machine_model.ipynb`)

Mostly randomly choosing a selection of inputs (Total Enrollment, Average Tuition, and Total number of Applicants), and using the 7 clusters the KMeans Elbow Curve suggested, showed the following 3D Scatter diagram

![K Means Cluster 3D scatter diagram](/images/KMeansCluster3D.png)


Having so many possible features, we thought it would be wise to use PCA (Principal Component Analysis) to cluster. (file `colleges_PCA.ipynb`) 
- We began by using `StandardScaler` to Standardize the data
- We then initialized the PCA model to 5 components (from the original 76).  The explained variance ratio shows that these five components only encompass 58% of the information.  We will need to explore this further as we move along in the project
- Using these new five new Principal Components (`PC1`, `PC2`, `PC3`, `PC4`, and `PC5`) we created an Elbow Curve to determine the appropriate number of clusters to fit our model with (5)
- And then using the first three principal components (about 48% of the information) we displayed the five clusters in a 3D Scatter plot

## Segment 2
As mentioned above, the initial preprocessing still left us with 76 columns of data (features). As a team we discussed this and narrowed these 76 features down to 40 by choosing to focus on undergraduate data and narrowing the tuition and fee data.  Once the tables in the database were cleaned up to reflect these changes, we re-ran the KMeans cluster with this updated data `colleges_cleaned4.csv`.

As we are using unsupervised machine learning, we are not training a model and there is not an objective function to test the performance of the algorithm.  Instead, we focused on testing the accurracy of the clusters.  To determine the best number of clusters to use, I used five methods (file `Cluster_Evaluation.ipynb`) as shown in the following table


|Index   | Description   | n_clusters=2| n_clusters=3|n_clusters=4|n_clusters=5|n_clusters=6|n_clusters=7|best cluster#| Image   |
|   :----:   | :----:   |   :---: |   :---: |   :---: |   :---: |   :---: |   :---: |   :---: |   :---: |
| Elbow Curve     | where elbow bends towards straight | | | | | | |4 or 6|     ![elbow curve](/images/ElbowCurve.png)|
| Dendrogram/Hierarchical clustering   | Highest level that captures all groups and counting the number of branches  | | | | | | |4 or 5|     ![dendrogram](/images/dendrogram.png)|
|Calinski-Harabasz Index (aka Variance Ratio Criterion| The score is higher when clusters are dense and well separated | 723.603| 995.731|1007.923|1006.470|1020.840|1012.735|4 or 6|           |
|Silhouette Score| Silhouette coefficients near +1 indicate that the sample is far away from the neighboring clusters. A value of 0 indicates that the sample is on or very close to the decision boundary between two neighboring clusters and negative values indicate that those samples might have been assigned to the wrong cluster.| 0.51938| 0.42790|0.42242|0.43051|0.41595|0.39543|4 | ![Silhouette](/images/SilhouetteAnalysis.png)|
|Davis-Bouldin Index (DBI)| (DBI) is calculated as the average similarity of each cluster with a cluster most similar to it. The lower the average similarity is, the better the clusters are separated and the better is the result of the clustering performed.| | | 0.774398 | | | |4 | ![Davis-Bouldin Index](/images/Davies_Bouldin_Index.png)|


There were a few different results, but as 4 clusters was consistently the best result in all methods, our next step was to see what 4 clusters showed us using different variables for x and y (file `ModelwDifClusters.ipynb`)

# Dashboard
- [x] Storyboard on Google Slides has been created https://docs.google.com/presentation/d/1g5CjUa0wOmDh8gMe49bHFKTHKxUScElyYGXSOHSmzww/edit?usp=sharing
- [ ] Description of the tool(s) that will be used to create final dashboard
- [ ] Description of interactive element(s)  




# Communication
## Segment 1 
Our team has made great use of slack to send messages back and forth with any questions or if we need to setup zoom meetings. We have been meeting almost every night, that we don’t have class, via zoom. This allows us to work more collaboratively when we can see each other and if something comes up we can address it right away. Each member then submits their work to their branch and then branches are merged to the main project page.
## Segment 2
Our team continues to shrink and are now down to just two members.  We have continued to use Slack and Zoom to keep each other informed of where we are at and where we are running into problems.
