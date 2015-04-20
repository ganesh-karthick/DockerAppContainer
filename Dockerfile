# Docker build script to Run Auto Deploy web application in Apache Tomcat 7 and Java JRE 7

FROM java:7-jre
MAINTAINER ganesh.karthick@ymail.com

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64/
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $JAVA_HOME:$CATALINA_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME"
WORKDIR /usr/local/tomcat


ENV TOMCAT_MAJOR 7
ENV TOMCAT_VERSION 7.0.61
ENV TOMCAT_TGZ_URL https://www.apache.org/dist/tomcat/tomcat-$TOMCAT_MAJOR/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz

RUN echo "Downloading "&& echo  $TOMCAT_TGZ_URL
RUN curl -SL "$TOMCAT_TGZ_URL" -o tomcat.tar.gz \
        && tar -xvf tomcat.tar.gz --strip-components=1 \
        && rm -rf tomcat.tar.gz

RUN  rm -rf webapps \
        && mkdir webapps \
        && chmod 777 webapps \

# Add  war deployment ROOT.war in the same directory as Dockerfile
ADD ROOT.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh","run"]
