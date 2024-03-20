module "kube" {
  source = "../../"
  enable_cilium_policy = true
  network_id = "enpcdvh4rt9421s66nv3"
  cluster_version = "1.29"
  release_channel = "RAPID"

  master_locations = [
    {
      zone      = "ru-central1-c"
      subnet_id = "b0ck98ck4a443dd9iluq"
    }
  ]

  node_groups = {
    "yc-k8s-ng-c" = {
      description = "Группа узлов в зоне С"
      node_memory = 16
      node_cores  = 4
      fixed_scale = {
        size = 6
      }
      node_locations   = [
        {
          zone      = "ru-central1-c"
          subnet_id = "b0ck98ck4a443dd9iluq"
        }
      ]
    },
  }
}
