FROM williamyeh/java7  
MAINTAINER William Yeh <william.pjyeh@gmail.com>  
ENV SCALA_VERSION 2.10.4  
ENV SCALA_TARBALL http://www.scala-lang.org/files/archive/scala-$SCALA_VERSION.deb  
RUN \  
echo "==> Install curl helper tool..."&& \  
apt-get update && \  
DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes curl && \  
\  
\  
\  
echo "===> install from Typesafe repo (contains old versions but they have all dependencies we need later on)"&& \  
curl -sSL http://apt.typesafe.com/repo-deb-build-0002.deb -o repo-deb.deb && \  
dpkg -i repo-deb.deb && \  
apt-get update && \  
\  
\  
\  
  
echo "===> install Scala"&& \  
DEBIAN_FRONTEND=noninteractive \  
apt-get install -y --force-yes libjansi-java && \  
curl -sSL $SCALA_TARBALL -o scala.deb && \  
dpkg -i scala.deb && \  
\  
\  
\  
echo "===> clean up..."&& \  
rm -f *.deb && \  
apt-get remove -y --auto-remove curl && \  
apt-get clean && \  
rm -rf /var/lib/apt/lists/*  
COPY . /root  
WORKDIR /root  
Run scalac index.scala 

