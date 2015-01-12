--We can directly use the JsonSerDe jar present in Hive Hcatalog   ‘org.apache.hive.hcatalog.data.JsonSerDe’


--create the tweets_raw table containing the records as received from Twitter

CREATE EXTERNAL TABLE tweets_raw (
   id BIGINT,
   created_at STRING,
   source STRING,
   favorited BOOLEAN,
   retweet_count INT,
   retweeted_status STRUCT<
      text:STRING,
      user:STRUCT<screen_name:STRING,name:STRING>>,
   entities STRUCT<
      urls:ARRAY<STRUCT<expanded_url:STRING>>,
      user_mentions:ARRAY<STRUCT<screen_name:STRING,name:STRING>>,
      hashtags:ARRAY<STRUCT<text:STRING>>>,
   text STRING,
   user STRUCT<
      screen_name:STRING,
      name:STRING,
      friends_count:INT,
      followers_count:INT,
      statuses_count:INT,
      verified:BOOLEAN,
      utc_offset:STRING, -- was INT but nulls are strings
      time_zone:STRING>,
   in_reply_to_screen_name STRING,
   year int,
   month int,
   day int,
   hour int
)
ROW FORMAT SERDE 'org.apache.hive.hcatalog.data.JsonSerDe'
LOCATION '/user/flume/tweets'
;

-- To find more influential Person
CREATE VIEW tweets_influential AS
SELECT
  id,
  retweet_count
 FROM tweets_raw
  order by retweet_count DESC
  limit 10;
  
  

