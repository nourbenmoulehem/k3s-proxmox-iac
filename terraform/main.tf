resource "proxmox_virtual_environment_vm" "k3s_worker" {

  name = var.worker_name
  node_name = var.proxmox_node
  vm_id = var.worker_vmid

  clone {
    vm_id = var.template_id
    full = true
  }

  agent {
    enabled = true
  }

  cpu {
    cores = var.worker_cores
    type = "host"
  }

  memory {
    dedicated = var.worker_memory
  }

  disk {
    datastore_id = "local-lvm"
    interface = "scsi0"
    size         = var.worker_disk_size
    ssd = true
    discard = "on"
  }

  initialization {
    ip_config {
      ipv4 {
        address = var.worker_ip
        gateway = var.worker_gateway
      }
    }

    user_account {
      username = "nour"
      keys = [var.ssh_public_key]
    }
  }

  network_device {
    bridge = "vmbr0"
  }

  operating_system {
    type = "l26"
  }

}


output "worker_ip" {
  description = "The IP address assigned to the k3s worker"
  value       = var.worker_ip
}