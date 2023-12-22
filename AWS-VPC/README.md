# VPC's
Shared with everyone else using the public clou, there is a default VPC created in every region.
Like having oyur own apartement in a building by default. You get it automatically. Like a shared flat.
# Subnets
## ![subnets](image.png)
Subnets are like rooms in a flat/apartement, in the ireland region in hte default VPC there are 3 subnet rooms, a,b and c. Each subnet is its own availability zone. Availability, if one fails the others still work, it provides redundancy and is part of disaster recovery. Each avaialbilty zone is its own data centre with its own CPU's centre etc.
You can decide whether these are public or private, by default they are all public. This is undesireable.
The database needs to be private, you want the best security for the databases, GDPR etc.
## ![Alt text](image-1.png)
## ![Alt text](image-2.png)
# order of work
##
- vpc
- subnet
- gateway
- public route table
- asoc to subnet
- asoc to gateway
- check vpc
- create db
- create app

set availability zones for subnets, assign different zones west,1ca

security group is associated with a VPC
the default one
