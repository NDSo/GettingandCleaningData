# Getting and Cleaning Data Assignment CodeBook

### Data read from UCI Machine Learning Repository:
https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Exact Data Dowload Link: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Original Data Files: 

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

### Transformations
1. Assign **subject_test** and **subject_train** datasets the column name **'Subject'**

2. Assign **y_test** and **y_train** datasets the factor levels provided in **activity_labels** and the column name **'Activity'**

3. Assign **x_test** and **x_train** datasets the column names provided in **features**

4. Column bind the **subject_test**, **y_test**, and **x_test** datasets into **test_set**

5. Column bind the **subject_train**, **y_train**, and **x_train** datasets into **train_set**

6. Row bind **test_set** and **train_set** into **total_set**

7. Subset **total_set** to only include measurement columns where the measurement is a **mean()** or **std()** value

8. *Group* **total_set** *by* **'Activity'** and **'Subject'** into **answer_set** and **summarize_at()** each measurement column to its column **mean()**.

9. Sort **answer_set** by **'Activity'** and **'Subject'**
