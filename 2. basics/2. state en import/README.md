# Aantekeningen

bespreek:

- *.tf
- terraform.tfstate
- terraform state list, hier zie je "bestaande" resources
- laat afhankelijkheden zien: terraform graph | dot -Tsvg > graph.svg 
- update ec2 size, micro - nano
- comment ec2, dan plan, zie dat terraform dit wilt verwijderen ondanks niet in config.
- stel je wilt deze niet destoyen, dan eerst terraform state rm aws_instance.demo2
- terraform import aws_instance.demo2 xxxxx, voor migreren naar terraform
