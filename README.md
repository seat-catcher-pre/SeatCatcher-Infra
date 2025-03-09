# SeatCatcher-Infra
Seat-Catcher AWS Infrastructure management repository

## Infrastructure configuration considerations

- Rather than focusing on high availability and performance, we prioritized cost efficiency to fully utilize the free tier.
- For example, in our production VPC, we configured a private subnet to secure our API application and database. However, an issue arises when the API application needs to call external API services, such as OpenAI, SaaS API, Govern-API, etc.
- To allow connectivity from the private subnet to the public internet, we need to use a NAT gateway. However, its cost is very high for us (we are undergraduate students, by the way), so we have to use a NAT instance to take advantage of the free tier.
- Additionally, we use the t2.micro instance type and the Amazon Linux 2023 AMI, both of which are included in the free tier.
- If our service experiences high demand, such as a large number of network requests and responses, we will improve our infrastructure to be more highly available and scale both vertically and horizontally.

## Configuration Plan
![image](https://github.com/user-attachments/assets/beb98846-46c0-4759-a20b-58a25dabd90b)
