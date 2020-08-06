for regions in `aws ec2 describe-regions --output text|awk {'print $3'}`
do
   for instance in `aws ec2 describe-instances --region $regions --query 'Reservations[].Instances[].[InstanceId]' --filter Name=ip-address,Values=67.202.27.159`
    do
 echo $regions" "$instance
 done
done