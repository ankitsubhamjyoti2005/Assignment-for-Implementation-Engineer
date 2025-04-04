resource "aws_msk_cluster" "onfinance_kafka" {
  cluster_name           = "onfinance-stream"
  kafka_version         = "2.8.1"
  number_of_broker_nodes = 3
  broker_node_group_info {
    instance_type  = "kafka.t3.small"
    storage_info {
      ebs_storage_info {
        volume_size = 100
      }
    }
  }
}
