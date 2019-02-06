#!/usr/bin/env bash

mvn clean package

echo 'Copy files...'

scp target/SpringBootTwitter-0.1.jar \
    matveymaletskov@192.168.0.89:/Users/matveymaletskov/

echo 'Restart server...'

ssh matveymaletskov@192.168.0.89 << EOF
pgrep java | xargs kill -9
nohup java -jar SpringBootTwitter-0.1.jar > log.txt
EOF

echo 'Bye'