#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
get_ipython().run_line_magic('matplotlib', 'inline')


# In[3]:


df1= pd.read_csv('data/titanic/train.csv')
df2 = pd.read_csv('data/titanic/test.csv')


# In[4]:


#contains data from ID 0 to ID 891

df1['Age']=df1['Age'].round(2)
df1['Fare']=df1['Fare'].round(2)
df1


# In[5]:


# contains Data from ID 892 to ID 1309

df2['Age']=df2['Age'].round(2)
df2['Fare']=df2['Fare'].round(2)
df2


# In[6]:


df1.info()


# In[8]:


df2.info()


# In[9]:


df1.isnull().sum()


# In[10]:


df2.isnull().sum()


# As we can see, In Training data set(df1), 177 in Age column and 687 in cabin column have null values, and in Test Data set(df2) 86 in Age column and 327 in Cabin column and 1 in Fare Column have null values, Now we will check it using seaborn. We can use seaborn to create a simple heatmap to see where we are missing data

# In[12]:


sns.heatmap(df1.isnull(), yticklabels=False, cmap='plasma')


# In[14]:


sns.heatmap(df2.isnull(), yticklabels=False, cmap='plasma')


# Roughly 20 percent of the Age data is missing. The proportion of Age missing is likely small enough for reasonable replacement with some form of imputation. Looking at the Cabin column, it looks like we are just missing too much of that data to do something useful with at a basic level. We'll probably drop this later, or change it to another feature like "Cabin Known: 1 or 0"

# In[16]:


sns.countplot( x = 'Survived' ,data=df1 )


# In[17]:


sns.countplot( x = 'Survived' ,data=df1, hue= 'Sex' )


# In[18]:


sns.countplot( x = 'Survived' ,data=df1, hue= 'Pclass' )


# In[21]:


sns.displot(df1['Age'].dropna(), bins=30)


# In[20]:


df1['Age'].hist(bins=30,color='darkred')


# In[22]:


sns.countplot(x='SibSp',data=df1)


# In[24]:


df1['Fare'].hist(bins=40,figsize=(8,4))


# In[25]:


fig, ax = plt.subplots(figsize=(8,4))
sns.heatmap(df1.corr(), cmap='rainbow' , annot= True)


# In[26]:


df1.drop('Cabin', axis=1, inplace=True)
df2.drop('Cabin', axis=1, inplace=True)


# In[27]:


a11 = df1[ (df1['Pclass'] == 1) & (df1['Sex'] == 'male') ].Age.mean()
a12 = df1[ (df1['Pclass'] == 1) & (df1['Sex'] == 'female') ].Age.mean()
a21 = df1[ (df1['Pclass'] == 2) & (df1['Sex'] == 'male') ].Age.mean()
a22 = df1[ (df1['Pclass'] == 2) & (df1['Sex'] == 'female') ].Age.mean()
a31 = df1[ (df1['Pclass'] == 3) & (df1['Sex'] == 'male') ].Age.mean()
a32 = df1[ (df1['Pclass'] == 3) & (df1['Sex'] == 'female') ].Age.mean()

age_mean = [a11,a12,a21,a22,a31,a32]
age_mean


# In[28]:


## now we replace the mean age according to sex and Pclass with null value

grp = ['Pclass','Sex']
df1['Age'] = df1['Age'].fillna(df1.groupby(grp)['Age'].transform('mean'))


# In[29]:


## check if there is any null value present in training dataset

df1['Age'].isnull().sum()


# In[31]:


b11 = df2[ (df2['Pclass'] == 1) & (df2['Sex'] == 'male') ].Age.mean()
b12 = df2[ (df2['Pclass'] == 1) & (df2['Sex'] == 'female') ].Age.mean()
b21 = df2[ (df2['Pclass'] == 2) & (df2['Sex'] == 'male') ].Age.mean()
b22 = df2[ (df2['Pclass'] == 2) & (df2['Sex'] == 'female') ].Age.mean()
b31 = df2[ (df2['Pclass'] == 3) & (df2['Sex'] == 'male') ].Age.mean()
b32 = df2[ (df2['Pclass'] == 3) & (df2['Sex'] == 'female') ].Age.mean()

age_mean = [b11,b12,b21,b22,b31,b32]
age_mean


# In[32]:


grp = ['Pclass','Sex']
df2['Age'] = df2['Age'].fillna(df2.groupby(grp)['Age'].transform('mean'))


# In[33]:


df2['Age'].isnull().sum()


# In[34]:


# Now we have null value in test data so we calculate mean of Training data (df1) and fill that null value with mean
df1.mean()


# In[35]:


df2.fillna(32.00, inplace=True)
df2.isnull().sum()


# In[36]:


## Now we check the same with the help of heat map

sns.heatmap(df1.isnull(), yticklabels=False, cmap='plasma')


# In[37]:


sns.heatmap(df2.isnull(), yticklabels=False, cmap='plasma')


# We'll need to convert categorical features to dummy variables using pandas! Otherwise our machine learning algorithm won't be able to directly take in those features as inputs.

# In[38]:


sex = pd.get_dummies(df1['Sex'],drop_first=True)
embark = pd.get_dummies(df1['Embarked'],drop_first=True)


# In[39]:


df1.drop(['Sex', 'Embarked', 'Name', 'Ticket'], axis=1, inplace=True)


# In[40]:


df1 = pd.concat([df1, sex, embark], axis=1)
df1['Fare']=df1['Fare'].round(1)


# In[41]:


df1.head(3)


# Now we do same for test data

# In[42]:


sex1 = pd.get_dummies(df2['Sex'],drop_first=True)
embark1 = pd.get_dummies(df2['Embarked'],drop_first=True)


# In[43]:


df2.drop(['Sex', 'Embarked', 'Name', 'Ticket'], axis=1, inplace=True)


# In[44]:


df2 = pd.concat([df2, sex1, embark1], axis=1)
df2['Fare']=df2['Fare'].round(1)


# In[45]:


df2.head(3)


# # Now we apply machine learning algorithms

# In[46]:


#import logistic regression
from sklearn.linear_model import LogisticRegression # Logistic Regression
from sklearn.model_selection import train_test_split #for split the data
from sklearn.metrics import accuracy_score #for accuracy_score
from sklearn.metrics import confusion_matrix #for confusion matrix
from sklearn.model_selection import KFold #for K-fold cross validation
from sklearn.model_selection import cross_val_score #score evaluation
from sklearn.model_selection import cross_val_predict #prediction
from sklearn.svm import SVC, LinearSVC 
from sklearn.ensemble import RandomForestClassifier
from sklearn.neighbors import KNeighborsClassifier
from sklearn.naive_bayes import GaussianNB


# Train and Test Data

# In[47]:


# Model Preprocessing.
X_train = df1.drop(['Survived'], axis=1)
y_train = df1['Survived']
X_test  = df2.copy()
X_train.shape, y_train.shape, X_test.shape


# ### Logistic Regression

# In[48]:


logmodel = LogisticRegression()
logmodel.fit(X_train , y_train)


# In[49]:


Y_pred = logmodel.predict(X_test)

logmodel.score(X_train, y_train)


# In[50]:


submission = pd.DataFrame({
        "PassengerId": df2["PassengerId"],
        "Survived": Y_pred
    })
submission.to_csv('titanic.csv', index=False)


# In[ ]:




