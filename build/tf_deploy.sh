git fetch --prune --unshallow 2>/dev/null
CURRENT_VERSION=`git describe --abbrev=0 --tags 2>/dev/null`

echo "Current Version: $CURRENT_VERSION"


echo "git-tag=$CURRENT_VERSION" >> $GITHUB_OUTPUT

export TF_VAR_app_image_version=$CURRENT_VERSION

cd Terraform
terraform init
terraform plan
terraform apply -auto-approve

exit 0


