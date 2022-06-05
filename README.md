# FinalProject

### GitHub 

#### files
- PDF of dashboard images 'Tableau_PDF.pdf'
- 

#### folders

- **Resources**: data files found on Kaggle.com
  - College Admissions Data `Data-Table 1.csv`
  - Colleges and University Data 'colleges_and_Universities.csv'
  - US News & World Report Rankings 'colleges.csv'

- **Datacleaning_Database**: this folder contains multiple jupyter notebook files that were used to reframe the data from each of the resource files.
  - Database schema 'dbschema.sql'
  - Final csv file produced from pgAdmin4 `Data-Table 1.csv`
 

- **MachineLearning**: Pandas notebooks showing 
  - Splitting `Split_Cluster_Evaluation.ipynb`
  - Evaluation of Clusters for Full Model `Cluster_Evaluation.ipynb` 
  - Split Model (both test and train recombined) `Split_Cluster_Evaluation.ipynb` 
  - and Training `ModelTraining_Cluster_Evaluation.ipynb`


# US Colleges and University Comparison

There are many factors to consider when choosing a college or University.  How are schools the same?  How are they different?  How are they comparable? 

For this project, we choose to look at U.S. college admission information as it provided considerable datasets. We used a clustering models to determine the best predictions for our data. In order to conduct this predictive modeling endeavor, we sourced our data from [Kaggle.com](https://www.kaggle.com/datasets/samsonqian/college-admissions) which featured a csv file with information from 2010 to 2014

# Database
## Cleaning the Data
The initial data for this project came from three (3) datasets. The Data-Table 1.csv file served as the main datasource with the other files providing supplemental data. In order to prepare the data for analysis, we used python / pandas.  The cleaning process included:
 - reducing the columns from >100 columns to ~40
 - using 'get dummies' to convert some columns into binary data
 - factorizing some columns to convert to numeric data

## Connecting the Data
Once cleaned, the updated pandas dataframes were subsequently exported to new .csv files.  The relational database was created using pgAdmin4 / PostgreSQL and then hosted on Amazon Web Service (AWS).  The ERD image is stored in the images folder.


# Machine Learning Model


We have chosen to use a clustering model of machine learning (unsupervised machine learning) because the data we are looking at has many features (76 columns after initial preprocessing) without a clear output (`y`).  So many features will make determining the right inputs and the right number of clusters difficult.  As an initial attempt at fitting to machine learning, we created an elbow curve to determine the number of appropriate clusters looking for best `K` in `KMeans` (file `simple_machine_model.ipynb`)

Having so many possible features, we thought it would be wise to use PCA (Principal Component Analysis) to cluster. (file `colleges_PCA.ipynb`) 
- We began by using `StandardScaler` to Standardize the data
- We then initialized the PCA model to 5 components (from the original 76).  The explained variance ratio shows that these five components only encompass 58% of the information.  We will need to explore this further as we move along in the project
- Using these new five new Principal Components (`PC1`, `PC2`, `PC3`, `PC4`, and `PC5`) we created an Elbow Curve to determine the appropriate number of clusters to fit our model with (5)
- And then using the first three principal components (about 48% of the information) we displayed the five clusters in a 3D Scatter plot

As mentioned above, the initial preprocessing still left us with 76 columns of data (features). As a team we discussed this and narrowed these 76 features down to 40 by choosing to focus on undergraduate data and narrowing the tuition and fee data.  Once the tables in the database were cleaned up to reflect these changes, we re-ran the KMeans cluster with this updated data `colleges.csv`.

As we are using unsupervised machine learning, we are not training a model and there is not an objective function to test the performance of the algorithm. While real world use of unsupervised learning may not split the data into testing and training models, we needed some way to show accuracy of our model so we split the preprocessed 'clean' data into testing and training sets and ran `MachineLearning/MachineModelSplit.ipynb` 

Instead, we focused on testing the accurracy of the clusters. In order to  To determine the best number of clusters to use, I used five methods (file `Cluster_Evaluation.ipynb`) as shown in the following table


|Index   | Description   | n_clusters=2| n_clusters=3|n_clusters=4|n_clusters=5|n_clusters=6|n_clusters=7|best cluster#| Image   |
|   :----:   | :----:   |   :---: |   :---: |   :---: |   :---: |   :---: |   :---: |   :---: |   :---: |
| Elbow Curve     | where elbow bends towards straight | | | | | | |4 or 6|     ![elbow curve](/images/ElbowCurve.png)|
| Dendrogram/Hierarchical clustering   | Highest level that captures all groups and counting the number of branches  | | | | | | |4 or 5|     ![dendrogram](/images/dendrogram.png)|
|Calinski-Harabasz Index (aka Variance Ratio Criterion| The score is higher when clusters are dense and well separated | 723.603| 995.731|1007.923|1006.470|1020.840|1012.735|4 or 6|           |
|Silhouette Score| Silhouette coefficients near +1 indicate that the sample is far away from the neighboring clusters. A value of 0 indicates that the sample is on or very close to the decision boundary between two neighboring clusters and negative values indicate that those samples might have been assigned to the wrong cluster.| 0.51938| 0.42790|0.42242|0.43051|0.41595|0.39543|4 | ![Silhouette](/images/SilhouetteAnalysis.png)|
|Davis-Bouldin Index (DBI)| (DBI) is calculated as the average similarity of each cluster with a cluster most similar to it. The lower the average similarity is, the better the clusters are separated and the better is the result of the clustering performed.| | | 0.774398 | | | |4 | ![Davis-Bouldin Index](/images/Davies_Bouldin_Index.png)|


There were a few different results, but as 4 clusters was consistently the best result in all methods, our next step was to see what 4 clusters showed us using different variables for x and y (file `ModelwDifClusters.ipynb`)

# Dashboard
Dasboard in Tableau
https://public.tableau.com/app/profile/laura.zacharda.jones/viz/Colleges_Clustered_Data_6-3-22/Story1?publish=yes



# Presentation
Presentation is in google slides doc
https://docs.google.com/presentation/d/1g5CjUa0wOmDh8gMe49bHFKTHKxUScElyYGXSOHSmzww/edit?usp=sharing



