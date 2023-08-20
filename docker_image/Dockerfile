FROM ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y git gpg curl wget openjdk-11-jre maven  postgresql dotnet-sdk-7.0 aspnetcore-runtime-7.0 apache2 software-properties-common

# Instalar Visual Studio Code (VS Code) y sus dependencias
RUN add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EB3E94ADBE1229CF
RUN apt-get update && apt-get install -y code

# Copiando mi archivo index.html
COPY index.html /var/www/html

# Exponer el puerto 80 (para Apache u otras aplicaciones web)
EXPOSE 80

CMD ["apache2ctl", "-D", "FOREGROUND"]
