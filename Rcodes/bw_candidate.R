# Exercise: Collecting user objects of the candidates and their friends

library(foreign)
library(rtweet)

# read fine
cand <- read.csv2("ZA7721_v2-0-0.csv/ZA7721_v2-0-0.csv", 
                   colClasses = c("user_id1" = "character",
                                  "user_id2" = "character"))


# Change all "" to NA
cand[cand==""] <- NA

# check the data
dim(cand)
View(cand)

# Extract user id of BW candidates, incumbent
bw <- subset(cand, (cand$state == "BW" & cand$incumbent == 1))
bw_id <- subset(bw$user_id1, !is.na(bw$user_id1))


# Check how many ids are there
length(bw_id)

# Get user object of them
bw_user_obj <- lookup_users(bw_id)
dim(bw_user_obj) # we collected 67 user objects. 


# Get friends
bw_id_67 <- bw_user_obj$user_id # create a vector containing user_id
bw_67user_friends <- get_friends(bw_id_67, retryonratelimit = TRUE) # This code takes about an hour

# save data
save(bw_user_obj, bw_67user_friends, file = "bw_user_friends.RData")



