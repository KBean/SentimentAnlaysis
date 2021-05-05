library(dataiku)

# Recipe inputs
airline_tweets_unique <- dkuReadDataset("airline_tweets_unique", samplingMethod="head", nbRows=100000)

# Compute recipe outputs from inputs
# TODO: Replace this part by your actual code that computes the output, as a R dataframe or data table
sentiment <- airline_tweets_unique # For this sample code, simply copy input to output


# Recipe outputs
dkuWriteDataset(sentiment,"sentiment")
