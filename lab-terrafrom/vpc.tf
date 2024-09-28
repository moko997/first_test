resource "aws_vpc" "myvpc" {
  cidr_block       = "10.0.0.0/16"
    
}

resource "aws_subnet" "public_subent" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.10.0/24"
}
resource "aws_subnet" "private_subent" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.11.0/24"
}


resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.myvpc.id

}

resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  route {
    cidr_block = "10.1.0.0/16"
    gateway_id = "local"
  }

}

resource "aws_route_table" "private_route" {
  vpc_id = aws_vpc.myvpc.id

  route {
    #gateway_id = aws_internet_gateway.gw.id
    cidr_block = "10.2.0.0/16"
    gateway_id = "local"
  }
}


resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.public_route.id
}

resource "aws_route_table_association" "b" {
  gateway_id     = aws_internet_gateway.gw.id
  route_table_id = aws_route_table.private_route.id
}