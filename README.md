YILMAZ Demir 21211875  
FILATOV Vadym 21210463  
KASHPERUK Kristina 21210406  
 
Projet Dockerisé avec Kafka et Strapi  
Ce projet utilise Docker Compose pour configurer et gérer plusieurs services pour un pipeline de données en temps réel, y compris Kafka, Strapi, Postgres, ainsi que divers producteurs et consommateurs. Il démontre comment ces services peuvent communiquer entre eux dans un environnement conteneurisé Docker.  

Vue d'ensemble du projet  
Le projet se compose de deux configurations principales de Docker Compose :  
 
docker-compose-part1.yml : Configure les services principaux tels que Postgres, Strapi, Kafka, Zookeeper, Mosquitto, MQTT-Kafka-Connector  

docker-compose-part2.yml : Contient les producteurs et consommateurs qui se connectent à Kafka et Strapi pour échanger des données.  

Architecture  
L'architecture du projet implique les services suivants :  

Postgres : Utilisé comme base de données pour Strapi.  

Strapi : Un CMS sans tête qui interagit avec la base de données.  

Kafka : Un broker de messages utilisé pour gérer les flux de données en temps réel.  

Zookeeper : Gère le cluster Kafka.  

Producteurs (Product, Event, Stock) : Ces services produisent des données vers des topics Kafka.  

Consommateurs (Product, Event, Stock) : Ces services consomment des données à partir de topics Kafka et effectuent des actions telles que l'interaction avec Strapi.  

Prérequis  
Assurez-vous d'avoir Docker et Docker Compose installés sur votre machine avant de commencer.  

Docker  
Installer Docker : Guide d'installation de Docker  

Installer Docker Compose : Guide d'installation de Docker Compose  

Comment exécuter le projet  
Étape 1 : Démarrer les services de la Partie 1  
La première partie du projet inclut Kafka, Zookeeper, Postgres et Strapi. Pour lancer ces services, allez dans le dossier où se trouve le fichier docker-compose-part1.yml et exécutez les commandes suivantes :  

docker-compose -f docker-compose-part1.yml build  
docker-compose -f docker-compose-part1.yml up  

OU, SI VOUS VOULEZ AUSSI UTILISEZ MOSQUITTO, FAITES  
docker-compose -f docker-compose-part1.yml build  
docker-compose -f docker-compose-part1.yml up strapi postgres zookeeper kafka mosquitto  
puis  
docker-compose -f docker-compose-part1.yml up mqtt-kafka-connector  

Cela démarrera tous les services définis dans docker-compose-part1.yml :  

Postgres sera accessible sur le port 5434.  

Strapi sera accessible sur le port 1337 (à l'adresse http://localhost:1337).  

Kafka sera disponible sur le port 9092.  

Mosquitto sera disponible sur le port 1883.  
 
Puis, partez à l'adresse http://localhost:1337/admin pour accéder à l'interface d'administration de Strapi.  
Dans ce cas, connecter vous comme admin.  
Créez les collections nécessaires pour votre projet.  
Cela sont:  

PRODUCT:  
name: short text   
description: long text  
stock_available: integer (default 0)  
image: single media (only image)  
barcode: short text  
status: enumeration (safe|danger|empty)  

EVENT:  
value: string  
metadata: JSON  

Étape 2 : Démarrer les services de la Partie 2  
Une fois les services de la Partie 1 en cours d'exécution, passez à l'étape suivante pour démarrer les producteurs et consommateurs. Allez dans le dossier où se trouve le fichier docker-compose-part2.yml et exécutez la commande suivante :  

docker-compose -f docker-compose-part2.yml build  
docker-compose -f docker-compose-part2.yml up  
Cela démarrera les producteurs et consommateurs qui se connecteront à Kafka et Strapi pour échanger des données en temps réel.  

Avec les deux parties en cours d'exécution, vous pouvez maintenant commencer à envoyer des données à Kafka et à les consommer avec Strapi.  

Ouvrez un nouveau terminal naviguer au opsci-strapi-frontend et exécutez les commandes suivantes:  

yarn install  
yarn dev  
o  

Le page de produit et events est maintenant accessible, vous pouvez naviguer  

BONUS:  
Si vous voulez modifier les stocks d'un produit, partez à https://mqtt-test-front.onrender.com:  

Entrez l'id du produit et son nouveau stock, puis envoyez la requete  

Conclusion  
Ce projet montre comment utiliser Docker Compose pour orchestrer plusieurs services et gérer des flux de données en temps réel entre différents producteurs et consommateurs, avec Kafka comme broker de messages et Strapi comme système de gestion de contenu.
