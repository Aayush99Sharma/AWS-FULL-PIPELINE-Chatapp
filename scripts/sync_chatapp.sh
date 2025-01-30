#!/bin/bash

# Step 1: Fetch the latest ZIP artifact from the S3 bucket
BUCKET_PATH="s3://codepipeline-eu-west-2-488300682273/chatapp-source-build/BuildArtif/"

# Get the most recent file
LATEST_FILE=$(aws s3 ls $BUCKET_PATH --recursive | sort | tail -n 1 | awk '{print $4}')

# Download the latest artifact to /tmp
aws s3 cp s3://codepipeline-eu-west-2-488300682273/$LATEST_FILE /tmp/

# Step 2: Unzip the downloaded file to /tmp
unzip -o /tmp/$(basename $LATEST_FILE) -d /tmp

# Step 3: Unzip the inner chatapp-build.zip file
unzip -o chatapp-build.zip

rsync -av --delete /tmp/AWS-FULL-PIPELINE-Chatapp/ /new_chatapp/
