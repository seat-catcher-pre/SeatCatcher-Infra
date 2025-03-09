variable "region" {
  description = "AWS Region"
  type        = string
  default     = "ap-northeast-2"
}

variable "ami" {
  description = "EC2 인스턴스에 사용할 AMI ID"
  type        = string
}

variable "instance_type" {
  description = "EC2 인스턴스 타입"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "EC2 인스턴스를 배포할 서브넷 ID"
  type        = string
}

variable "instance_name" {
  description = "인스턴스 이름 태그"
  type        = string
}

variable "additional_tags" {
  description = "추가 태그"
  type        = map(string)
}
