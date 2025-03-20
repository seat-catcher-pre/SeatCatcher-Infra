# SeatCatcher-Infra
Seat-Catcher AWS Infrastructure management repository

## Considerations
- To create micro instance in naver cloud, You have to specify **fee_system_type_code = "FXSUM"** on your server resource block
- Set up remote backend ncloud object storage to manage terraform.tfstate -> see below "HOW TO RUN"
- After create postgreSQL Server, you have to create "seat_catcher" schema to apply JPA Hibernate into database.

```sql
create schema seat_catcher;
```

## Architecture Diagram
![image](https://github.com/user-attachments/assets/91cffc2e-a522-4b69-ab58-9a9906396374)

## HOW TO RUN

- The backend.hcl file is private. Request it to backend developers
- The dev.tfvars file is private. Request it to backend developers
- See carefully "PLAN" logs when you modify cloud architecture

```terraform
terraform init -backend-config=backend.hcl
terraform fmt # arrange terraform files format
terraform validate # Verify if configured terraform file syntax is validate
terraform plan -var-file=dev.tfvars
terraform approve -var-file=dev.tfvars
```
