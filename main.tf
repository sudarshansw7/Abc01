module "security_group" {
  source              = "./security-group"
  ec2_sg_name         = "SG for EC2 to enable SSH(22), HTTPS(443) and HTTP(80)"
  ec2_jenkins_sg_name = "Allow port 8080 for jenkins"
}

module "jenkins" {
  source         = "./ec2"
  ami_id         = var.ec2_ami_id
  instance_type  = "t2.medium"
  tag_name       = "Jenkins:Ubuntu Linux EC2"
  sg_for_jenkins = [module.security_group.sg_ec2_sg_ssh_http_id]

}
