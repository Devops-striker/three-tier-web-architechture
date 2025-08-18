# File: main.tf (for routing)

# Create the public route table
resource "aws_route_table" "public" {
  vpc_id = var.vpc_id

  # Add a route for internet-bound traffic
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id
  }

  tags = {
    Name = "public-route-table"
    creation_mode = "terraform"
  }
}

# Associate all public subnets with the public route table
resource "aws_route_table_association" "public" {
  count          = length(var.public_subnet_ids)
  subnet_id      = var.public_subnet_ids[count.index]
  route_table_id = aws_route_table.public.id
}

# Private Route Table for AZ1
resource "aws_route_table" "private_az1" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = var.nat_gateway_ids[0]
  }

  tags = {
    Name = "private-az1-route-table"
    creation_mode = "terraform"
  }
}

# Private Route Table for AZ2
resource "aws_route_table" "private_az2" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = var.nat_gateway_ids[1]
  }

  tags = {
    Name = "private-az2-route-table"
    creation_mode = "terraform"
  }
}

# Associate private subnets with private route tables
resource "aws_route_table_association" "private_az1" {
  subnet_id      = var.private_subnet_ids[0]
  route_table_id = aws_route_table.private_az1.id
}

resource "aws_route_table_association" "private_az2" {
  subnet_id      = var.private_subnet_ids[1]
  route_table_id = aws_route_table.private_az2.id
}
