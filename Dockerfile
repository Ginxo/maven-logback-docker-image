FROM maven:3.5.3-alpine
# To allow https connections
RUN apk add --update openssl

ARG MAVEN_FOLDER=/usr/share/maven
ARG MAVEN_LIB_FOLDER=$MAVEN_FOLDER/lib

# Logback libraries downloaded
RUN wget https://repo1.maven.org/maven2/ch/qos/logback/logback-core/1.2.3/logback-core-1.2.3.jar --directory-prefix=$MAVEN_LIB_FOLDER
RUN wget https://repo1.maven.org/maven2/ch/qos/logback/logback-classic/1.2.3/logback-classic-1.2.3.jar --directory-prefix=$MAVEN_LIB_FOLDER
RUN wget https://repo1.maven.org/maven2/net/logstash/logback/logstash-logback-encoder/6.3/logstash-logback-encoder-6.3.jar --directory-prefix=$MAVEN_LIB_FOLDER
RUN wget https://repo1.maven.org/maven2/com/fasterxml/jackson/core/jackson-annotations/2.11.0/jackson-annotations-2.11.0.jar --directory-prefix=$MAVEN_LIB_FOLDER
RUN wget https://repo1.maven.org/maven2/com/fasterxml/jackson/core/jackson-core/2.11.0/jackson-core-2.11.0.jar --directory-prefix=$MAVEN_LIB_FOLDER
RUN wget https://repo1.maven.org/maven2/com/fasterxml/jackson/core/jackson-databind/2.11.0/jackson-databind-2.11.0.jar --directory-prefix=$MAVEN_LIB_FOLDER

RUN rm $MAVEN_LIB_FOLDER/maven-slf4j-provider-*.jar

COPY logstash.xml $MAVEN_FOLDER
ENV MAVEN_OPTS="$MAVEN_OPTS -Dlogback.configurationFile=$MAVEN_FOLDER/logstash.xml"