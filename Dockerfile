FROM imperialgenomicsfacility/base-notebook-image:latest
LABEL maintainer="imperialgenomicsfacility"
LABEL version="0.0.1"
LABEL description="Docker image for running Scanpy based single cell analysis"
ENV NB_USER vmuser
USER $NB_USER
WORKDIR /home/$NB_USER
ENV TMPDIR=/home/$NB_USER/.tmp
ENV PATH $PATH:/home/$NB_USER/miniconda3/bin/
RUN . /home/$NB_USER/miniconda3/etc/profile.d/conda.sh && \
    source deactivate && \
    conda env create -q -n notebook-env --file /home/$NB_USER/environment.yml && \
    conda clean -a -y && \
    rm -rf /home/$NB_USER/.cache && \
    rm -rf /tmp/* && \
    rm -rf ${TMPDIR} && \
    mkdir -p ${TMPDIR} && \
    mkdir -p /home/$NB_USER/.cache && \
    find miniconda3/ -type f -name *.pyc -exec rm -f {} \;
EXPOSE 8888
ENTRYPOINT [ "/usr/local/bin/tini","--","/home/vmuser/entrypoint.sh" ]
CMD [ "notebook" ]
