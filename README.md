# Customer Segmentation

## Project Description 

### Why Customer Segmentation
Customer segmentation is a vital source of a company's overall business success. Majority businesses are customer centric. They would
like to succeed by reaching their target audience and marketing the right product to the targeted group. Customer segmentation
Data analysis will give us the opportunity to experience the marketing strategies and enhance the understanding of product launch 
management.

### Description of the source data
The source data was obtained from Kaggle where it was originally provided by Dr. Omar Romero-Hernandez, an economics researcher at UC Berkeley. The data describes the customers' attributes (i.e. age, education, marital status, number of kids), amount spent on products the business carries, history of customer orders/purchases, and customers' interactions with customer service (complaints and response).  

### Problem Question:
LB Grocers have contacted Beyond Impact, to help them with the overall market - customer segmentation and further help with the following concerns:
 
 -How to market the products based on current shopping trends?
 
 -How to increase overall profitability of the company?

The presentation for the project can be found here:
 [Customer Segmentation Slides.](https://docs.google.com/presentation/d/1yKPxy3uWoQJoH4-yD7rccqPCgsYoHS44sNkyUFY4Vt8/edit#slide=id.p)<br>
 The Complete coding for this project can be found here: [Customer Segmentation File.](https://github.com/nabuhant/CustomerSegmentation/blob/main/customerSegmentation.ipynb)


## Overview

### Project Pipeline
To carry out the project the steps outlined below will be followed. The steps are further explained in the following sections.   
![DataPipeline](https://github.com/nabuhant/CustomerSegmentation/blob/main/Images/Pipeline.PNG)
<br> 

### 
paration: Cleaning & Connection
The Pandas library is utilised through Jupyter notebook. Raw data is imported through Amazon's cloud service for better accessibility and connectivity. Furthermore, data is transformed and split into tables before exploratory data analysis (EDA). Detailed python code for cleaning and connecting of data can be found here: [Data Preparation](https://github.com/nabuhant/CustomerSegmentation/blob/main/customerSegmentation.ipynb).
<br>
General outline of steps taken are as follows: 
- Make a new database under Amazon AWS (Amazon Web Services).
- Add raw data csv to the database.
- Import libraries to jupyter notebook to load data and create dataframes for SQL.
- Create string for Amazon RDS (Relational Database Service) URL.
- Create engine to connect to Database from Amazon RDS.
- Load the csv in a dataframe.
- Drop unnecessary columns of data.
- Rename columns.
- Check for NAN values and drop if applicable.
- Change data types for individual column if required.
- Rearrange columns for further clarity.
- Split the clean dataframe into several dataframes as per the requirement; these dataframes will represent individual tables in the database.
- Export dataframes from Jupyter Notebook to tables in SQL using SQLAlchemy.
<br>


### Database Storage
PostgreSQL with Amazon RDS (Relational Database Service) from AWS (Amazon Web Services) is used as the cloud database storage for the dataset. The database's ERD was created to further elaborate on the data and its attributes. Tables from the ERD were created in PostgreSQL where cleaned dataframes were exported to.
![pgadminwindow](https://github.com/nabuhant/CustomerSegmentation/blob/main/Images/pgadmin_window.PNG)
<br> 

#### Database ERD
![Customer segmentation ERD](https://user-images.githubusercontent.com/96637236/181814109-cf81971c-df08-45ad-bb37-27671aa19c58.png)

#### ERD Tables with data imported from Jupyter Notebook
- Customers Table <br><br>
![customertable](https://github.com/nabuhant/CustomerSegmentation/blob/main/Images/customers_table.PNG)<br>

- Orders Table <br><br>
![orderstable](https://github.com/nabuhant/CustomerSegmentation/blob/main/Images/orders_table.PNG)<br>

- Products Table <br><br>
![productstable](https://github.com/nabuhant/CustomerSegmentation/blob/main/Images/products_table.PNG)<br>

- Customer Service Table <br><br>
![customerservicetable](https://github.com/nabuhant/CustomerSegmentation/blob/main/Images/newcustomerservice_table.PNG)<br>
<br>


### EDA
The objective for carrying out the EDA process is to provide insight in to the dataset and present the data for the following steps. In the EDA, the following was addressed:  
**A.** Determined and tackled outliers in the data  
**B.** Transformed and mapped columns to more meaningful data for our purposes  
**C.** Preliminary plots (scatter plots) to visualise relationships between data  
**D.** Extracted correlation matrix to help determine features for machine learning model  

#### A. Determined and tackled outliers in the data  
An example of an outlier is single data point below where a customer's income was sugnificantly higher than all customers. This was discovered by plotting a histogram of the incomes (Before). The data point was dropped and the income distribution is as per below (After) histogram. 
![EDA1](/Images/EDA1.png)  
Similarly, age was plotted on a histogram to determine outliers were present where age is over 85 years. These data points were dropped as well.  

#### B. Transformed and mapped columns to more meaningful data for our purposes  
An example of such a case is determing the age of customers. The raw data provided us a year of birth which an age was calculated from. Another instance is marital status which was unified to single or partner to result in simpler data to analyse and extract features for ML from.  

#### C. Preliminary plots (scatter plots) to visualize relationships between data  
After outliers were addressed and the data was transformed to more meaningful forms, the seaborn module was used to generate scatter plots of pairwise relationships in the dataset to provide an overview of relatiships for preliminary feature extraction/exploration for the machine learning model.  
![EDA2](/Images/EDA2.png)   

#### D. Extracted correlation matrix to help determine features for machine learning model  
The correlation matrix below was created using the seaborn module as well. Based on the correlation values **Income** and **Total Spent** were used as fetures for the machine learning model. 
![EDA3](/Images/EDA3.png)  
To further understand the relationship between these two features their linear regression was plotted and p-value and r-value determined as per below. The correlation, or r-value, is 0.793 showing a strong positive correlation as it is closer to 1.
![EDA4](/Images/EDA4.PNG)  


### Machine Learning
#### ML Mockup
<br> ![MLMockUp](https://github.com/nabuhant/CustomerSegmentation/blob/main/Images/MLMockUp.PNG)<br>

<br> 
Unsupervised Machine Learning would be the best method to target the business problem because it is very unlikely to determine groups/classification for types of data from the selected dataset. Therefore, unsupervised learning will create clusters which furthermore allows to determine patterns to group data. SciKitLearn is the ML library that will be used with Jupyter Notebook to create clusters. As unsupervised learning relies on visual analysis, hvPlot and Plotly libraries are also added to the environment.<br>

![cluster Types](https://github.com/nabuhant/CustomerSegmentation/blob/main/Images/clusterTypes.PNG)
<br>

Clusters will be determined by using K-means and  Agglomerative  clustering algorithms in this project. The purpose of performing two different algorithms is to simply compare/evaluate its results to further evaluate the problem and offer an in-depth analysis.

#### Brief Procedure: 
1. Made a copy of the dataframe obtained from the EDA process.
2. The dataframe had categorical columns which were 'Marital_Status_map','Age_Group','Education_map' hence applied a "One-hot-encoder" algorithm on  these columns.<br>
![ML1](https://user-images.githubusercontent.com/96637236/181815067-17682b46-bcac-4706-970c-968f1760287a.PNG) <br>
3. The dataframe obtained is merged with the original dataframe, renamed it with meaningful column names.
4. Dropped the unnecessary columns along with the ones that were encoded and the 'NAN' containing rows. Dataframe is ready to be used for clustering algorithms. <br><br>
![ML2](https://user-images.githubusercontent.com/96637236/181809245-f3f42a20-6eb7-49fd-8c73-542e9b24c784.PNG) <br>
5. Perform clustering algorithms:
   1. First the dataframe is subjected to the K-Means algorithm to find the clusters.
      - Found the value of "K =3 " using the Elbow Curve.<br><br>
![elbowGraph](https://user-images.githubusercontent.com/96637236/181818065-c8d5bdf7-f0c4-471f-be8f-7d9280fac57f.PNG)<br>
      - The K value of 3 clusters and the dataframe is passed to the "get_clusters" function that uses KMeans model and returns the predictions(0,1,2) in the form  of a column called "class" of the dataframe. <br>       
   ![ThreeClusterDataFrame](https://user-images.githubusercontent.com/96637236/181815926-bd63ce39-7603-4205-94fc-33f9c7aac551.PNG)<br>
      - Using the logistic regression analysis performed in EDA, dimensions "Income" and "Total_Spent" were selected and plotted a 2D hvplot-scatter graph for further analysis.<br>  
  ![k-means1](https://user-images.githubusercontent.com/96637236/181809563-da2434a9-710a-4f57-9f43-11d7573d4156.PNG)<br>
      - Tried the same process by plotting different combinations of dimensions "Income " and "TotalNumPurchases" just for the reference.<br>   
   ![k-means2](https://user-images.githubusercontent.com/96637236/181809607-3359ad94-eddc-4d56-9188-b149feaae5f0.PNG)<br>
      - This dataframe is then exported as csv and also stored in the Amazon RDS database.
    2. Secondly the same data frame obtained by encoding and cleaned from step 4 is subjected to the "Agglomerative Clustering" algorithm.
         - Using Dendrogram 2 clusters were calculated.<br>  
  ![Dendrograph](https://user-images.githubusercontent.com/96637236/181809658-65f315e8-6c74-4a5f-872a-48ce056bcc84.PNG)<br>  
         - A copy of the dataframe is made to work upon  and applied the "Agglomerative Clustering" algorithm on it. Identified the class and added it as one of the columns. 
         - Created a 2D hvplot-scatter plot to show the results of the hierarchical clustering algorithm against the dimensions "Income" and "Total_Spent".<br>  
  ![agglomerativeGraph](https://user-images.githubusercontent.com/96637236/181809804-0fc4eb8c-a6a7-4aae-a4db-caa28fb8c833.PNG)  
         - Resulting dataframe is exported as a csv file and also stored in Amazon RDS database.
 6. In this case although Agglomerative Clustering looks better we would still like to learn more about it by passing the result of Machine learning to the visualization process before conclusion.  
 7. This clustering model discussion.
     1. We will choose 2 clusters here. "Cluster 0" has the customers with larger income than "Cluster 1".
     2. We chose 2 clusters because the elbow curve resulted in two "K" values 2(Sharp bent) and 3 (slightlyBent) . To make it clear we further subjected the same dataset to an agglomerative clustering algorithm and got 2 clusters. The difference between clusters was very minimal or no overlapping.
     3. In order to know how each feature behaves, a separate file is created to study the pattern.
     4. The column "Class" form model results was added to the pre encoded data frame.Many columns were deleted that were not needed. 
     5. Using very little features, Seaborn histograms are created for each column to know the basic pattern.Using this as base further analysis with additional features are plotted in visualization.
     6. The histograms created were not very informative so passed the data to the next phase.
     7. Please find the link for the file [Basic Analysis.](https://github.com/nabuhant/CustomerSegmentation/blob/main/basicAnalysis.ipynb)
     
 8. This clustering model still has some limitations.
     1. For a larger set of dataset, models might predict different clusters and priority on choosing model differs.
     2. Number of clusters is still dependent on individual preference.
 9. The models will still be exeprimented on different combination of dimensions and input features to learn and decide on best results.
         
Detailed code can be found here : 
[CustomerSegmentation.ipynb](https://github.com/nabuhant/CustomerSegmentation/blob/main/customerSegmentation.ipynb).
   <br>


### Dashboard

#### Basic Analysis 
![Basic Analysis-DB 1](https://user-images.githubusercontent.com/96637236/183270494-1cf49829-0908-4682-9eda-633f157a60c6.png)

#### Detailed Analysis
![Detailed Analysis - DB 2](https://user-images.githubusercontent.com/96637236/183270504-48a5f85e-e8f1-4818-afa8-c373803d0b79.png)

![Detailed Analysis - DB 3](https://user-images.githubusercontent.com/96637236/183270509-1dd62d11-9b23-4795-8e55-e8d7f273a613.png)

#### Dashboard 
The dashboard for the data analysis can be found here:
[Customer Segmentation Dashboard](https://public.tableau.com/views/CustomerSegmentation_Dashboard_Final_16601807088850/LBGrocersAnalysis-CustomerSegmentation?:language=en-US&publish=yes&:display_count=n&:origin=viz_share_link)<br>

Dashboard has been presented with a data story that is logical and easy to follow for someone unfamiliar with the topic. 
It includes data analysis of Customer segmentation.
Interactive elements are added to further elaborate the Dashboard

Further details regarding the Dashboard analysis are as follows:

Data Analysis was completed based on customer segmentation that was further divided into 2 groups or clusters - Elite & Valuable Class.
Different features have been used to drive results from basic and in-depth analysis

#### Recommendations are as follows:
- Offer discounts and sales on different products for increase spending among Valuable class 
- Offer senior loyalty program to Elite class - Seniors above age 50 
- Increase web purchases by offering discounted deals for online purchases - targeted towards Valuable class as sample

#### Description of interactive element(s)

- Filter -Highighlight actions have been used in the Dashboard and story created for better data analysis

#### Conclusion
- Marketing strategies should focus more on the Valuable class as they consist of larger family size as compared to Elite class
- Elite class can be appreciated for their higher spending by offering reward points. Higher purchases will result in increased points accumulation.
- Further profitability can be increased by changing the floor plan that increases customer flow, accessible staff in store, promoting online purchases and targeting family friendly discounted products.

