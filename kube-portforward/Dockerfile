# B"H
FROM debian

WORKDIR /opt

RUN apt-get update -y && apt-get install  -y vim tree net-tools wget curl telnet git sudo unzip jq bash-completion

# Install aws cli
RUN mkdir -p /opt/aws/ cd /opt/aws && \
	curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
	unzip awscliv2.zip && \
	./aws/install

# Install terraform
RUN apt-get install -y gnupg software-properties-common && \
	wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | tee /usr/share/keyrings/hashicorp-archive-keyring.gpg && \
	echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
	tee /etc/apt/sources.list.d/hashicorp.list && \
	apt-get update -y && apt-get install terraform

# Install kubectl
# apt-transport-https may be a dummy package; if so, you can skip that package
RUN curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg && \
	echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' \
	| sudo tee /etc/apt/sources.list.d/kubernetes.list && \
	apt-get update && \
	apt-get install -y kubectl


COPY ./entrypoint.sh /opt/entrypoint.sh