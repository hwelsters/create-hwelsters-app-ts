<p align="center">
	<img src="https://user-images.githubusercontent.com/84760072/223321151-8b77a57a-ad72-48df-a34c-7e031a6c7ff2.png" width="600"/>
</p>

REQUIREMENTS  
Terraform configured with S3 buckets and RDS / DynamoDB that will be "plugged" into the backend  
 NOTE: Utilize strict IAM policies

Key ideas 💡:

- Ideally, we will only have to call `terraform apply` and it will deploy everything.
- Ideally, for local development, we will only have to call `docker-compose -f docker-compose.local.yml up --build` and it will just work.
- I also want full test-coverage. Ideally, we take images of databases to speed up testing.
- Full E2E testing with cypress using docker containers to spin up database instances for testing and then tear them down.

TODO:

- [🦜] Maybe make a python script or something that generates all the TF files needed to deploy every function in the `./lambda` folder. Python should work on all OS's so I kinda prefer it over Bash 😵 rn.
- [🦆] Configure Prisma on backend
- [🦆] Docker Compose with e2e testing + database
- [🦆] Express import aliasing
- [🦆] Set up grpc? or rest. I dunno which one I should do. How bout both on different branches? Nah, Imma do REST.
- [🦆] Input validation on backend?
- [🦜] Change backend tests to run on multi-stage built containers similar to production environment
- [🦜] Provision ECR with Terraform
- [🦜] Push automatically to ECR using Github Actions
- [🦜] NGINX
- [🦜] File storage
- [🦜] 3 tier architecture as specified by Medium post (VPCs look kinda expensive so I'm not gonna do this anymore)
- [🦜] S3 Terraform Provisioning + Service Discovery on backend
- [🦜] S3 File upload with public read access / for public folder
- [🦜] S3 --> CDN
- [🦜] Provision RDS with PostgresSQL
- [🦜] Set up E2E testing + containerize tests with Cypress

USEFUL LINKS:
- Deploying ECS resources using Docker Compose:		https://docs.docker.com/cloud/ecs-integration/
- Incompatible Docker Compose file			  :		https://stackoverflow.com/questions/63385177/docker-compose-file-is-incompatible-with-amazon-ecs