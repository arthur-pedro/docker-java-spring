# Dockerizando Java + Maven + Spring

##### Configurando ambiente

O primeiro passo é instalar o docker na máquina (Se MacOS, usar o software Orbstack, pois é mais leve que o software do Docker)

https://orbstack.dev/

##### Configurando projeto

Colocar o Dockerfile + docker-compose.yml do root do projeto.

Ajustar o `application.properties` ajustando a variável de ambiente `spring.datasource.url` pois agora ela deve apontar para o banco do container, exemplo: `jdbc:postgresql://db:5432/obstare?useSSL=false` onde `db` é o nomde do serviço do banco configurado no docker-compose.yml.

##### Iniciando containers

Rodar `docker-compose up` para buildar e iniciar o container

##### Dicas

Caso você ja tenha um banco rodando local, ou em outro container, basta desconsiderar o banco criado no docker-compose.yml e conectar a aplicação ao seu banco local.
