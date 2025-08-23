output "db_writer_endpoint" {
  description = "Writer endpoint of the Aurora cluster"
  value       = aws_rds_cluster.this.endpoint
}

output "db_reader_endpoint" {
  description = "Reader endpoint of the Aurora cluster"
  value       = aws_rds_cluster.this.reader_endpoint
}

output "db_cluster_id" {
  description = "Aurora Cluster Identifier"
  value       = aws_rds_cluster.this.id
}
