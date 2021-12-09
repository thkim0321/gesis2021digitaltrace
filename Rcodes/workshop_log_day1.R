
library(rtweet)

# timeline
bmu_tweets <- get_timeline("bmu", n = 3200) 
dim(bmu_tweets)

two_accounts <- c("bmu", "BMZ_Bund")
bmu_bmz_bund <- get_timeline(two_accounts, n = 3200)


# Exercise 
# Code from Klara
party_timeline <- get_timeline(c("AfD", "CDU", "spdde"), n = 3000)
save(party_timeline, file = "party_timeline.RData")
View(party_timeline)


# get followers
bmu_flw_ids <- get_followers("bmu", n = 1000)

# get friends
bmu_friend_ids <- get_friends("bmu")
dim(bmu_friend_ids)

# get user object
bmu_userob <- lookup_users("bmu")

users <- as.matrix(bmu_friend_ids)[,"user_id"] # create a vector containing a list of user ids
length(users)
bmu_friend_users <- lookup_users(users)



# Search tweets
t1 <- search_tweets(
  q = "covid", # search query
  n = 1000 # the total number of desired tweets to return. Defaults to 100. 
)

t3 <- search_tweets(
  q = "covid", # search query
  n = 1000, # the total number of desired tweets to return. Defaults to 100. 
  max_id = max_id
)

t4 <- rbind(t1, t3[-1,])

# Location
t10 <- search_tweets("covid", geocode = "53.147505,8.181818,100km")


# Exercise

scholz <- search_tweets(q = "@OlafScholz", type = "recent", n = 100)
e2 <- search_tweets(q = "to:OlafScholz", n = 50)
tweets <- search_tweets(q = "omicron impfung", 
                        lang = "de", 
                        since = "2021-12-7",
                        until = "2021-12-8")



# User activity streaming api

user <- lookup_users("RegSprecher") # Follow activity of the spokesman for the federal government in Germany 
user_id <- user$user_id
stream_follow <- stream_tweets(q = user_id, timeout = 60)


# Exercise
temp <- rtweet:::citycoords
ok <- grep("berlin", temp$city)
temp$city[ok]
berlin <- rtweet::lookup_coords(temp$city[43])
stream_berlin <- stream_tweets(berlin, timeout = 10)



