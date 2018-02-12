#data source web site
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#A-download and unzip data set
#download.file(fileUrl,destfile="./data/Dataset.zip",method="auto")
download.file(fileUrl,destfile="C:/Users/mbouras/Desktop/Rprog/mod3/Dataset.zip",method="auto")
#unzip(zipfile="C:/Users/mbouras/Desktop/Rprog/mod3/Dataset.zip",exdir="./data")
unzip(zipfile="C:/Users/mbouras/Desktop/Rprog/mod3/Dataset.zip",exdir="C:/Users/mbouras/Desktop/Rprog/mod3/Dataset")

#C:\Users\mbouras\Desktop\Rprog\mod3

#path_data <- file.path("./data" , "UCI HAR Dataset")

path_data <- file.path("C:/Users/mbouras/Desktop/Rprog/mod3/Dataset/" , "UCI HAR Dataset")

#B- Data set readings of differents variables (Activity/Features/Subject)
#B-1 ReadingActivity files; 
Activitytest <- read.table(file.path(path_data, "test", "Y_test.txt"),header = FALSE)
Activitytrain<- read.table(file.path(path_data, "train" , "Y_train.txt"),header = FALSE)

#B-2 Reading Features files;
Featurestest <- read.table(file.path(path_data, "test", "X_test.txt"),header = FALSE)
Featurestrain<- read.table(file.path(path_data, "train" , "X_train.txt"),header = FALSE)

#B-3 Reading Subject files;
Subjecttest <- read.table(file.path(path_data, "test", "Subject_test.txt"),header = FALSE)
Subjecttrain<- read.table(file.path(path_data, "train" , "Subject_train.txt"),header = FALSE)

#C-Merging data sets together for each of Activity/Features/Subject (training and test) 
#combining data frame by row for each category (Activity/Features/Subject)
Activitydata<- rbind(Activitytrain, Activitytest)
Featuresdata<- rbind(Featurestrain, Featurestest)
Subjectdata <- rbind(Subjecttrain, Subjecttest)

#D-Assigning names to each category of combined data frame above
names(Activitydata)<- c("Activity")
names(Subjectdata)<- c("Subject")

FeaturesNames<- read.table(file.path(path_data, "features.txt"),head= FALSE)
#names(Featuresdata)<- Features$V2
names(Featuresdata)<- FeaturesNames$V2
#str(Featuresdata)  Features data frame $ v2 needed (refer to Features data frame structure)
#'data.frame':	561 obs. of  2 variables:
#'$ V1: int  1 2 3 4 5 6 7 8 9 10 ...
#$ V2: Factor w/ 477 levels "angle(tBodyAccJerkMean),gravityMean)",..: 243 244 245 250 251 252 237 238 239 240 .

#E-Get one data farme set by merging Activitydata & Subjectdata with Features $V2
Combdata<- cbind(Subjectdata, Activitydata)
Combineddata<- cbind(Featuresdata, Combdata)
#----here ok 
#F-Extracting needed measurments (mean & std deviation) 

subFeaturesNames<- FeaturesNames$V2[grep("mean\\(\\)|std\\(\\)",FeaturesNames$V2)]

# subset data 
selectedNames<- c(as.character(subFeaturesNames), "Subject", "Activity")
Combineddata<- subset(Combineddata, select=selectedNames)

#Replace labels with descriptions in gathered data (Combineddata DF) from activity_labels file
Labelactivity <- read.table(file.path(path_data, "activity_labels.txt"),header = FALSE)

names(Combineddata)<-gsub("^t", "time", names(Combineddata))
names(Combineddata)<-gsub("^f", "frequency", names(Combineddata))
names(Combineddata)<-gsub("Acc", "Accelerometer", names(Combineddata))
names(Combineddata)<-gsub("Gyro", "Gyroscope", names(Combineddata))
names(Combineddata)<-gsub("Mag", "Magnitude", names(Combineddata))
names(Combineddata)<-gsub("BodyBody", "Body", names(Combineddata))

#----------------------------------------

#independent tidy data set creation based on last DF (Combineddata) in the previous step above 

FinalData<- aggregate(. ~Subject + Activity, Combineddata, mean)
write.table(FinalData, file = "C:/Users/mbouras/Desktop/Rprog/mod3//Dataset/tidydata.txt",row.name=FALSE) 

