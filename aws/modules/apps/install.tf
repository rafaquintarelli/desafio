resource "null_resource" "connect_cluster" {
  provisioner "local-exec" {
    command = "aws eks --region us-east-1 update-kubeconfig --name k8s-carlos"
  }
}

resource "null_resource" "apply_nodejsjs" {
  provisioner "local-exec" {
    command = "kubectl apply -f ${path.module}/nodejsjs/deployment.yaml"
  }

   depends_on = [null_resource.connect_cluster]
}