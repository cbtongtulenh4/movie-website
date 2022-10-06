FROM openjdk-8
ADD target/MovieWebsite.jar MovieWebsite.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/MovieWebsite.jar"]