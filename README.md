# Customer Segmentation

## Project Description 

### Why Customer Segmentation
Customer segmentation is a vital source of a company's overall business success. Majority businesses are customer centric. They would
like to succeed by reaching their target audience and marketing the right product to the targeted age group. Customer segmentation
Data analysis will give us the opportunity to experience the marketing strategies and enhance the understanding of product launch 
management.

### Description of the source data
The source data was obtained from Kaggle where it was originally provided by Dr. Omar Romero-Hernandez, an economics researcher at UC Berkeley. The data describes the customers' attributes (i.e. age, education, marital status, number of kids), amount spent on products the business carries, history of customer orders/purchases, and customers' interactions with customer service (complaints and response).  

### Problem Question
Carry out a customer personality analysis to create well defined customer segments that help retail grocery businesses to understand different buying customer trends and behaviours.



## Overview

### Github 
#### Steps followed for creating a new branch:
1. To clone the new repo  
   - git clone url -> Replace url with the project url  <br>
2. Creating a new Branch and pushing the code in the branch.  
   - git branch branchname  -> branchname is the branch to be created.
   - git branch -> To check the available branches. * indicates the branch we are currently in.  
   - git checkout branchname -> Switch to the preferred branchName.  
   - git add .   -> Add all the files  
   - git commit -m "Add the comments" -> Commit the code with appropriate comments.  
   - git push -u origin branchname -> Replace branch name with the actual branch name.  <br>
3. Check the status before merging into main, if required use pull request and then merge.Following command is required before merging to avoid conflict.
   - git status
   - git pull origin <br>

#### Description of the communication protocols
- As a team of four, each member collaborated and contributed equally towards the project.
- Have used Google meet and Zoom calls apart from the office hours and class hours provided by the boot camp.
- Have used the team's Slack channel for communication outside if meetings

#### Individual Branches Creation
- All the members have created a separate branch to work upon and have successfully merged into the main branch.
 

