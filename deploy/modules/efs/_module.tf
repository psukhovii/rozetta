resource "aws_efs_file_system" "efs" {
  encrypted      = true
  creation_token = var.efs_name
  lifecycle_policy {
    transition_to_ia = "AFTER_30_DAYS"
  }

  lifecycle_policy {
    transition_to_primary_storage_class = "AFTER_1_ACCESS"
  }
  tags = merge({ Name = var.efs_name }, var.tags)
}

resource "aws_efs_mount_target" "efs-mt" {
  count           = length(var.private_subnet_ids)
  file_system_id  = aws_efs_file_system.efs.id
  subnet_id       = var.private_subnet_ids[count.index]
  security_groups = [var.security_group]
}

resource "aws_efs_backup_policy" "efs_policy" {
  file_system_id = aws_efs_file_system.efs.id

  backup_policy {
    status = "ENABLED"
  }
}
