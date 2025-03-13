#!/bin/bash

# Prompt user for inputs
read -p "Enter the image ID (Visit: https://cloud-images.ubuntu.com/locator/ec2/): " IMAGE_ID
read -p "Enter the number of instances you want to create: " COUNT
read -p "Enter the instance type: " INSTANCE_TYPE
read -p "Enter your key pair name: " KEY_NAME

# Validate user input
if [[ -z "$IMAGE_ID" || -z "$COUNT" || -z "$INSTANCE_TYPE" || -z "$KEY_NAME" ]]; then
    echo "Error: All fields are required. Please provide valid inputs."
    exit 1
fi

# Run AWS CLI command
aws ec2 run-instances --image-id "$IMAGE_ID" --count "$COUNT" --instance-type "$INSTANCE_TYPE" --key-name "$KEY_NAME"

# Capture exit status and print success or failure message
if [[ $? -eq 0 ]]; then
    echo "EC2 instance(s) created successfully!"
else
    echo "Error: Failed to create EC2 instance(s). Check your AWS CLI setup and inputs."
fi
 
