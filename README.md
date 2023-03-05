# Code voor kennissessie Terraform I-Share

Deze repository bevat de gebruikte code tijdens de demo's in de kennissessie over Terraform bij I-Share.
Deze kennissessie is gegeven op het I-Share kantoor in Bunnik op 27-02-2023 door Bart Tange.

## benodigheden

Om gebruik te maken van deze code zal je lokaal moeten inloggen bij AWS met genoeg rechten om de aangegeven resources te kunnen aanmaken en verwijderen.

Dit kan bijvoorbeeld door deze environment variabelen te zetten. Zelf gebruik ik hier [direnv](https://github.com/direnv/direnv) voor.

```sh
export AWS_ACCESS_KEY_ID=xxxx
export AWS_SECRET_ACCESS_KEY=xxxx
export AWS_DEFAULT_REGION=eu-central-1
```

Een alternatief is om met de aws-cli een profile in te stellen. Zie [hier](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html#cli-configure-quickstart-config).
Daarnaast zal je de terraform cli moeten installen. Zie [hier](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli#install-terraform)

## Uitvoeren

De basisflow van het uitvoeren van de code. Dit zal de benodigdheden downloaden, de resources deployen en uiteindelijk vernietigingen.

1. Ga naar het gewenste project.
2. terraform init
3. terraform plan
4. terraform apply
5. terraform destroy