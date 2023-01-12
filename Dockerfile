# docker build -t firmadyne:local .
FROM ubuntu:20.04
# Set shell to bash instead of dash
RUN export DEBIAN_FRONTEND=noninteractive
RUN echo "dash dash/sh boolean false" | debconf-set-selections && dpkg-reconfigure dash
#working directory
WORKDIR /firmadyne
# Set the timezone to America/New_York
ENV TZ=America/New_York
ENV KEYBOARD_COUNTRY=us
# Update packages
RUN apt-get update && apt-get upgrade -y && apt-get install -y sudo
RUN apt-get update && apt-get install -y tzdata
# Create firmadyne user
RUN useradd -m firmadyne
RUN echo "firmadyne:firmadyne" | chpasswd && adduser firmadyne sudo

# Run setup script
ADD . .
RUN /firmadyne/setup.sh
# Set up environment
 
USER firmadyne
ENTRYPOINT ["/firmadyne/startup.sh"]
CMD ["/bin/bash"]
