FROM ubuntu

# port à exposer pour accéder à l'application
EXPOSE 80

# on installe les outils nécessaire à la construction et à l'exécution
RUN apt update && apt install nginx

# on se place dans un dossier de travail et on y copie tout le code de l'application
WORKDIR /app
COPY . /app
# On construit l'application et on la déplace dans le bon dossier pour nginx
RUN sudo ufw allow 'Nginx HTTP'
RUN sudo ufw status
RUN cp /app /var/www/html

# Commande lancée lors du run de l'image docker
CMD ["nginx", "-g", "daemon off;"]
