# Use official Tomcat image
FROM tomcat:9-jdk21

# Copy the WAR file to the Tomcat webapps directory
COPY sprint.war /usr/local/tomcat/webapps/sprint.war

# Ensure correct permissions (optional, but useful)
RUN chmod 644 /usr/local/tomcat/webapps/sprint.war

# Set working directory to Tomcat
WORKDIR /usr/local/tomcat

# Expose the Tomcat default port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
