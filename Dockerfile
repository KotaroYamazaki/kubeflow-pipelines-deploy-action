FROM python:3.7-stretch

LABEL "com.github.actions.name"="Submit Kubeflow Pipeline From GitHub"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="purple"

COPY . . 

RUN  pip install -r requirements.txt

# Install gcloud command
RUN apt-get update; apt-get install curl -y
RUN curl -sSL https://sdk.cloud.google.com | bash
ENV PATH $PATH:/root/google-cloud-sdk/bin

RUN chmod +x /entrypoint.sh
RUN ls
RUN echo ${GOOGLE_APPLICATION_CREDENTIALS}
ENTRYPOINT ["/entrypoint.sh"]
