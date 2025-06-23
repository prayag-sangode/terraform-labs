sudo snap install aws-cli --classic
aws s3 mb s3://tfstate-bucket19159 --region us-east-1
# aws s3 rm s3://tfstate-bucket19159/terraform.tfstate
# aws s3 rb s3://tfstate-bucket19159

