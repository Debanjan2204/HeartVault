# Use official Tomcat 9 image with JDK 17 
FROM tomcat:9-jdk17 
 
# Copy the WAR file to Tomcat webapps directory 
COPY sprint.war /usr/local/tomcat/webapps/ 
 
# Expose the Tomcat default port 
EXPOSE 8080 
 
# Start Tomcat server 
CMD ["catalina.sh", "run"] 
