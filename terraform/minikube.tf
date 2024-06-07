provider "null" {}

resource "null_resource" "start_minikube" {
  provisioner "local-exec" {
    command = "minikube start"
  }
}

resource "null_resource" "configure_kubectl" {
  provisioner "local-exec" {
    command = "minikube kubectl -- get po -A"
  }
}

resource "null_resource" "minikube_status" {
  depends_on = [null_resource.start_minikube]

  provisioner "local-exec" {
    command = "minikube status"
  }
}

output "minikube_ip" {
  value = "127.0.0.1"  # Or you can use output from 'minikube ip' command
}
