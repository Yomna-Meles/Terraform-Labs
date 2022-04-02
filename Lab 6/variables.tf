variable "ami"{
    description = "ami of Ec2"
    type = string 
    default = "instance-1"


}

variable " instance_type"{
    description = "Type of Ec2"
    type = string 
    default = "instance-1"


}

variable "key_name"{
    description = "key"
    type = string 
    default = "instance-1"



}

variable "security_group"{
    description = "sg"
    type = string 
    default = "instance-1"



}