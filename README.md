# Fullstack sur Kubernetes

Ce dépôt contient les ressources relatives à l'épisode X de notre chaîne [inpulse.tv](https://www.inpulse.tv) dédié au déploiment de conteneur avec kubernetes :
- [  - [Kubernetes]]()

Pour comprendre le contenu de chaque projet il vous suffit de suivre les instructions de l'épisode sur notre chaîne [inpulse.tv](https://www.inpulse.tv).


## Prérequis 
`docker` doit etre installer pour poursuivre l'installation 

`kind` doit etre installé, les étapes sont décrites [ici](https://kind.sigs.k8s.io/docs/user/quick-start/#installation)

`kubectl` doit etre installé, les étapes sont décrites [ici](https://kubernetes.io/fr/docs/tasks/tools/install-kubectl/)

## Installation
Pour lancer le cluster Kubernetes multi node avec kind  : 
```bash
kind create cluster --name demo-kube --config kind.yml
```

Ensuite ils ne restent plus qu'a appliquer les manifestes kube pour créer les ressources nécessaires :

Pour la base de données mysql :
```bash
kubectl apply -f db.yml
```

Ce projet utilise comme source de données la base **mysql**. Le dump `dump.sql` contient le jeu de donées pour l'application 

Une fois le pod mysql up and running, pour importer les données : 
```bash
kubectl create configmap bootstrap-mysql --from-file=mysql
kubectl apply -f bootstrap.yml
```

Ensuite on peut déployer le backend et le frontend :
```bash
kubectl apply -f backend.yml
kubectl apply -f frontend.yml
```

Vous aurez une API consultable en local sur le port 8000 via l'URL : http://localhost:8000.
L'API ne propose qu'un seul endpoint : [``api/entreesdujour``](http://localhost:8000/api/entreesdujour)

Un site web sera également lancé dans votre navigateur via l'adresse : http://localhost:9000 (Ne nous tenez pas rigueur du design 😃 )

Bonne installation et à bientôt sur [inpulse.tv](https://www.inpulse.tv).
