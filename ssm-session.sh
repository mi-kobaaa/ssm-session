#!/bin/bash

show_help() {
    echo "Usage: ssm-session [-t target_instance_id] [-p profile_name] [-r region] [-w] [-l local_port_number]"
    echo ""
    echo "Options:"
    echo "  -t    Specify the target instance ID."
    echo "  -p    Specify the AWS profile name."
    echo "  -r    Specify the AWS region. Default is 'ap-northeast-1'."
    echo "  -w    Use the options specific for Windows Remote Desktop."
    echo "  -l    Specify the localPortNumber. Default is '13389'."
    echo "  --help    Show this help message and exit."
}

TARGET_INSTANCE_ID=""
PROFILE_OPTION=""
REGION="ap-northeast-1"

RDP_OPTION=""
USE_RDP=false

while getopts "t:p:r:wl:h" opt; do
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
    l)
      LOCAL_PORT=$OPTARG
      ;;
    h|help)
      show_help
      exit 0
      ;;
    *)
      show_help
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
