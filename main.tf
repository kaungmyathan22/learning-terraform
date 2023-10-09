provider "aws" {
    region="ap-southeast-1"
}

variable "cidr_blocks" {
    description= "cidr blocks and name tags for vpc and subnets "
    type = list(object({
        cidr_block=string
        name=string
    }))
}

variable "environment" {
    description= "deployment environment"
}

resource "aws_vpc" "development-vpc" {
    cidr_block = var.cidr_blocks[0].cidr_block
    tags = {
        Name :var.cidr_blocks[0].name
    }
}

resource "aws_subnet" "dev-subnet-1" {
    vpc_id = aws_vpc.development-vpc.id
    cidr_block = var.cidr_blocks[1].cidr_block
    availability_zone="ap-southeast-1a"
    tags = {
        Name :var.cidr_blocks[1].name
    }
}
