resource "aws_fsx_windows_file_system" "this" {
#  active_directory_id = aws_directory_service_directory.example.id
#  kms_key_id          = aws_kms_key.example.arn
  storage_capacity    = 100
  subnet_ids          = [aws_subnet.example.id]
  throughput_capacity = 1024
}

resource "aws_datasync_location_fsx_windows_file_system" "this" {
  fsx_filesystem_arn  = aws_fsx_windows_file_system.this.arn
  user                = "SomeUser"
  password            = "SuperSecretPassw0rd"
  security_group_arns = [aws_security_group.example.arn]
}
