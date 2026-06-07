variable "proxmox_endpoint" {
  description = "Proxmox API endpoint URL"
  type        = string
}

variable "proxmox_api_token" {
  description = "Proxmox API token in form user@realm!tokenid=secret"
  type        = string
  sensitive   = true
}


variable "proxmox_node" {
  description = "Name of the Proxmox node to deploy on"
  type        = string
  default     = "proxmox"
}

variable "template_id" {
  description = "VMID of the cloud-init template to clone"
  type        = number
  default     = 9000
}

variable "worker_vmid" {
  description = "VMID for the new k3s worker"
  type        = number
  default     = 101
}

variable "worker_name" {
  description = "Hostname for the new k3s worker"
  type        = string
  default     = "k3s-worker-01"
}

variable "worker_ip" {
  description = "Static IP for the worker in CIDR form"
  type        = string
  default     = "192.168.1.151/24"
}

variable "worker_gateway" {
  description = "Network gateway"
  type        = string
  default     = "192.168.1.1"
}

variable "worker_cores" {
  description = "Number of CPU cores for the worker"
  type        = number
  default     = 2
}

variable "worker_memory" {
  description = "Memory in MB for the worker"
  type        = number
  default     = 2048
}

variable "worker_disk_size" {
  description = "Disk size in GB for the worker"
  type        = number
  default     = 20
}

variable "ssh_public_key" {
  description = "SSH public key to inject via cloud-init"
  type        = string
}