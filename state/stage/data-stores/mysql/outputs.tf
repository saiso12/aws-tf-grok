output "address" {
    value = aws_db_instance.example.address
    description = "Connect to the database using this address"

}

output "port" {
    value = aws_db_instance.example.port
    description = "The port of the db listening to"

}

output "db_creds" {
    value = aws_db_instance.example.username

}

output "db_pass" {
    value = aws_db_instance.example.password
}

