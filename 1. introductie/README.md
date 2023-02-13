Wat is Terraform?

## Infrastructure as Code

- Reproducibility (meerdere omgevingen, herhaalbaar)
- Version Control (samenwerken, modules importeren)
- Automation (Geen menselijk fouten, past in pipelines)
- Scalability (Eenvoudig uitbreiden)

Meer buzzwords:

- Security
- Cost savings
- Flexibility
- Disaster recovery

## Wat is terraform?

- Een simpele go binary
- Vertaalt human-readable configuratie naar json
- Voert configuratie idempotent uit dmv plugins (providers)
- HIER MEER EN DUIDELIJKER, PLAATJE?

## Waarom terraform?

- De facto standaard (nog wel)
- Multi-cloud
- Grote communitiy
- Veel officiele partners (wordt)
- HCL (yaml-achtig configuratieformaat)
- Houdt drift bij (niet zoals Ansible of scripts)




## Alternatieven

### Ansible

- Ook grote community
- Cloudagnostisch
- Houdt geen staat bij. extra werk nodig om infra bij te houden
- Beter voor configuratie van VM's of netwerkapperatuur

### AWS CDK

- Gebruikt programmeer talen (bv. python, java, typescript, go)
- genereert cloudformation
- alleen voor AWS
- out of the box best practices
- Lijkt de standaard te worden voor AWS

### Pulumi

- ook multicloud
- Gebruikt programmeer talen (bv. python, java, typescript, go)


### Bicep

- Voor Azure
- Lijkt het meest op terraform
- Leesbaarder alternatief voor ARM



https://registry.terraform.io/browse/providers


Cmd+Shift+V
