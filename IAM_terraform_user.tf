
# Create IAM User

resource "aws_iam_user" "terraform_user" {
  name = "terraform-user"
}




# Attach AdministratorAccess Policy (Change policy if needed)

resource "aws_iam_user_policy_attachment" "admin_access" {
  user       = aws_iam_user.terraform_user.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}



# Create Access Key for the User

resource "aws_iam_access_key" "terraform_user_key" {
  user = aws_iam_user.terraform_user.name
}



# Output the Access Key (Secret Key is sensitive and not shown)


output "aws_access_key" {
  value = aws_iam_access_key.terraform_user_key.id
}



# Store Secret Key in a Secure Location (Use AWS Secrets Manager for production)

output "aws_secret_key" {
  value     = aws_iam_access_key.terraform_user_key.secret
  sensitive = true  # This prevents the secret from being displayed in logs
}
            