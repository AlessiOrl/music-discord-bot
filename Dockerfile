FROM openjdk:11

MAINTAINER Orlando

ENV token=""
ENV owner=""
ENV prefix="-"
ENV botname="musicbot"

VOLUME "/data"
COPY . "/data"
WORKDIR "/data"

RUN sed -i '/token/c\token = $token' default_config.txt 
RUN sed -i '/owner/c\owner = $owner' default_config.txt
RUN sed -i '/prefix/c\prefix = $prefix' default_config.txt
RUN wget -q $(curl -s https://api.github.com/repos/jagrosh/MusicBot/releases/latest | grep browser_download_url | cut -d '"' -f 4) -O $botname.jar 


#CMD java -Dnogui=true -Dconfig=config.txt -jar $botname.jar

CMD [ "/bin/bash", "-c", "while true; do sleep 10; done;"]

