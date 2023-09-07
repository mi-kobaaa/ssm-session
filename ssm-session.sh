#!/bin/bash

TARGET_INSTANCE_ID=""
PROFILE_OPTION=""
REGION="ap-northeast-1"

RDP_OPTION=""
USE_RDP=false

while getopts "t:p:r:w" opt; do
  case $opt in
    t)
      TARGET_INSTANCE_ID=$OPTARG
      ;;
    p)
      PROFILE_OPTION="--profile $OPTARG"
      ;;
    r)
      REGION=$OPTARG
      ;;
    w)
      USE_RDP=true
      ;;
    *)
      echo "Usage: $0 [-t target_instance_id] [-p profile_name] [-r region] [-w]"
      exit 1
      ;;
  esac
done

if [ "$USE_RDP" = true ]; then
  RDP_OPTION="--document-name AWS-StartPortForwardingSession --parameters portNumber=3389,localPortNumber=13389"
fi

if [ -z "$TARGET_INSTANCE_ID" ]; then
    read -p "Please enter the target instance ID: " TARGET_INSTANCE_ID
fi

aws ssm start-session --target $TARGET_INSTANCE_ID \
$RDP_OPTION \
--region $REGION \
$PROFILE_OPTION
