# Comment faire fonctionner les projets ?
## Partie docker
Naviguer depuis le root du projet dans le folder ``project-main``, run ``docker-compose up``.

## Partie K8S
L'application sur proxmox doit être lancée manuellement. 
Après un ``terraform apply`` depuis ``project-main``, l'application se connecte au serveur proxmox grâce aux variables d'environnement incluses dans worker-deployment et vote deployment. 