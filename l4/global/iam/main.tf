provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "example" {

    for_each = toset(var.user_names)
    name = each.value
}

output "all_users_arn" {
    value = values(aws_iam_user.example)[*].arn
    description = "The ARNs for all users"
}


output "upperNames" {
    value = [for name in var.user_names : upper(name) if length(name) < 5]
}

output "bios" {
    value = [for name, role in var.hero_thousand_faces : "${name} is the ${role}"]
}

output "upper_roles" {
    value = {for name, role in var.hero_thousand_faces : upper(name) => upper(role)}
}

output "for_directive" {
    value = <<EOF
    %{~ for name in var.user_names }
        ${name}
    %{~ endfor }
    EOF
}