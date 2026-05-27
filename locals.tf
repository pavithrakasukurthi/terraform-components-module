locals {
    common_name = "${var.project}-${var.environment}"
    ami_id = data.aws_ami.ami_id.id
    sg_id = data.aws_ssm_parameter.sg_id.value
    private_subnet_id = split(",", data.aws_ssm_parameter.private_subnet_ids.value)[0]
    private_subnet_ids = split(",", data.aws_ssm_parameter.private_subnet_ids.value)
    tg_port = "${var.component}" == "frontend" ? 80 : 8080
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    health_check_path = "${var.component}" == "frontend" ? "/" : "/health"
    frontend_alb_listener_arn = data.aws_ssm_parameter.frontend_alb_listener_arn.value
    backend_alb_listener_arn = data.aws_ssm_parameter.backend_alb_listener_arn.value
    listener_arn = "${var.component}" == "frontend" ? frontend_alb_listener_arn : backend_alb_listener_arn
    context_path = "${component}" == "frontend" ? "${var.project}-${var.environment}.${var.domain_name}" : "${var.component}.backend-alb-${var.environment}.${var.domain_name}"
    common_tags = {
        Project = var.project
        Environment = var.environment
        Terraform = true
    }
}