# SeatCatcher-Infra
Seat-Catcher AWS Infrastructure management repository

## Considerations
- We have to reduce cost as many as possible -> Minimum cost but easy to use in development
- We don't consider about high availability and failover in dev enviroment

## Architecture Diagram
- Updating...

## HOW TO RUN

- See carefully "PLAN" logs when you modify cloud architecture

```terraform
# terraform reconfigure
terraform init -reconfigure -backend-config=backend.hcl

# if any changes in modules,
terraform init -backend-config=backend.hcl
```
## How can i create Public key for SSH connection?
```bash
# -t: Type of encrypt
# -b: # of bits
# -C: comment
# -f: save path
# -N: encrypt option
ssh-keygen -t rsa -b 4096 -C "" -f "{path-to-save-key}/{any-name}" -N ""
```
