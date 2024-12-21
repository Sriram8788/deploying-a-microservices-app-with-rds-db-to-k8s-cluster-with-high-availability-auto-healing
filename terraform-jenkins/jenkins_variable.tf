variable "mykey" {
  description = "The SSH key name to use for the Jenkins EC2 instance."
  type        = string
}

variable "ami" {
  description = "The AMI ID to use for the Jenkins EC2 instance."
  type        = string
}

variable "region" {
  description = "The AWS region to deploy the resources in."
  type        = string
}

variable "instance_type" {
  description = "The instance type to use for the Jenkins EC2 instance."
  type        = string
}

variable "jenkins_server_secgr" {
  description = "The name of the security group for the Jenkins server."
  type        = string
}

variable "jenkins-server-tag" {
  description = "The tag to assign to the Jenkins EC2 instance."
  type        = string
}

variable "jenkins-profile" {
  description = "The name of the IAM instance profile to attach to the Jenkins EC2 instance."
  type        = string
}

variable "jenkins-role" {
  description = "The name of the IAM role to be used by the Jenkins EC2 instance."
  type        = string
}
