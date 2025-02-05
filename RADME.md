# Terraform Hands-on Example

このリポジトリは、M2 Mac 環境で Terraform を利用して基本的なリソース作成を体験するためのサンプルプロジェクトです。  
このハンズオンでは、Terraform の主要なコマンド（`init`、`plan`、`apply`）を実際に実行し、`null_resource` と `local-exec` プロビジョナーを利用してシンプルな構成を確認します。

## 構成内容

- **プロバイダー:** [hashicorp/null](https://registry.terraform.io/providers/hashicorp/null/latest)
- **リソース:** `null_resource` を利用して、`local-exec` プロビジョナーによりシェルコマンド `echo 'Hello, Terraform on M2 Mac!'` を実行します。

## 前提条件

- M2 Mac に macOS がインストールされていること
- [Homebrew](https://brew.sh/) がインストールされていること

## 環境構築手順

1. **Homebrew のインストール（未インストールの場合）**

   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. **Terraform のインストール**

   ```bash
   brew tap hashicorp/tap
   brew install hashicorp/tap/terraform
   ```

3. **Terraform のバージョン確認**

   ```bash
   terraform version
   ```

## プロジェクトのセットアップ

1. 作業用ディレクトリの作成

   ```bash
   mkdir ~/terraform-handson
   cd ~/terraform-handson
   ```

2. `main.tf` の作成

   以下の内容を `main.tf` に記述します。

   ```hcl
   # main.tf

   terraform {
     required_version = ">= 1.0.0"
   }

   provider "null" {}

   resource "null_resource" "example" {
     provisioner "local-exec" {
       command = "echo 'Hello, Terraform on M2 Mac!'"
     }
   }
   ```

## 実行手順

1. **初期化**

   Terraform の初期化を実行して、必要なプロバイダー（ここでは `null`）をダウンロードします。

   ```bash
   terraform init
   ```

   出力例:
   ```
   Initializing the backend...
   Initializing provider plugins...
   - Finding latest version of hashicorp/null...
   - Installing hashicorp/null v3.2.3...
   - Installed hashicorp/null v3.2.3 (signed by HashiCorp)
   Terraform has created a lock file .terraform.lock.hcl...
   Terraform has been successfully initialized!
   ```

2. **プランの作成**

   実行される変更内容のプランを確認します。

   ```bash
   terraform plan
   ```

   出力例:
   ```
   Terraform will perform the following actions:
     # null_resource.example will be created
   Plan: 1 to add, 0 to change, 0 to destroy.
   ```

3. **変更の適用**

   プランに基づいて実際にリソースを作成します。実行時に「yes」と入力して承認します。

   ```bash
   terraform apply
   ```

   出力例:
   ```
   Do you want to perform these actions?
     Terraform will perform the actions described above.
     Only 'yes' will be accepted to approve.
   Enter a value: yes

   null_resource.example: Creating...
   null_resource.example: Provisioning with 'local-exec'...
   null_resource.example (local-exec): Executing: ["/bin/sh" "-c" "echo 'Hello, Terraform on M2 Mac!'"]
   null_resource.example (local-exec): Hello, Terraform on M2 Mac!
   null_resource.example: Creation complete after 0s [id=7669433240859741087]

   Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
   ```

4. **(オプション) リソースの削除**

   作成したリソースを削除する場合は、以下のコマンドを実行します。

   ```bash
   terraform destroy
   ```

## まとめ

このハンズオンを通じて、以下のことを学びました。

- Terraform の基本的なワークフロー（`init`、`plan`、`apply`）
- `null_resource` と `local-exec` プロビジョナーを利用したシンプルなリソース作成
- M2 Mac 上での Terraform 実行環境の構築と利用方法

Terraform の詳細な使い方については、[Terraform 公式ドキュメント](https://www.terraform.io/docs) をご参照ください。
