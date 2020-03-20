#giving max.age as an argument in function
personage<-function(max.age){
#matching the person with the highest age and then inputting the value
highpersonage<-subset(adult,age==max.age)
print(highpersonage)

}
