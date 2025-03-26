# SeatCatcher-Infra
Seat-Catcher AWS Infrastructure management repository

## Considerations
- We have to reduce cost as much as possible -> Minimum cost but easy to use in development
- We don't consider high availability and failover in the dev environment

## Architecture Diagram
- Updating...

## HOW TO RUN

### Typical Terraform Workflow
1. **Initialize the backend**:
   ```bash
   terraform init -backend-config={env}_backend.hcl
   ```

2. **Check the execution plan**:
   ```bash
   terraform plan -var-file={env}.tfvars
   ```

3. **Apply the changes**:
   ```bash
   terraform apply -var-file={env}.tfvars
   ```

4. **Destroy resources (if needed)**:
   ```bash
   terraform destroy -var-file={env}.tfvars
   ```

### Notes
- Replace `{env}` with the appropriate environment (e.g., `dev`, `prod`, `global`).
- Always review the `PLAN` logs carefully before applying changes.
- Ensure your AWS credentials are securely managed in your console (e.g., using environment variables or AWS CLI profiles).
    - If AWS credentials are not configured properly, s3 related error occurs.

### S3 Backend Configuration
- Terraform state is stored in an S3 bucket. Ensure the bucket is properly configured with the correct permissions.
- Example `backend.hcl`:
  ```hcl
  bucket = "bucket_name"
  key    = "state_file_key_name"
  region = "ap-northeast-2"
  ```

- To reconfigure the backend:
  ```bash
  terraform init -reconfigure -backend-config={env}_backend.hcl
  ```

### Security Best Practices
- Do not hardcode sensitive information (e.g., AWS access keys) in `.tfvars` or code files.
- Use environment variables or AWS CLI profiles to manage credentials securely.
- But we used tfvars files in managing sensitive information. Be aware of it!!
