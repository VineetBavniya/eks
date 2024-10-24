resource "aws_instance" "jenkins" {
  ami                         = data.aws_ami.ami.image_id
  instance_type               = var.instance.instance_type
  key_name                    = var.instance.key_name
  monitoring                  = true
  vpc_security_group_ids      = [aws_security_group.sg.id ]
  subnet_id                   = aws_subnet.public_subnet.id
  associate_public_ip_address = true
  availability_zone           = var.instance.availability_zone

  user_data = file("./jenkininstall.sh")

  tags = var.instance.tags

}