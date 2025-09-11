resource "aws_vpc" "pro_vpc" {
    cidr_block = var.vpc_cidr
    enable_dns_support = true
    enable_dns_hostnames = true
    tags = {
        name = "${var.environment}-vpc"
    }
}

resource "aws_subnet" "pub_subnets" {
    count = length(var.pub_cidr)
    vpc_id = aws_vpc.pro_vpc.id
    cidr_block = element(var.pub_cidr, count.index)
    map_public_ip_on_launch = true
    availability_zone = element(var.az, count.index)

    tags = {
        name = "${var.environment}-Pub-Subnet-&{count.index + 1}"
    }

}

resource "aws_subnet" "pri_subnets" {
    count = length(var.pri_cidr)
    vpc_id = aws_vpc.pro_vpc.id
    cidr_block = element(var.pri_cidr, count.index)
    map_public_ip_on_launch = false
    availability_zone = element(var.az, count.index)

    tags = {
        name = "${var.environment}-Pri-Subnet-&{count.index + 1}"
    }

}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.pro_vpc.id

    tags = {
        Name = "${var.environment}-igw"
        
    }
}

resource "aws_route_table" "public_route" {
    vpc_id = aws_vpc.pro_vpc.id
    
    tags = {
        name = "${var.environment}-PublicRoutetable"
    }
}


resource "aws_route_table" "private_route" {
    vpc_id = aws_vpc.pro_vpc.id

    tags = {
        name = "${var.environment}-PrivateRoutetable"
    }
}

resource "aws_route" "public_internet_access" {
    route_table_id         = aws_route_table.public_route.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id             = aws_internet_gateway.igw.id

}

resource "aws_route_table_association" "public_subnet_association" {
    count = length(aws_subnet.pub_subnets)
    subnet_id = element(aws_subnet.pub_subnets.*.id, count.index)
    route_table_id = aws_route_table.public_route.id
}


resource "aws_route_table_association" "pri_subnet_association" {
    count = length(aws_subnet.pri_subnets)
    subnet_id = element(aws_subnet.pri_subnets.*.id, count.index)
    route_table_id = aws_route_table.private_route.id
}
