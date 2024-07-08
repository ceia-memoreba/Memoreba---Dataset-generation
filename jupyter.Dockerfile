FROM ubuntu:20.04

RUN apt-get update -y
RUN apt-get install -y python3-dev python3-pip build-essential

# Entrar no diretório de trabalho do container
WORKDIR /geracao-dataset-vinicius-container

# Copiar os requirements para o container
COPY ./requirements.txt ./

# Instalar pacotes especificados nos requirements
COPY requirements.txt /requirements.txt 

# Upgrade pip e Instalar pacotes especificados nos requirements
RUN pip3 install --upgrade pip 
RUN pip3 install -r requirements.txt  

# Instalar Jupyter
RUN pip3 install jupyter

# Copia todo o projeto para dentro do container
COPY ./ ./

# Set the entrypoint
ENTRYPOINT ["jupyter","notebook","--ip","0.0.0.0","--no-browser","--allow-root"]

# Expose the port Jupyter Notebook will use
EXPOSE 8888
