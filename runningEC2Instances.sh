set -x
for regions in `aws ec2 describe-regions --output text|awk {'print $3'}`
do
   for instances in `aws ec2 describe-instances --region $regions --query 'Reservations[*].Instances[*].[InstanceId,Tags[*]]'  --output json > AllregionEC2Instance$regions.json`
#for instances in `aws ec2 describe-instances --query 'Reservations[*].Instances[*].Tags[2].[Value]' --filters Name=instance-state-name,Values=running --output text --region $regions --output text
    do
 echo $instances
 done
done