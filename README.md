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
- As the team of four each one collaborated and contributed equally for the Project.
- Have used Google meet and Zoom calls apart from the office hours and class hours provided by the boot camp.

#### Individual Branches Creation
- All the members have created a separate branch and to work upon and successfully merged into the main branch.
 

### Technology/Tools Overview
![DataPipeline](/Pipeline.PNG) 
- The link for the Google document for the DataPipeline document can be found here [Data Pipeline Image Document.](https://drive.google.com/file/d/1APNQWqY7bScOVwQ1omL61U-CXKvQPcZ5/view?usp=sharing)
<br> 

### Data Cleaning and Analysis
The Pandas library in Jupyter notebook is used to clean the data and perform exploratory analysis. 
- Load the csv in a dataframe.
- Check for duplicates.
- Check for NAN values.
- Eliminate Redundant data.
- Convert any column data type according to the need of the end result.
- Divide the data frame into further different dataframe as per the requirement, these data frames  will represent as individual tables in the database.
- Data is ready for initial storage.
- Any changes made or files added will be placed in the github final project folder.
<br>


### Database Storage
PostgreSQL with AWS cloud is used for the database requirement.
Data tables have been created to organize data and its functionality.
Customer segmentation ERD has been created to further elaborate the data and its attributes.
Project architecture has been implemented using google collab (ConnectDB File). Spark session has been integrated with the machine learning provisional database.

#### Database Mock Up (Preferably a ERD - Entity Relationship Diagram) 
![Customer segmentation ERD](https://user-images.githubusercontent.com/96637236/179373640-56fca98c-a7c3-44d7-b189-596236bc2d3e.png)

Data Integration via AWS and Google collab-Jupyter notebook

![Connect DB ](https://user-images.githubusercontent.com/96637236/179373879-83e3a074-f349-4859-b4a5-ad1e0071eb2e.png)


### Machine Learning
#### ML Mockup
<br> ![MLMockUp](/MLMockUp.PNG)<br>
The link for the Google document for the ML mockup document can be found here:
- [ML MockUp Image Document.](https://drive.google.com/file/d/1APNQWqY7bScOVwQ1omL61U-CXKvQPcZ5/view?usp=sharing)
<br> 
Unsupervised Machine Learning would be the best method to target the business problem because it is very unlikely to determine groups/classification for types of data from the selected dataset. Therefore, unsupersvised learning will create clusters which furthemore allows to determine patterns to group data. SciKitLearn is the ML library that will be used with Jupyter Notebook to create clusters. As unsupervised learning relies on visual analysis, hvPlot and Plotly libraries are also added to the environment. Clusters will be determined by using K-means algorithm and hierarchical clustering in this project. Purpose to perform two different algorithms is to simply compare/evaluate it's results to further evaluate the probelm and offer an in-depth analysis. 
<br />
1. Retrieve the data from the storage using the SQL functions.
2. Join or merge the database if required and store it in a different dataframe.
3. Prepare the data for machine learning.
4. Reduce data dimensions using PCA.
5. Perform clustering algorithms. 
   - K-means Clustering   
     - Step 1: Create elbow curve graph
     - Step 2: Determine number of clusters
     - Step 3: Run K-Means model to predict clusters
     - Step 4: Create new dataframe with predicted clusters
     - Step 5: Create 3D scatter plot diagram
   - Perform Hierarchical Clustering Algorithm. 
     - Step 1: Create dendrogram graph
     - Step 2: Determine number of clusters
     - Step 3: Run agglomerative clustering
     - Step 4: Add column to identify clusters
     - Step 5: Create 3D scatter plot diagram
6. Compare model results.
<br>


### Dashboard
- Tableau will be used for visualization of the results.
- Data is retrieved from the database and displayed.
<br>

### Results
#### Areas of interest & expected results will include relationships between:
- family size and purchasing habits  
- education, income and healthier food choices   
- How the growth of the size of the family increases their buying habits.
- Education and healthier products
