# Comment faire fonctionner les projets ?
## Partie docker
Naviguer depuis le root du projet dans le folder ``project-main``, run ``docker-compose up``.

## Partie K8S
L'application sur proxmox doit être lancée manuellement. Copiez le fichier d'installation redis ``project-main/terraform/proxmox/install-redis.sh.tftpl`` dans la VM proxmox et lancez-le.
Après un ``terraform apply`` depuis ``project-main``, l'application se connecte au serveur proxmox grâce aux variables d'environnement incluses dans ``project-main/k8s-manifest/worker-deployment.yaml`` et ``project-main/k8s-manifest/vote-deployment.yaml``. 