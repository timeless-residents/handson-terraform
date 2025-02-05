# main.tf

# Terraform のバージョンを指定（オプション）
terraform {
  required_version = ">= 1.0.0"
}

# null provider の利用（外部リソースではなく、ローカルでの動作確認用）
provider "null" {}

# サンプルリソースとして null_resource を作成
resource "null_resource" "example" {
  provisioner "local-exec" {
    command = "echo 'Hello, Terraform on M2 Mac!'"
  }
}
