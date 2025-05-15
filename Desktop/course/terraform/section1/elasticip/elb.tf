
# resource "aws_security_group" "sec" {
#     name = "allow_tls"
#     description = "Allow tls inbound traffic"

# ingress {
#     description ="Tls from VPC"
#     from_port=443
#     to_port=443
#     protocol="tcp"
#     cidr_blocks = ["${aws_eip.el.public_ip}/32"]

 
# }
#  tags ={
#      Name ="allow_tls"
# }
# }
resource "aws_eip" "eip" {
    domain = "vpc"
}
resource "aws_nat_gateway" "nat" {
    allocation_id = aws_eip.eip.id
    subnet_id = "subnet-0f9905c35773e5d17"
    tags = {
      Name="nattt"
    }
}
resource "aws_iam_user" "dolfined_i" {
  name = "dolfined_assignment2"
}
output "ffff" {
  value = aws_eip.eip.public_ip
 description = "fffadfsdffa"
}
output "ggg" {
   value=aws_nat_gateway.nat.id
}
output "user" {
    value = aws_iam_user.dolfined_i.arn
}