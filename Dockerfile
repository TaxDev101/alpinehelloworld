# Utilisez une image de base Python optimisée
FROM python:3.9-slim-buster

# Définissez le répertoire de travail dans le conteneur
WORKDIR /app

# Créez un environnement virtuel pour isoler les dépendances
RUN python3 -m venv /app/venv

# Activez l'environnement virtuel (pour les commandes suivantes)
ENV PATH="/app/venv/bin:$PATH"

# Copiez le fichier requirements.txt dans le conteneur
COPY requirements.txt requirements.txt

# Installez les dépendances   
 dans l'environnement virtuel
RUN /app/venv/bin/pip install -r requirements.txt

# Copiez votre application dans le conteneur
COPY ./webapp /app

# Exposez le port si nécessaire (ajustez selon votre application)
EXPOSE 5000

# Commande à exécuter lors du démarrage du conteneur (ajustez selon votre application)
CMD ["/app/venv/bin/gunicorn", "--bind", "0.0.0.0:$PORT", "wsgi"]
