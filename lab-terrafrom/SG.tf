resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = aws_vpc.main.cidr_block
  from_port         = 22
  ip_protocol       = "ssh"
  to_port           = 22
}



resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.allow_ssh.id
  cidr_ipv4         = aws_vpc.myvpc.cidr_block
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_ports" {
  security_group_id = aws_security_group.allow_ports.id
  cidr_ipv4         = aws_vpc.myvpc.cidr_block
  from_port         = 3000
  ip_protocol       = "tcp"
  to_port           = 3000
}