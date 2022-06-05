# FinalProject

### GitHub 

#### files
  - PDF of dashboard images `Tableau_PDF.pdf`

#### folders

- **Resources**: Data files found on Kaggle.com and files imported and generated for Machine Learning models 
  - College Admissions Data `Data-Table 1.csv`
  - Colleges and University Data `colleges_and_Universities.csv`
  - US News & World Report Rankings `colleges.csv`
  - Cleaned and processed data for Machine Learning Model with clusterID added `colleges_cluster.csv`
  - File created with Training data and cluster ID `colleges_train.csv`
  - File created with Test data and cluster ID `colleges_test.csv`
  - File created with Training and Test Data combined with cluster ID `colleges_split.csv`
 

- **Datacleaning_Database**: This folder contains multiple jupyter notebook files that were used to reframe the data from each of the resource files.
  - Database schema `dbschema.sql`
  - Final csv file produced from pgAdmin4 `Data-Table 1.csv`
 

- **MachineLearning**: This folder contains multiple jupyter notebooks used to run and evaluate the Machine Learning Model
  - Connecting Machine Model to Database `db_connection.ipynb`
  - Early in process view of PCA for consideration `colleges_PCA.ipynb`
  - Code used to train, test, and split the data `MachineModelSplit.ipynb`
  - Code used to evaluate training and testing data and to evaluate importance of features used in clustering` MachineModelFeatures.ipynb`
  - Evaluation of Clusters for Full Model `Cluster_Evaluation.ipynb` 
  - Evaluation of Clusters for Training Model `Training_Cluster_Evaluation.ipynb` 
  - Code used to create dendrograms for evaluation of `hierarchical clustering hierarchicalClustering.ipynb`
  - Grid showing results of Model Cluster Evaluation to determine best number of clusters for both full and training dataset `MachineLearningClusterEvaluation.xlsx` 

- **Images**: README, reports, and presentation images


# US Colleges and University Comparison

There are many factors to consider when choosing a College or University.  How are schools the same?  How are they different?  How are they comparable? 

For this project, we choose to look at U.S. college admission information as it provided considerable datasets. We used a clustering models to determine the best predictions for our data. To conduct this predictive modeling endeavor, we sourced our data from [Kaggle.com](https://www.kaggle.com/datasets/samsonqian/college-admissions) which featured a csv file with information from 2010 to 2014

# Database
## Cleaning the Data
The initial data for this project came from three (3) datasets. The Data-Table 1.csv file served as the main datasource with the other files providing supplemental data. In order to prepare the data for analysis, we used python / pandas.  The cleaning process included:
 - reducing the columns from >100 columns to ~40
 - using 'get dummies' to convert some columns into binary data
 - factorizing some columns to convert to numeric data

## Connecting the Data
Once cleaned, the updated pandas dataframes were subsequently exported to new .csv files.  The relational database was created using pgAdmin4 / PostgreSQL and then hosted on Amazon Web Service (AWS).  The ERD image, `QuickDBD-ERD_Diagram2.png` is stored in the images folder.


# Machine Learning Model
### Model Selection
We have chosen to use a clustering model of machine learning (unsupervised machine learning) because the data we are looking at has many features (76 columns after initial preprocessing) without a clear output (`y`).  So many features will make determining the right inputs and the right number of clusters difficult.  As a team we discussed this and narrowed these 76 features down to 40 by choosing to focus on undergraduate data and narrowing the tuition and fee data.  Once the tables in the database were cleaned up to reflect these changes, we re-ran the KMeans cluster with this updated data and split the data into training and testing datasets  `/MachineLearning/MachineModelSplit.ipynb`.

### Cluster Accuracy
Because we used unsupervised machine learning, the accuracy measures that are available for supervised machine learning are not created in the same way.   Instead, we focused on testing the accuracy of the clusters. In order to determine the best number of clusters to use, we used five methods as shown in the following table


|Index   | Description   |best cluster#| Image   |
|   :----:   | :----:   |   :---: |   :---: |  
| Elbow Curve     | where elbow bends towards straight |4 or 6|     ![elbow curve](/images/ElbowCurve.png)|
| Dendrogram/Hierarchical clustering   | Highest level that captures all groups and counting the number of branches  | 4 or 5|     ![dendrogram](/images/dendrogram.png)|
|Calinski-Harabasz Index (aka Variance Ratio Criterion| The score is higher when clusters are dense and well separated |4 or 6|           |
|Silhouette Score| Silhouette coefficients near +1 indicate that the sample is far away from the neighboring clusters. A value of 0 indicates that the sample is on or very close to the decision boundary between two neighboring clusters and negative values indicate that those samples might have been assigned to the wrong cluster. | 4 | ![Silhouette](/images/SilhouetteAnalysis.png)|
|Davis-Bouldin Index (DBI)| (DBI) is calculated as the average similarity of each cluster with a cluster most similar to it. The lower the average similarity is, the better the clusters are separated and the better is the result of the clustering performed.| 4 | ![Davis-Bouldin Index](/Images/FullDaviesBouldin.png)|

We evaluated both the the full data set `/MachineLearning/ClusterEvaluation.ipynb` and the training data set `/MachineLearning/Training_Cluster_Evaluation.ipynb` (see also `/MachineLearning/hierarchicalClustering.ipynb` for both full and training dendrograms).  

Results of all methods can be seen on the grid  `/MachineLearning/MachineLearningClusterEvaluation.xlsx`

There were a few different results, but as 4 clusters was consistently the best result in all methods for both the full data and the training data, 4 clusters was used for the Feature evaluation `MachineLearning/MachineModelFeatures`

### Feature Evaluation
As we are using unsupervised machine learning, we are not training a model. However, for this project, to attempt to evaluate the clustering model, we treated the assigned cluster as a classification and compared the full model data with the training and testing data `/MachineLearning/MachineModelFeatures.ipynb`.  This allowed us to create a confusion matrix showing that the original "full" cluster were very closely aligned with the clusters assigned to the training and test data 

![Confusion Matrix](/Images/ConfusionMatrix.png)

This also allowed us to see (and graph) the features in order of importance

![Importance of Features](/Images/featureimportance.png)


# Dashboard
Dashboard in Tableau
https://public.tableau.com/app/profile/laura.zacharda.jones/viz/Colleges_Clustered_Data_6-3-22/Story1?publish=yes



# Presentation
Presentation is in google slides doc
https://docs.google.com/presentation/d/1g5CjUa0wOmDh8gMe49bHFKTHKxUScElyYGXSOHSmzww/edit?usp=sharing



