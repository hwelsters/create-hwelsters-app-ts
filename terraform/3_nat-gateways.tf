resource "aws_nat_gateway" "gw" {
  count         = length(aws_subnet.public_subnets)
  allocation_id = aws_eip.nat_ip[count.index].id
    subnet_id = aws_subnet.
}
