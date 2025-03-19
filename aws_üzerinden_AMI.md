
1. AWS CLI'nin Kurulu Olduğundan Emin Ol
AWS CLI'nin kurulu olup olmadığını kontrol et:

aws --version

Eğer kurulu değilse [AWS CLI Kurulum Rehberi](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) sayfasını takip ederek yükleyebilirsin.

2. AWS CLI için Kimlik Doğrulaması Yap
AWS hesabına giriş yap ve kimlik bilgilerini yapılandır:

aws configure

İstenecek bilgiler:

https://youtu.be/NVkuXEPS0ek?si=dEnu1bDDlxZHkoWS

3. Amazon Tarafından Sağlanan AMI'leri Listeleme
Örneğin, Amazon Linux 2023 AMI’lerini listelemek için:

aws ec2 describe-images --owners amazon --filters "Name=name,Values=al2023-ami-kernel-default*" --query 'Images[*].[ImageId,Name]' --output table

Bu komut, Amazon'un sağladığı en güncel Amazon Linux 2023 AMI'lerini tablo formatında gösterecektir.

4. Belirli Bir AMI'nin ID’sini Bulma

Örneğin, en son çıkan Amazon Linux 2023 AMI'yi almak için:

aws ec2 describe-images --owners amazon --filters "Name=name,Values=al2023-ami-kernel-default*" --query 'Images | sort_by(@, &CreationDate) | [-1].[ImageId]' --output text

Bu komut, en güncel AMI ID’sini döndürür.

