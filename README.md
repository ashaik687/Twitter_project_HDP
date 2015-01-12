Twitter Project for Finding Most Influential Person and Sentiment Analysis of a Movie
 
 Development Environment : HortonWorks Sandbox HDP 2.1
 
 Twitter JSON Data ------> Flume ------->  Hive  -------> Perform Analysis
 
 
 WORK FLOW TO LOAD DATA INTO HDFS USING FLUME

Step 1 : Install Flume in HDP 
Step 2 : Setup a Source for Flume in this case TwitterSource 
Step 3 : Take the Access Keys from Twitter and assign them to twitter.conf file
Step 4 : Setup the specific location for Sink and Channel for Flume in twitter.conf file
Step 5 : Start the Flume Agent
Step 6 : RAW JSON data will be stored in HDFS 

WORK FLOW TO PERFORM SENTIMENTAL ANALYSIS OF MOVIE

Step 1 : Upload the two files dictionary.tsv  and   time_zone_map.tsv into HDFS 
 	 	-->dictionary file acts as a dictionary to analyze which word is positive and which is negative
 	 	--> time map file gives the location of the person so that we can analyze which county is positive on the 			movie
Step 2 : Run the hive script  

WORK FLOW TO PERFORM INFLUENTIAL PERSON USING HIVE BY MAX RETWEETS
 
 Step 1 : I have used a default jar file provided by HDP to work on JSON data collected above
 Step 2 : Run the specified queries in HIVE folder 

WORK FLOW TO PERFORM PARTITIONS BASED ON SENTIMENTAL ANALYSIS of positive negative and neutral

 Step 1 : In the Hive script While creating the table we have to specify by the partitioning column and criteria for partitioning 
