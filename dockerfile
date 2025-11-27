# Use Tomcat with JDK 11
FROM tomcat:10.1-jdk11

# Set working directory
WORKDIR /usr/local/tomcat

# Remove default Tomcat applications
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the WAR file to Tomcat webapps
COPY target/blogx.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]