# Make sure key pairs generated
ssh-keygen -t rsa
ls -ld ~/.ssh/id_rsa*

# Make sure aws s3 bucket is created to store tfstate
sudo snap install aws-cli --classic
aws s3 mb s3://tfstate-bucket19159 --region us-east-1
