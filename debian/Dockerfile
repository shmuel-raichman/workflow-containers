# B"H
FROM debian

WORKDIR /opt

RUN apt-get update -y && apt-get install  -y vim tree net-tools wget curl telnet git sudo unzip jq bash-completion

RUN mkdir -p /opt/aws/ cd /opt/aws && \
	curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
	unzip awscliv2.zip && \
	./aws/install

RUN apt-get install -y gnupg software-properties-common && \
	wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | tee /usr/share/keyrings/hashicorp-archive-keyring.gpg && \
	echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
	tee /etc/apt/sources.list.d/hashicorp.list && \
	apt-get update -y && apt-get install terraform

