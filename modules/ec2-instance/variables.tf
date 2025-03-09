variable "ami" {
  description = "EC2 인스턴스에 사용할 AMI ID"
  type        = string
}

variable "instance_type" {
  description = "EC2 인스턴스 타입"
  type        = string
}

variable "subnet_id" {
  description = "인스턴스를 배포할 서브넷 ID"
  type        = string
}

variable "instance_name" {
  description = "인스턴스 이름 태그"
  type        = string
}

variable "tags" {
  description = "추가 태그 (map 형태)"
  type        = map(string)
  default     = {}
}
