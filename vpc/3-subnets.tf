resource "aws_subnet" "private" {
  for_each = var.private_subnets

  vpc_id            = aws_vpc.this.id
  cidr_block        = each.key
  availability_zone = each.value

  tags = merge(
    {
      Name = "${var.env}-private-${each.value}"
    },
    var.private_subnet_tags
  )
}

resource "aws_subnet" "public" {
  for_each = var.public_subnets

  vpc_id            = aws_vpc.this.id
  cidr_block        = each.key
  availability_zone = each.value

  tags = merge(
    {
      Name = "${var.env}-public-${each.value}"
    },
    var.public_subnet_tags
  )
}