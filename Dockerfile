FROM ubuntu

RUN mkdir /jekyll
RUN mkdir /jekyll/Config
ADD Agent.sh /jekyll/Agent.sh
ADD Back_Agent.sh /jekyll/Back_Agent.sh
ADD tunnel-ID /jekyll/tunnel-ID
RUN chmod +x -R /jekyll/*
RUN apt update && apt install -y curl git wget tmux fish gcc make tar openssl nano p7zip 

ENTRYPOINT ["sh", "-c", "/jekyll/Agent.sh"]
