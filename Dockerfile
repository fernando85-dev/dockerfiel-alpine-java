FROM alpine:3.17.0 as base

RUN apk update && apk upgrade && apk add openjdk8 && apk add ca-certificates 

COPY cert/cert_CertTrusted-WebSSL-FW-UnimedPOA.crt /usr/local/share/ca-certificates/
RUN cat /usr/local/share/ca-certificates/cert_CertTrusted-WebSSL-FW-UnimedPOA.crt >> /etc/ssl/certs/ca-certificates.crt && update-ca-certificates

#ENV PATH "../.."

COPY . /var/www/java  
WORKDIR /var/www/java  
RUN javac PrimeiraClasse.java  
CMD ["java", "PrimeiraClasse"] 

#EXPOSE 80:8091
