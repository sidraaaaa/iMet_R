#Name: Sidra Na
#Project 2

setwd("C:\\Users\\sidra\\Desktop\\iupui 3rd year\\fall semester 2019\\COMP FOR SCIEN APP N317\\R\\project")
#Purpose:


#importing bank.csv file from canvas.iu
adult<-read.csv(file="adult.csv", header=FALSE, sep=",")

#			*******1 Selecting some rows******
#selecting first 50 rows
adult[1:50,]



#			*******2 Selecting some Columns*******
#Selecting first 3 columns
adult[,1:3]


#			*******3 Perform some computation*******
#There is no header in this dataset, therefore, we are creating column names/header for this dataset
colnames(adult)<-c("age","workclass","fnlwgt","education","education-num","marital-status","occupation","relationship","race","sex","capital-gain","capital-loss","hours-per-week","native-country","50<salary>50")

#Calculating maximum age of person
max.age<-max(adult$age)
paste("Maximum age in the dataset is ",max.age)

#Calculating the highest capital gain in dataset
max.gain<-max(adult$"capital-gain")
paste("the highest capital gain in dataset", max.gain)

#Calculating the lowest capital loss in dataset
min.loss<-min(adult$"capital-loss")
paste("the lowest capital loss in dataset", min.loss)



#		*******4 Create new column
#Adding a column to find out the capital gain per week.
#first we'll divide the column 11: capital-gain by column 13: hours-per-week
#cap is the the capital gain per week
cap<-adult[,11]/adult[,13]
#now binding this matrix with our original matrix i.e. adult
adult<-cbind(adult,cap)
print("***Our new Matrix is listed with an additional column cap i.e. capital gain per week***")
print(adult)

#		******5 Changing data type of column*******
#Converting a column i.e. education-num's datatype into character datatype
adult$"education-num"<-as.character(adult$"education-num")
paste("Here is Education-num column which is converted into character datatype ")
adult$"education-num"



#		******6 Apply some functions on data
#extracting the details of person with maximum age,
#p.age= person details with age 
#calling the function personage()
source("personage.R")
personage(max.age)

#		******8 Merging*******
#Merging different columns to give a meaningful set of each person's information
mergeadult<-cbind(adult[1],adult[10],adult[6],adult[9],adult[4],adult[14])
paste("You can see the mergeadult matrix giving a meaningful set of each person's information
")
mergeadult

#		******11 Visualization*****
#First converting our dataset into matrix before plotting
adultmatrix<-as.matrix(adult)

#Plotting age and capital gain on graph to see relation between them, so that we 
#can gain an insight knowledge of how age factor is applicable on gain.
paste("Checking how age factor is related to capital gain")
plot(adultmatrix[,1],adultmatrix[,11], type="h", main="relation between age and capital gain", xlab="age", ylab="capital gain", col="green")

#Writing a csv file
write.table(adult, file="newadultfile.csv",append=FALSE,sep=",",row.names=FALSE,col.names=TRUE)

