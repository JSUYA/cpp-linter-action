FROM ubuntu:18.04

LABEL com.github.actions.name="clang-tidy check"
LABEL com.github.actions.description="Lint your code with clang-tidy in parallel to your builds"
LABEL com.github.actions.icon="code"
LABEL com.github.actions.color="gray-dark"

LABEL repository="https://github.com/smay1613/clang-tidy-action"
LABEL maintainer="smay1613 <dimaafa0@gmail.com>"

WORKDIR /build
RUN apt-get update
RUN apt-get -qq -y install curl
RUN apt-get -y -qq install clang-tidy cmake jq clang cppcheck

RUN apt-get install -y software-properties-common
RUN add-apt-repository universe
RUN apt-get -yqq update
RUN apt-get install -yqq python-pip
RUN pip install cpplint

ADD runchecks.sh /entrypoint.sh
COPY . .
CMD ["bash", "/entrypoint.sh"]
