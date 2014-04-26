## read in files from the test and train subdirectories
activities = read.table('activity_labels.txt', header = F,stringsAsFactors=FALSE)
features = read.table('features.txt', header = F,stringsAsFactors=FALSE)
train_act = read.table('train/y_train.txt', header = F)
train_subs = read.table('train/subject_train.txt', header = F)
train_x = read.table('train/X_train.txt', header = F)
train_y = read.table('train/Y_train.txt', header = F)
test_act = read.table('test/y_test.txt', header = F)
test_subs = read.table('test/subject_test.txt', header = F)
test_x = read.table('test/X_test.txt', header = F)
test_y = read.table('test/Y_test.txt', header = F)

## combine test and train dataframes
Data <- rbind(cbind(train_subs,train_act,train_x),
              cbind(test_subs,test_act,test_x))

## add column names from features dataframe
names(Data) <- c("subject",'activity',features[,2])

## convert the activity numbers into string labels
Data$activity <- factor(Data$activity, levels = c(1:6), labels = activities[,2])

tidy_Data = Data[,c(1,2, grep('mean\\()',names(Data)), grep('std()',names(Data)))]

## create a text file containing the tidy_data set
write.table(tidy_Data, "tidy.txt", row.names = FALSE)

## use metl to take means of the means and standard deviations for suject and activity
## melt data frame
tidy_two <- melt(tidy_Data, id=c("subject", "activity"))

## split data frame and return results
tidy_means <- ddply(tidy_two, .(subject, activity, variable), summarize,  value = mean(value))

## cast data into data frame
tidy_final <- dcast(tidy_means, subject + activity ~ variable)