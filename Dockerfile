# Utiliser une image PHP officielle en tant que base
FROM php:latest

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier les fichiers de l'hôte vers le conteneur
COPY . .

# Installer curl nécessaire pour télécharger Composer
RUN apt-get update && apt-get install -y curl

# Télécharger et installer Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Installer les dépendances de l'application avec Composer
RUN composer install

# Exécuter l'application lors du démarrage du conteneur
CMD ["php", "index.php"]
