###		Code Book for Course Project


This is a markdown format file. Please view in a browser, for
best reading experience and clarity.

-  As per project specifications, this code book modifies and updates 
the codebooks available with the orignal data to indicate all the 
variables and summaries calculated, along with units, and other 
relevant information.  Since the original dataset contains several 
code books, I have simplified the task of reading here, by 
bringing together, into one file, all the info in those codebooks. 

-  This codebook describes everything done, to arrive at the 
tidy dataset, which was the goal, as per specifications given.
The original dataset has been uploaded to GitHub, along with this
codebook, in *subdirectory called DataSet*. The description of 
various files in the original dataset is given in *README.md* file,
which accompanies this document.

-   Since this codebook builds on the information supplied with the
original document, we will refer to those files as necessary. This
is to save replication of information into this file. To locate
the files that are mentioned in this document, please see the
accompanying  *README.md* file, which has information about
how various files are connected to each other, within the DataSet.

-   If you are not familiar with this Samsung Galaxy phone related
dataset, please start by reading the file called *README.txt* that
is present as part of the dataset. You can find that file in this
repo, under the * subdirectory called Dataset*. The next file that
has important information is **features_info.txt** under the dataset.
This file describes the experiment and the meaning of the 561
variables (features) present in original dataset. The names of these
561 variables is given present in a file called *features.txt*.

-  As you can see from the two files mentioned above, the names of
the features are very cryptic. In addition, there is a typo in
variable names. The variables between lines 516 to 554 in 
*features.txt* file have **"BodyBody"** instead of the single **"Body"**
that is present is all the other variables. My program, called 
run **run_analysis.R**, corrects this mistake, as part of the
preparation of *Tidy Data*, which is the focus of this course.
The other error is the typo *extra ) *  in * features.txt* line 556 has 
also been corrected to read * angle(tBodyAccJerkMean,gravityMean) *.


###		 run_analysis.R 

The specification of this project and what this script does to 
prepare tidy data, is discussed in this section. The 5 step 
specification given in Project, along with information relevant
for that step, are presented  below:

1.   run_analysis.R merges the training and the test sets to   
	create one data set. The program creates a starting dataset
	with 10,299 observations, captured in 561 variables.
2.   run_analysis.R extracts only the measurements on the mean 
	and standard deviation for each measurement. I extracted
	the variables in *features.txt*,  which end with *mean() or
	std()*.  The correctness of this has been validated by
	course TA, Wendel Hope, in  [this forum]: https://class.coursera.org/getdata-005/forum/thread?thread_id=180
3.   run_analysis.R : Uses descriptive activity names to name the   
	activities in the data set. The *Activity* performed by a  
	person ( *Subject_id*, column in data) was in numbers. So,
	the program changes them to descriptive names which are
	provided in the file called *activity_labels.txt*.
4.   run_analysis.R ...Appropriately labels the data set with 
	descriptive variable names. All the variable names, which
	were difficult to read, have been changed in the tidy data
	I have produced. Since the objective of this entire project
	is to produce **Tidy Data**, it is appropriate for us to 
	perform all transformations in the dataset that is being 
	prepared by this program. You can see that the dataset 
	produced by this program contains *Human readable names*,
	which is part of the definition of *Tidy Data*.
5.   run_analysis.R....Creates a second, independent tidy data set
	with the average of each variable for each activity and 
	each subject. This step has been implemented by the program
	with just 3 lines of code. But it required enormous effort,
	because I had to read concepts that were not taught in the
	course, and R programming functions that were not properly
	described during the course. For example, i found the 
	function called *aggregate*  which was not discussed in
	class, but performs a transformation in one line of code.


###	Summary

-   The final tidy dataset that is prepared by the program is also the
return value of the function by the same name (run_analysis). It
contains  180 rows, each corresponding to a combination of the
variables *Activity and Subject_ID*. This tidy dataset contains
the *mean* of each variable, for a given combination of *Activity
and Subject_ID*.  Thus, this tidy dataset summarises all the 
data that was available in the original dataset.

-   The correctness of this tidy dataset has been discussed by 
both TAs of the class, in the same forum link given above. The 
code has been commented, in case you want to look through it.
Please read the markdown file called README.md for further info.

