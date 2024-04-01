FROM openjdk:8-jdk-alpine

RUN apk update && apk add bash

ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_VERSION 3.9.6

RUN wget https://apache.osuosl.org/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
    tar -xzf apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
    rm apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
    ln -s /apache-maven-${MAVEN_VERSION} /usr/share/maven && \
    ln -s /apache-maven-${MAVEN_VERSION}/bin/mvn /usr/bin/mvn

WORKDIR /app

COPY . .

ENV JAVA_HOME /usr/lib/jvm/default-jvm/

RUN mvn package -DskipTests

EXPOSE 8080

# O nome do .jar pode mudar dependendo da versão
# Melhoria: Pegar o nome do jar direto do pom.xml
CMD ["java", "-jar", "target/obstare-0.0.1-SNAPSHOT.jar"]