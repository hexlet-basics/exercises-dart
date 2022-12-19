FROM hexletbasics/base-image:latest

RUN apt-get update && apt-get install apt-transport-https

RUN sh -c 'curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -'

RUN sh -c 'curl https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list'

RUN apt-get update

RUN sh -c 'curl https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_unstable.list > /etc/apt/sources.list.d/dart_unstable.list'

RUN apt-get install dart/stable

RUN export PATH="$PATH:/usr/lib/dart/bin"

WORKDIR /exercises-dart

COPY . .

ENV PATH=~/.local/bin/:/exercises-dart/bin:$PATH

RUN dart pub install
