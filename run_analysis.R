#	Date:  July 23rd, 2014.
#
#	This is the R program for the Data Science course called
#	Getting And Cleaning Data. True to the title, this project 
#	involves downloading a real-world dataset and preparing a
#	tidy dataset from it. 
#
#	See README.md file in before execution of this program.
#	Note : Ignore the commented print statements. I left them there
#		purposefully, after debugging.
#	

run_analysis = function() {
	
	# ========================================================
	# Step 1: Merge the training and the test sets, found in
	# the respective sub-directories. Create one data set. This
	# brings together all available data points into one
	# single data frame, for easier processing.

	activity_column  = read.table("./train/y_train.txt", 
				     col.names = "Activity"  )
	subject_id_col   = read.table("./train/subject_train.txt", 
				     col.names = "Subject_id")
	data_column_names= read.table("./features.txt",
				      colClass = "character" )
	measurement_cols = read.table("./train/X_train.txt", 
				     col.names = 
				     data_column_names[ ,2]  )
	# View( measurement_cols[ 1:3 , c(1:3, 558:561) ] )

	# Now, merge all of the above data frames into one.
	# There are no character columns; so stringsAsFactors
	# not needed for cbind.
	training_dataset = cbind( activity_column,
				  subject_id_col,
				  measurement_cols )
	# repeat this to get test dataset.
	activity_column  = read.table("./test/y_test.txt", 
				     col.names = "Activity"  )
	subject_id_col   = read.table("./test/subject_test.txt", 
				     col.names = "Subject_id")
	measurement_cols = read.table("./test/X_test.txt", 
				     col.names = 
				     data_column_names[ ,2]  )
	# View(measurement_cols[ 1:3 , c(1:3, 558:561)
	# Now, merge all of the above data frames into one.
	testing_dataset  = cbind( activity_column,
				  subject_id_col,
				  measurement_cols )

	starting_dataset = rbind( training_dataset, testing_dataset )
	# print( "starting_dataset info : Notice 1 extra column for row.names")
	# print( class(starting_dataset) )
	# print( dim(starting_dataset) )

	# ========================================================
	# Step 2:  Extract only the measurements on the mean and 
	# standard deviation for each measurement. 
	# The words mean() or std() appear in the column names
	# if it is a column to be extracted.
	#
	# Note: spaces inside regex below would be wrong.
	#
	index_of_mean_stdev  <- grep( "(mean\\(\\))|(std\\(\\))"  
				      , data_column_names[ ,2]
				    ) # produces a index vector
	len = length( index_of_mean_stdev )
	#	print( "Number of mean() and std() features in features.txt = ")
	#	print( len   ) 
	#	print( "indices of features extracted from features.txt file = ")
	#	print( index_of_mean_stdev ) 
	# starting_dataset has 2 extra columns :
	# drop the first column for result, which has Activity
	# drop the 2nd column, which has subject
	# So, add 2 to ALL elements, to get the index in starting_dataset.
	mean_stdev_columns <- 2 + index_of_mean_stdev 
	mean_stdev_dataset <- starting_dataset[,c(1,2,mean_stdev_columns)]
	# View(mean_stdev_dataset)
	# View(mean_stdev_dataset[ c(1:2, 7351:7354, 10298:10299 )  ,]  ) 
	#      			 c(1:4, 67, 68)  ])
	# print( "mean_stdev_dataset info : ")
	# print( class(mean_stdev_dataset) )
	# print( dim  (mean_stdev_dataset) )

	# ========================================================
	# Step 3:  Use descriptive activity names to name the 
	# 	   activities in the data set - prepared above.
	#	   I continue with the dataset prepared in Step 2,
	#	   because this script's objective (and the stated
	#	   goal of this project) is to prepare a tidy dataset. 
	#
	mean_stdev_dataset[,1] = gsub("1","Walking",mean_stdev_dataset[,1],
				      ignore.case=FALSE,fixed=TRUE) 
	mean_stdev_dataset[,1] = gsub("2","Walking_Upstairs",mean_stdev_dataset[,1],
				     ignore.case=FALSE,fixed=TRUE) 
	mean_stdev_dataset[,1] = gsub("3","Walking_Downstairs",mean_stdev_dataset[,1],
				     ignore.case=FALSE,fixed=TRUE) 
	mean_stdev_dataset[,1] = gsub("4","Sitting",mean_stdev_dataset[,1],
				      ignore.case=FALSE,fixed=TRUE) 
	mean_stdev_dataset[,1] = gsub("5","Standing",mean_stdev_dataset[,1],
				      ignore.case=FALSE,fixed=TRUE) 
	mean_stdev_dataset[,1] = gsub("6","Laying",mean_stdev_dataset[,1],
				      ignore.case=FALSE,fixed=TRUE) 
	     
	
	# ========================================================
	#  Step 4: Appropriately labels columns with descriptive variable names. 
	#	   I continue with the dataset prepared in Step 2 and 3,
	#	   because this script's objective (and the stated
	#	   goal of this project) is to prepare a tidy dataset. 
	#
	# ========================================================


	# There is an error in the supplied features.txt file.
	# Inside some variable names, "BodyBody" appears instead of "Body"
	# So, first, tidy up the data, by removing the extra "Body".
	names(mean_stdev_dataset) = gsub("BodyBody", "Body", 
				    	 names(mean_stdev_dataset), 
					 ignore.case=FALSE)

	names(mean_stdev_dataset) = gsub("^tBodyAcc", "Time_domain_Body_Acceleration", 
				    	 names(mean_stdev_dataset), 
					 ignore.case=FALSE)
	names(mean_stdev_dataset) = gsub("^tBodyGyro", "Time_domain_Body_Gyroscope", 
				    	 names(mean_stdev_dataset), 
					 ignore.case=FALSE)
	names(mean_stdev_dataset) = gsub("^tGravityAcc", 
					 "Time_domain_Gravity_Acceleration", 
				    	 names(mean_stdev_dataset), 
					 ignore.case=FALSE)
	names(mean_stdev_dataset) = gsub("^fBodyAcc", "Freq_domain_Body_Acceleration", 
				    	 names(mean_stdev_dataset), 
					 ignore.case=FALSE)
	names(mean_stdev_dataset) = gsub("^fBodyGyro", "Freq_domain_Body_Gyroscope", 
				    	 names(mean_stdev_dataset), 
					 ignore.case=FALSE)
	names(mean_stdev_dataset) = gsub("^fGyro", "Freq_domain_Gyroscope", 
				    	 names(mean_stdev_dataset), 
					 ignore.case=FALSE)
	names(mean_stdev_dataset) = gsub("Jerk", "_Jerk", 
				    	 names(mean_stdev_dataset), 
					 ignore.case=FALSE)
	names(mean_stdev_dataset) = gsub("Mag", "_Magnitude", 
				    	 names(mean_stdev_dataset), 
					 ignore.case=FALSE)
	names(mean_stdev_dataset) = gsub("\\.X", "_Xaxis", 
				    	 names(mean_stdev_dataset), 
					 ignore.case=FALSE)
	names(mean_stdev_dataset) = gsub("\\.Y", "_Yaxis", 
				    	 names(mean_stdev_dataset), 
					 ignore.case=FALSE)
	names(mean_stdev_dataset) = gsub("\\.Z", "_Zaxis", 
				    	 names(mean_stdev_dataset), 
					 ignore.case=FALSE)
	names(mean_stdev_dataset) = gsub("\\.\\.", "", 
				    	 names(mean_stdev_dataset), 
					 ignore.case=FALSE)
	names(mean_stdev_dataset) = gsub("\\.", "_", 
				    	 names(mean_stdev_dataset), 
					 ignore.case=FALSE)
	
	
	# View(mean_stdev_dataset)
	# View(mean_stdev_dataset[ c(1:2, 7351:7354, 10298:10299 )  ,]  ,"Converted To") 
	#      			 c(1:4, 67, 68)  ], "Result-db")
	


	# ========================================================
	#  Step 5: Create a tidy data set with the average of each 
	#	   variable for each activity and each subject. 
	#	   The dataset created by Step 4, above is used here.
	# ========================================================

	# a subset of our data is given to aggregate, to get rid of
	# couple of unwanted columns that are generated by it. 
	# aggregate() does all the work, to generate the mean values.
	#
	tidydf <- aggregate(mean_stdev_dataset [ , 3:68 ] , 
			    by=list( mean_stdev_dataset$Activity , 
				    mean_stdev_dataset$Subject_id ) , 
			    FUN= mean)
	 names  ( tidydf ) [1] = "Activity"  # Change to meaningful names.
	 names  ( tidydf ) [2] = "Subject_ID"
	 return ( tidydf )
}

run_analysis()


