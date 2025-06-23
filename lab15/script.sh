# Create keypair and change permission
aws ec2 create-key-pair --key-name MyTFKeyPair --query 'KeyMaterial' --output text > MyTFKeyPair.pem
chmod 700 MyTFKeyPair.pem
ls -ld MyTFKeyPair.pem
# Cleanup after the lab
#aws ec2 delete-key-pair --key-name MyTFKeyPair
#rm -f MyTFKeyPair.pem