-   The variable names given in the original dataset, and the 
equivalent variable names in the new tidy dataset are given below,
as the last item in this Code Book, to avoid  boreddom in reading. Note
that I have mentioned mean() and std() terms at end of the variable name,
because those two were the items, extracted to form the tidy data.

	1. tBodyAcc-XYZ-mean() & std()		have been changed to
		Time_domain_Body_Acceleration_mean_Xaxis
		Time_domain_Body_Acceleration_mean_Yaxis
		Time_domain_Body_Acceleration_mean_Zaxis
		Time_domain_Body_Acceleration_std_Xaxis
		Time_domain_Body_Acceleration_std_Yaxis
		Time_domain_Body_Acceleration_std_Zaxis
	2. tGravityAcc-XYZ-mean() & std()		have been changed to
		Time_domain_Gravity_Acceleration_mean_Xaxis
		Time_domain_Gravity_Acceleration_mean_Yaxis
		Time_domain_Gravity_Acceleration_mean_Zaxis
		Time_domain_Gravity_Acceleration_std_Xaxis
		Time_domain_Gravity_Acceleration_std_Yaxis
		Time_domain_Gravity_Acceleration_std_Zaxis
	3. tBodyAccJerk-XYZ-mean() & std()		have been changed to
		Time_domain_Body_Acceleration_Jerk_mean_Xaxis
		Time_domain_Body_Acceleration_Jerk_mean_Yaxis
		Time_domain_Body_Acceleration_Jerk_mean_Zaxis
		Time_domain_Body_Acceleration_Jerk_std_Xaxis
		Time_domain_Body_Acceleration_Jerk_std_Yaxis
		Time_domain_Body_Acceleration_Jerk_std_Zaxis
	4. tBodyGyro-XYZ-mean() & std()		have been changed to
		Time_domain_Body_Gyroscope_mean_Xaxis
		Time_domain_Body_Gyroscope_mean_Yaxis
		Time_domain_Body_Gyroscope_mean_Zaxis
		Time_domain_Body_Gyroscope_std_Xaxis
		Time_domain_Body_Gyroscope_std_Yaxis
		Time_domain_Body_Gyroscope_std_Zaxis
	5. tBodyGyroJerk-XYZ-mean() & std()		have been changed to
		Time_domain_Body_Gyroscope_Jerk_mean_Xaxis
		Time_domain_Body_Gyroscope_Jerk_mean_Yaxis
		Time_domain_Body_Gyroscope_Jerk_mean_Zaxis
		Time_domain_Body_Gyroscope_Jerk_std_Xaxis
		Time_domain_Body_Gyroscope_Jerk_std_Yaxis
		Time_domain_Body_Gyroscope_Jerk_std_Zaxis
	6. tBodyAccMag-mean() & std()		have been changed to
		Time_domain_Body_Acceleration_Magnitude_mean_Xaxis
		Time_domain_Body_Acceleration_Magnitude_mean_Yaxis
		Time_domain_Body_Acceleration_Magnitude_mean_Zaxis
		Time_domain_Body_Acceleration_Magnitude_std_Xaxis
		Time_domain_Body_Acceleration_Magnitude_std_Yaxis
		Time_domain_Body_Acceleration_Magnitude_std_Zaxis
	7. tGravityAccMag-mean() & std()		have been changed to
		Time_domain_Gravity_Acceleration_Magnitude_mean_Xaxis
		Time_domain_Gravity_Acceleration_Magnitude_mean_Yaxis
		Time_domain_Gravity_Acceleration_Magnitude_mean_Zaxis
		Time_domain_Gravity_Acceleration_Magnitude_std_Xaxis
		Time_domain_Gravity_Acceleration_Magnitude_std_Yaxis
		Time_domain_Gravity_Acceleration_Magnitude_std_Zaxis
	8. tBodyAccJerkMag-mean() & std()		have been changed to
		Time_domain_Body_Acceleration_Jerk_mean_Xaxis
		Time_domain_Body_Acceleration_Jerk_mean_Yaxis
		Time_domain_Body_Acceleration_Jerk_mean_Zaxis
		Time_domain_Body_Acceleration_Jerk_std_Xaxis
		Time_domain_Body_Acceleration_Jerk_std_Yaxis
		Time_domain_Body_Acceleration_Jerk_std_Zaxis
	11.tBodyGyroJerkMag-mean() & std()		have been changed to
		Time_domain_Body_Gyroscope_mean_Xaxis
		Time_domain_Body_Gyroscope_mean_Yaxis
		Time_domain_Body_Gyroscope_mean_Zaxis
		Time_domain_Body_Gyroscope_std_Xaxis
		Time_domain_Body_Gyroscope_std_Yaxis
		Time_domain_Body_Gyroscope_std_Zaxis
	12. fBodyAcc-XYZ-mean() & std()		have been changed to
		Freq_domain_Body_Acceleration_mean_Xaxis
		Freq_domain_Body_Acceleration_mean_Xaxis
		Freq_domain_Body_Acceleration_mean_Xaxis
		Freq_domain_Body_Acceleration_std_Xaxis
		Freq_domain_Body_Acceleration_std_Xaxis
		Freq_domain_Body_Acceleration_std_Xaxis
	13. fBodyAccJerk-XYZ-mean() & std()		have been changed to
		Freq_domain_Body_Acceleration_Jerk_mean_Xaxis
		Freq_domain_Body_Acceleration_Jerk_mean_Yaxis
		Freq_domain_Body_Acceleration_Jerk_mean_Zaxis
		Freq_domain_Body_Acceleration_Jerk_std_Xaxis
		Freq_domain_Body_Acceleration_Jerk_std_Yaxis
		Freq_domain_Body_Acceleration_Jerk_std_Zaxis
	14. fBodyGyro-XYZ-mean() & std()		have been changed to
		Freq_domain_Body_Gyroscope_mean_Xaxis
		Freq_domain_Body_Gyroscope_mean_Yaxis
		Freq_domain_Body_Gyroscope_mean_Zaxis
		Freq_domain_Body_Gyroscope_std_Xaxis
		Freq_domain_Body_Gyroscope_std_Yaxis
		Freq_domain_Body_Gyroscope_std_Zaxis
	15. fBodyAccMag-mean() & std()		have been changed to
		Freq_domain_Body_Acceleration_Magnitude_mean_Xaxis
		Freq_domain_Body_Acceleration_Magnitude_mean_Yaxis
		Freq_domain_Body_Acceleration_Magnitude_mean_Zaxis
		Freq_domain_Body_Acceleration_Magnitude_std_Xaxis
		Freq_domain_Body_Acceleration_Magnitude_std_Yaxis
		Freq_domain_Body_Acceleration_Magnitude_std_Zaxis
	16. fBodyAccJerkMag-mean() & std()		have been changed to
		Freq_domain_Body_Acceleration_Jerk_Magnitude_mean_Xaxis
		Freq_domain_Body_Acceleration_Jerk_Magnitude_mean_Yaxis
		Freq_domain_Body_Acceleration_Jerk_Magnitude_mean_Zaxis
		Freq_domain_Body_Acceleration_Jerk_Magnitude_std_Xaxis
		Freq_domain_Body_Acceleration_Jerk_Magnitude_std_Yaxis
		Freq_domain_Body_Acceleration_Jerk_Magnitude_std_Zaxis
	17. fBodyGyroMag-mean() & std()		have been changed to
		Freq_domain_Body_Gyroscope_Magnitude_mean_Xaxis
		Freq_domain_Body_Gyroscope_Magnitude_mean_Yaxis
		Freq_domain_Body_Gyroscope_Magnitude_mean_Zaxis
		Freq_domain_Body_Gyroscope_Magnitude_std_Xaxis
		Freq_domain_Body_Gyroscope_Magnitude_std_Yaxis
		Freq_domain_Body_Gyroscope_Magnitude_std_Zaxis
	18. fBodyGyroJerkMag-mean() & std()		have been changed to
		Freq_domain_Body_Gyroscope_Jerk_Magnitude_mean_Xaxis
		Freq_domain_Body_Gyroscope_Jerk_Magnitude_mean_Yaxis
		Freq_domain_Body_Gyroscope_Jerk_Magnitude_mean_Zaxis
		Freq_domain_Body_Gyroscope_Jerk_Magnitude_std_Xaxis
		Freq_domain_Body_Gyroscope_Jerk_Magnitude_std_Yaxis
		Freq_domain_Body_Gyroscope_Jerk_Magnitude_std_Zaxis



