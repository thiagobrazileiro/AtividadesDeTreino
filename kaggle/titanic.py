import pandas as pd
from sklearn.preprocessing import MinMaxScaler

#418 people will be survived, so we need predict which ones
def strtoint(x):
    x = 1 if x == 'male' else 0
    return x

train = pd.read_csv('data/titanic/train.csv')
train_manipulated = train.drop(columns=['PassengerId', 'Name', 'Ticket',
                    'Cabin', 'Embarked'], axis=1)
train_manipulated['Sex'] = train_manipulated['Sex'].map(strtoint)
# print(train_manipulated.head())

columns = ['Survived', 'Pclass', 'Sex', 'Age', 'SibSp', 'Parch', 'Fare']

scalar_x = MinMaxScaler()
train_manipulated[columns] = scalar_x.fit_transform(train_manipulated[columns])
# print(train_manipulated.head())

x = train_manipulated.drop('Survived', axis=1)
y = train_manipulated.Survived