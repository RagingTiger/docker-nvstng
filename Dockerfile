# getting base python image
FROM python:3.7.9-slim-buster

# set work dir for copying source code
WORKDIR /usr/local/src

# get python sources
COPY src/*/*.py .

# get requirements.txt
COPY src/ /tmp

# create combined requirements.tx and install packages
RUN cat /tmp/*/requirements.txt > /tmp/requirements.txt && \
    pip install --no-cache --upgrade -r /tmp/requirements.txt && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

# set default workdir
WORKDIR /nvstng

# cmd
CMD ["/bin/bash"]
