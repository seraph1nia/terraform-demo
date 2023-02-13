# Aantekeningen

- Afgekeken van aws cdk, welke een stuk verder is. Mocht je enkel met aws werken, zou ik daar naar kijken.
- TypeScript, Python, Java, C#, and Go
- Goed voor developers
- Op dit moment is de documentatie nog erg slecht


dependencies en installaties
- terraform
- node.js
- npm install --global cdktf-cli@latest
- python (brew install python@3.11)
- pipenv (pip3.11 install pipenv)
- cdktf init --template="python" --providers="aws@~>4.0"
- pip3.11 install cdktf_cdktf_provider_aws # zo installeer je plugins

gebruiken:


- cdktf synth # check syntax e.d.
- cdktf diff # plan
- cdktf deploy # apply
- cdktf destroy --auto-approve