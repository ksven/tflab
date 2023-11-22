resource "aws_vpc" "main" {
  cidr_block = "10.10.0.0/16"
  tags = merge({
    Name = "${local.student}-vpc"
    },
  local.common_tags)
}

resource "aws_subnet" "public_subnet" {
  count             = length(var.public_cidr_block)
  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.public_cidr_block, count.index)
  availability_zone = element(data.aws_availability_zones.availability_zones.names, count.index)

  tags = merge({
    Name = "${local.student}-01-subnet-public-${element(var.availability_zones_index, count.index)}"
    },
    local.common_tags
  )
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = merge({
    Name = "${local.student}-01-igw"
    },
    local.common_tags
  )
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }


  tags = merge({
    Name = "${local.student}-01-rt"
    },
    local.common_tags
  )
}

data "aws_availability_zones" "availability_zones" {
  state = "available"
}

