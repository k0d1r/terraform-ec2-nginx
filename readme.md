# Terraform ile AWS EC2 Üzerinde Nginx Kurulumu

Bu proje, Terraform kullanarak AWS EC2 üzerinde bir Nginx web sunucusu kurmayı amaçlamaktadır. Proje kapsamında bir EC2 örneği oluşturulacak, güvenlik grubu yapılandırılacak ve Nginx web sunucusu otomatik olarak kurulacaktır.

## Gereksinimler
- **AWS Hesabı** (EC2 oluşturabilmek için)
- **Terraform** (v1.5 veya üstü önerilir)
- **AWS CLI** (Kimlik doğrulama için)
- **SSH Anahtar Çifti** (EC2’ye bağlanmak için)

## Kurulum Adımları

### 1. AWS CLI ile Kimlik Doğrulama
Öncelikle, AWS kimlik bilgilerinizi yapılandırmanız gerekiyor:
```sh
aws configure
```
Bu komut, erişim anahtarı (Access Key), gizli anahtar (Secret Key) ve varsayılan bölgeyi girmenizi isteyecektir.

### 2. Terraform’u Başlatma
```sh
terraform init
```
Bu komut, gerekli Terraform sağlayıcılarını indirir ve projenizi başlatır.

### 3. Terraform Planını Oluşturma
```sh
terraform plan
```
Bu komut, yapılacak değişiklikleri önceden görmenizi sağlar.

### 4. Terraform Apply ile Kaynakları Oluşturma
```sh
terraform apply -auto-approve
```
Bu komut, EC2 ve Nginx kurulumu dahil olmak üzere tüm kaynakları AWS üzerinde oluşturur.

### 5. Kurulum Sonrası EC2 IP Adresini Almak
Kurulum tamamlandıktan sonra, oluşturulan EC2 örneğinin genel IP adresini almak için şu komutu çalıştırabilirsiniz:
```sh
echo $(terraform output ec2_public_ip)
```
Bu IP adresine tarayıcınızdan giderek Nginx’in çalıştığını görebilirsiniz.

### 6. Kaynakları Silme
Tüm AWS kaynaklarını kaldırmak için aşağıdaki komutu çalıştırabilirsiniz:
```sh
terraform destroy -auto-approve
```

## Dosya Yapısı
```
.
├── main.tf          # Ana Terraform dosyası
├── variables.tf     # Değişkenler
├── outputs.tf       # Çıktılar
├── variables.tf     

```

Bu sayede, projeniz GitHub üzerinde paylaşılabilir ve açık kaynak olarak dağıtılabilir.

## Lisans
Bu proje MIT Lisansı ile lisanslanmıştır. Dilediğiniz gibi kullanabilirsiniz.

