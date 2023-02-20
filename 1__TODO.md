REQUIREMENTS  
Terraform configured with S3 buckets and RDS / DynamoDB that will be "plugged" into the backend  
    NOTE: Utilize strict IAM policies

Key ideas 💡:  
    - Ideally, we will only have to call `terraform apply` and it will deploy everything.  
    - Ideally, for local development, we will only have to call `docker-compose -f docker-compose.local.yml up --build` and it will just work.  
    - I also want full test-coverage. Ideally, we take images of databases to speed up testing.  
    - Full E2E testing with cypress using docker containers to spin up database instances for testing and then tear them down.  


Few questions to answer:  
    - Do I use Prisma as an ORM or just pure SQL?  

TODO:
[🦜] Use Prisma on backend
[🦜] Docker Compose with e2e MySQL database testing  
[🦜] Terraform with Docker compose  
[🦜] Maybe make a python script or something that generates all the TF files need to create all the .tf files needed to deploy every function in the `./lambda` folder
[🦜] CDN + HTML caching for ⚡ speedy page-loads