### Technology/Tools Overview
![DataPipeline](https://github.com/nabuhant/CustomerSegmentation/blob/main/Images/Pipeline.PNG)
- The link where the Data Pipeline diagram was created on draw.io can be found here [Data Pipeline Image Document.](https://drive.google.com/file/d/1APNQWqY7bScOVwQ1omL61U-CXKvQPcZ5/view?usp=sharing)
<br> 

### Data Cleaning and Connection
The Pandas library is utilised through Jupyter notebook. It is used to clean the data and perform exploratory data analysis (EDA). 
General outline of steps to be followed: 
- Load the csv in a dataframe.
- Check for duplicates.
- Check for NAN values.
- Eliminate redundant data.
- Convert any column data type according to the need of the end result.
- Divide the data frame into further different dataframes as per the requirement; these data frames  will represent individual tables in the database.
- Data is ready for initial storage.
- Any changes made or files added will be placed in this GitHub repository.
<br>


### Database Storage
PostgreSQL with AWS cloud is used for the database requirement.
Data tables have been created to organize data and its functionality.
Customer segmentation ERD has been created to further elaborate the data and its attributes.
Project architecture has been implemented using Google Colab (ConnectDB File). Spark session has been integrated with the machine learning provisional database.

#### Database Mock Up
![Customer segmentation ERD](https://user-images.githubusercontent.com/96637236/179373640-56fca98c-a7c3-44d7-b189-596236bc2d3e.png)

Data Integration via AWS and Google Colab-Jupyter notebook

![Connect DB ](https://user-images.githubusercontent.com/96637236/179373879-83e3a074-f349-4859-b4a5-ad1e0071eb2e.png)


### Machine Learning
#### ML Mockup
<br> ![MLMockUp](https://github.com/nabuhant/CustomerSegmentation/blob/main/Images/MLMockUp.PNG)<br>
The link for the Google document for the ML mockup document can be found here:
 [ML MockUp Image Document.](https://drive.google.com/file/d/1APNQWqY7bScOVwQ1omL61U-CXKvQPcZ5/view?usp=sharing)
<br> 
Unsupervised Machine Learning would be the best method to target the business problem because it is very unlikely to determine groups/classification for types of data from the selected dataset. Therefore, unsupervised learning will create clusters which furthermore allows to determine patterns to group data. SciKitLearn is the ML library that will be used with Jupyter Notebook to create clusters. As unsupervised learning relies on visual analysis, hvPlot and Plotly libraries are also added to the environment.<br>
![cluster Types](https://github.com/nabuhant/CustomerSegmentation/blob/main/Images/clusterTypes.PNG)
<br>
Clusters will be determined by using K-means and  Agglomerative  clustering algorithms in this project. The purpose of performing two different algorithms is to simply compare/evaluate its results to further evaluate the problem and offer an in-depth analysis.
<br>
#### Brief Procedure: <br>
1. Made a copy of the dataframe obtained from the EDA process.
2. The dataframe had categorical columns which were 'Marital_Status_map','Age_Group','Education_map' hence applied a "One-hot-encoder" algorithm on  these columns.<br>
![ML_DF1](https://github.com/nabuhant/CustomerSegmentation/blob/main/Images/ML1.PNG)<br>
3. The dataframe obtained is merged with the original dataframe, renamed it with meaningful column names.
4. Dropped the unnecessary columns along with the ones that were encoded and the 'NAN' containing rows. Dataframe is ready to be used for clustering algorithms.<br>
<br> ![ML_DF2](https://github.com/nabuhant/CustomerSegmentation/blob/main/Images/ML2.PNG)<br> <br>
5. Perform clustering algorithms:
   1) First the dataframe is subjected to the K-Means algorithm to find the clusters.
         - Found the value of "K =3 " using the Elbow Curve.<br> <br>
         ![Elbow Graph](https://github.com/nabuhant/CustomerSegmentation/blob/main/Images/elbowGraph.PNG) <br>
         - The K value of 3 clusters and the dataframe is passed to the "get_clusters" function that uses KMeans model and returns the predictions(0,1,2) in the form  of a column called "class" of the dataframe. <br>
         ![Three Cluster Data Frame](https://github.com/nabuhant/CustomerSegmentation/blob/main/Images/ThreeClusterDataFrame.PNG)<br>
         - Using the logistic regression analysis performed in EDA, dimensions "Income" and "Total_Spent" were selected and plotted a 2D hvplot-scatter graph for further analysis.<br>
   ![k-means1](https://github.com/nabuhant/CustomerSegmentation/blob/main/Images/k-means1.PNG)<br>
         - Tried the same process by plotting different combinations of dimensions "Income " and "TotalNumPurchases" just for the reference.<br>
   ![k-means2](https://github.com/nabuhant/CustomerSegmentation/blob/main/Images/k-means2.PNG)<br>
         - This dataframe is then exported as csv and also stored in the Amazon RDS database.
         
    2) Secondly the same data frame obtained by encoding and cleaned from step 4 is subjected to the "Agglomerative Clustering" algorithm.
         - Using Dendrogram 2 clusters were calculated.<br>
   ![Dendrograph](https://github.com/nabuhant/CustomerSegmentation/blob/main/Images/Dendrograph.PNG)<br>
         - A copy of the dataframe is made to work upon  and applied the "Agglomerative Clustering" algorithm on it. Identified the class and added it as one of the columns.   
         - Created a 2D hvplot-scatter plot to show the results of the hierarchical clustering algorithm against the dimensions "Income" and "Total_Spent".<br>
   ![Agglomerative Graph](https://github.com/nabuhant/CustomerSegmentation/blob/main/Images/agglomerativeGraph.PNG)<br>
         - Resulting dataframe is exported as a csv file and also stored in Amazon RDS database.<br>
         
Detailed code can be found here : 
[CustomerSegmentation_Segment2.ipynb](https://github.com/nabuhant/CustomerSegmentation/blob/main/CustomerSegmentation_Segment2.ipynb).
   <br>


### Dashboard
- Tableau will be used for visualization of the results.
- Data is retrieved from the database and displayed.
<br>

### Results
#### Areas of interest & expected results will include examining relationships between:
- family size and purchasing habits  
- education, income and healthier food choices   
- How the growth of the size of the family increases their buying habits.
