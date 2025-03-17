# AWS IAM User Provisioning with Terraform

## Overview

This Terraform script automates the creation of an **AWS IAM User** with an **AdministratorAccess** policy and generates an **Access Key** for programmatic access.

⚠️ **Warning:** Assigning `AdministratorAccess` grants full permissions to AWS resources. Consider using **least privilege** policies for better security.

---

## Features

- ✅ **Creates a new IAM user** named `terraform-user`
- ✅ **Attaches an IAM policy** (`AdministratorAccess` by default)
- ✅ **Generates an access key** for the user
- ✅ **Outputs the access key ID** (but keeps the secret key secure)

---

## Prerequisites

Before running this script, ensure you have:

- **Terraform installed** ([Install Guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli))
- **AWS CLI installed and configured** (`aws configure`)
- **Proper IAM permissions** to create users and policies

---

## Usage

### 1️⃣ Clone the Repository

```sh
git clone https://github.com/harris-97/IAM-user-Terrafrom
cd IAM-user-Terrafrom
```

### 2️⃣ Initialize Terraform

```sh
terraform init
```

### 3️⃣ Validate the Configuration

```sh
terraform validate
```

This ensures that the Terraform code is syntactically correct and properly formatted.

### 4️⃣ Plan the Deployment

```sh
terraform plan
```

This will display the resources Terraform intends to create.

### 5️⃣ Apply the Configuration

```sh
terraform apply -auto-approve
```

Terraform will create the IAM user and output the **Access Key ID** (Secret Key is hidden for security).

### 6️⃣ View the Secret Key (if needed)

Since the secret key is marked as **sensitive**, it won't be displayed in the standard output. To view it, run:

```sh
terraform show
```

This will show the full Terraform state, including sensitive outputs.

### 7️⃣ Secure the Secret Key

- The **AWS Secret Key** should be stored in **AWS Secrets Manager** or a **secure vault**.
- **DO NOT** hardcode credentials in your code or commit them to GitHub!

### 8️⃣ Destroy Resources (Optional)

If you need to remove the IAM user and keys:

```sh
terraform destroy -auto-approve
```

---

## Outputs

| Name             | Description                                     |
| ---------------- | ----------------------------------------------- |
| `aws_access_key` | The Access Key ID (use this for authentication) |
| `aws_secret_key` | The Secret Access Key (hidden for security)     |

---

## Security Considerations

- 🔐 **Use IAM roles instead of access keys** whenever possible.
- 🛑 **Restrict access policies** to only required actions.
- 📌 **Enable MFA (Multi-Factor Authentication)** for better security.
- 📜 **Rotate access keys regularly** to reduce security risks.

---

## Troubleshooting

### ❌ Error: `No valid credential sources found`

**Solution:** Ensure your AWS credentials are configured properly:

```sh
aws configure
```

### ❌ Error: `Access Denied`

**Solution:** Verify that your IAM role has permissions to create users and manage policies.

---

## References

- [Terraform AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [AWS IAM Best Practices](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html)

📌 Maintained by: harris-97

