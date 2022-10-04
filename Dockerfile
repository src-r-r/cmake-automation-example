FROM danger89/cmake:latest
ENV DEBIAN_FRONTEND="noninteractive"
RUN apt update && apt install -y entr
