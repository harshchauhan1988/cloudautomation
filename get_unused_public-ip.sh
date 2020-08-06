for regions in `aws ec2 describe-regions --output text|awk {'print $3'}`
do
   for publicIP in `aws ec2 describe-addresses --region $regions  --query 'Addresses[?AssociationId==null]' --output text | awk '{print $3}'`
    do
 echo $regions" "$publicIP
 done
done