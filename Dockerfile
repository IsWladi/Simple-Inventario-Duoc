FROM sonarqube:9.9.3-community

# Environment variable specified in the documentation of SonarQube
ENV SONAR_ES_BOOTSTRAP_CHECKS_DISABLE=true

# Switch to root user to install Node.js
USER root

# Install Node.js 18 is required for SonarQube (only 16 and 18 are supported)
RUN  apt-get update && \
     apt-get install -y ca-certificates curl gnupg && \
     mkdir -p /etc/apt/keyrings && \
     curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key |  gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
ENV NODE_MAJOR=18
RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" |  tee /etc/apt/sources.list.d/nodesource.list
RUN  apt-get update && \
     apt-get install nodejs -y

# SonarQube has to be run as a non-root user
RUN useradd -m sonarqubeUser
USER sonarqubeUser


EXPOSE 9000

