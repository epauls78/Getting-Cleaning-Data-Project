#Starts with zip file
unzip("getdata_projectfiles_UCI HAR Dataset.zip")

#load measure labels
setwd(paste(getwd(),"/UCI HAR Dataset",sep=""))
data.columns<-read.table("features.txt")
column.names<-as.vector(data.columns[,2])

#load test data
setwd(paste(getwd(),"/test",sep=""))

test.data<-read.table("X_test.txt")
test.exercise<-read.table("y_test.txt")
test.subject<-read.table("subject_test.txt")
colnames(test.data)<-column.names

test.data<-cbind(test.subject, test.exercise, test.data)
colnames(test.data)[1:2]<-c("Subject", "Exercise")

#load train data
setwd("../")
setwd(paste(getwd(),"/train",sep=""))

train.data<-read.table("X_train.txt")
train.exercise<-read.table("y_train.txt")
train.subject<-read.table("subject_train.txt")
colnames(train.data)<-column.names

train.data<-cbind(train.subject, train.exercise, train.data)
colnames(train.data)[1:2]<-c("Subject", "Exercise")

#merge data
all.data<-rbind(test.data, train.data)

#replace code activity
all.data[[2]]<-replace(all.data[[2]], all.data[[2]]==1, "WALKING")
all.data[[2]]<-replace(all.data[[2]], all.data[[2]]==2, "WALKING_UPSTAIRS")
all.data[[2]]<-replace(all.data[[2]], all.data[[2]]==3, "WALKING_DOWNSTAIRS")
all.data[[2]]<-replace(all.data[[2]], all.data[[2]]==4, "SITTING")
all.data[[2]]<-replace(all.data[[2]], all.data[[2]]==5, "STANDING")
all.data[[2]]<-replace(all.data[[2]], all.data[[2]]==6, "LAYING")

#subset columns including "mean" and "sd" in the name, plus the previously added Exercise and Subject
subset_data<-all.data[, grepl("mean", colnames(all.data), ignore.case=TRUE) | 
                        grepl("std", colnames(all.data), ignore.case=TRUE) | 
                        grepl("Subject", colnames(all.data)) | 
                        grepl("Exercise", colnames(all.data))]
#remove columns containing "meanFreq"
remove<-colnames(all.data[, grepl("meanFreq", colnames(all.data), ignore.case=TRUE)])
subset_data[remove]<-list(NULL)
remove<-colnames(all.data[, grepl("angle", colnames(all.data), ignore.case=TRUE)])
subset_data[remove]<-list(NULL)

#create final data.frame doing the mean per activity and subject
final<-aggregate(subset_data[,3:68], list(Subject=subset_data$Subject, Exercise=subset_data$Exercise), FUN=mean)

#fix variables names
colnames(final)<-c("subject", "exercise", "mean.timebodyaccel.x", "mean.timebodyaccel.y", "mean.timebodyaccel.z", 
                   "sd.timebodyaccel.x", "sd.timebodyaccel.y", "sd.timebodyaccel.z", "mean.timegravityaccel.x", 
                   "mean.timegravityaccel.y", "mean.timegravityaccel.z", "sd.timegravityaccel.x", "sd.timegravityaccel.y", 
                   "sd.timegravityaccel.z", "mean.timebodyacceljerk.x", "mean.timebodyacceljerk.y", "mean.timebodyacceljerk.z", 
                   "sd.timebodyacceljerk.x", "sd.timebodyacceljerk.y", "sd.timebodyacceljerk.z", "mean.timebodygyro.x", "mean.timebodygyro.y", 
                   "mean.timebodygyro.z", "sd.timebodygyro.x", "sd.timebodygyro.y", "sd.timebodygyro.z", "mean.timebodygyrojerk.x", "mean.timebodygyrojerk.y", 
                   "mean.timebodygyrojerk.z", "sd.timebodygyrojerk.x", "sd.timebodygyrojerk.y", "sd.timebodygyrojerk.z", "mean.timebodyaccel.magnitude", 
                   "sd.timebodyaccel.magnitude", "mean.timegravityaccel.magnitude", "sd.timegravityaccel.magnitude", "mean.timebodyacceljerk.magnitude", 
                   "sd.timebodyacceljerk.magnitude", "mean.timebodygyro.magnitude", "sd.timebodygyro.magnitude", "mean.timebodygyrojerk.magnitude", "sd.timebodygyrojerk.magnitude", 
                   "mean.freqbodyaccel.x", "mean.freqbodyaccel.y", "mean.freqbodyaccel.z", "sd.freqbodyaccel.x", "sd.freqbodyaccel.y", "sd.freqbodyaccel.z", "mean.freqbodyacceljerk.x", 
                   "mean.freqbodyacceljerk.y", "mean.freqbodyacceljerk.z", "sd.freqbodyacceljerk.x", "sd.freqbodyacceljerk.y", "sd.freqbodyacceljerk.z", "mean.freqbodygyro.x", 
                   "mean.freqbodygyro.y", "mean.freqbodygyro.z", "sd.freqbodygyro.x", "sd.freqbodygyro.y", "sd.freqbodygyro.z", "mean.freqbodyaccel.magnitude", "sd.freqbodyaccel.magnitude", 
                   "mean.freqbodybodyacceljerk.magnitude", "sd.freqbodybodyacceljerk.magnitude", "mean.freqbodygyro.magnitude", "sd.freqbodygyro.magnitude", 
                   "mean.freqbodybodygyrojerk.magnitude", "sd.freqbodybodygyrojerk.magnitude")

#export final table
write.csv(final, "final_table.csv")