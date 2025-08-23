resource "aws_db_subnet_group" "this" {
  name       = "${var.name}-subnet-group"
  subnet_ids = var.db_subnets
  tags = {
    Name = "${var.name}-db-subnet-group"
  }
}

resource "aws_rds_cluster" "this" {
  cluster_identifier      = "${var.name}-aurora-cluster"
  engine                  = "aurora-mysql"
  engine_version          = "8.0.mysql_aurora.3.04.0"
  master_username         = var.master_username
  master_password         = var.master_password
  db_subnet_group_name    = aws_db_subnet_group.this.name
  vpc_security_group_ids  = [var.db_sg_id]
  storage_encrypted       = true
  backup_retention_period = 7
  preferred_backup_window = "02:00-04:00"
  skip_final_snapshot     = true

  tags = {
    Name = "${var.name}-aurora-cluster"
  }
}

# Aurora Cluster Instances (Writer + Readers)
resource "aws_rds_cluster_instance" "this" {
  count               = var.replica_count + 1
  identifier          = "${var.name}-${count.index == 0 ? "writer" : "reader-${count.index}"}"
  cluster_identifier  = aws_rds_cluster.this.id
  instance_class      = var.instance_class
  engine              = aws_rds_cluster.this.engine
  engine_version      = aws_rds_cluster.this.engine_version
  publicly_accessible = false
  db_subnet_group_name = aws_db_subnet_group.this.name

  tags = {
    Name = "${var.name}-${count.index == 0 ? "writer" : "reader-${count.index}"}"
  }
}
