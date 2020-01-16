FROM imperialgenomicsfacility/base-notebook-image:latest
LABEL maintainer="imperialgenomicsfacility"
LABEL version="0.0.1"
LABEL description="Docker image for running Scanpy based single cell analysis"
ENV NB_USER vmuser
ENV NB_UID 1000
USER root
WORKDIR /
RUN apt-get -y update &&   \
    apt-get install --no-install-recommends -y \
      libfontconfig1 \
      libxrender1 \
      libreadline6-dev \
      libreadline6 \
      libicu-dev \
      libc6-dev \
      icu-devtools \
      gcc \
      g++ \
      make \
      libgcc-5-dev \
      gfortran \
      git  && \
    apt-get purge -y --auto-remove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
USER $NB_USER
WORKDIR /home/$NB_USER
ENV TMPDIR=/home/$NB_USER/.tmp
ENV PATH=$PATH:/home/$NB_USER/miniconda3/bin/
RUN rm -f /home/$NB_USER/environment.yml
COPY environment.yml /home/$NB_USER/environment.yml
COPY r_lib.r /home/$NB_USER/r_lib.r
COPY install.sh /home/$NB_USER/install.sh
COPY examples /home/$NB_USER/examples
USER root
RUN chown ${NB_UID} /home/$NB_USER/environment.yml && \
    chown ${NB_UID} /home/$NB_USER/r_lib.r && \
    chown ${NB_UID} /home/$NB_USER/install.sh && \
    chown -R ${NB_UID} /home/$NB_USER/examples
USER $NB_USER
WORKDIR /home/$NB_USER
RUN . /home/$NB_USER/miniconda3/etc/profile.d/conda.sh && \
    conda deactivate && \
    conda env update -q -n notebook-env --file /home/$NB_USER/environment.yml && \
    conda clean -a -y && \
    rm -rf /home/$NB_USER/.cache && \
    rm -rf /tmp/* && \
    rm -rf ${TMPDIR} && \
    mkdir -p ${TMPDIR} && \
    mkdir -p /home/$NB_USER/.cache && \
    find miniconda3/ -type f -name *.pyc -exec rm -f {} \;
#RUN /home/vmuser/miniconda3/envs/notebook-env/bin/Rscript -e "install.packages(c('devtools', 'RColorBrewer', 'BiocManager'),repos='https://cloud.r-project.org/')" && \
#    #/home/vmuser/miniconda3/envs/notebook-env/bin/Rscript -e "update.packages(ask=F)" && \
#    /home/vmuser/miniconda3/envs/notebook-env/bin/Rscript -e "BiocManager::install(c('scran','MAST','monocle','ComplexHeatmap','slingshot'))"
EXPOSE 8888
ENTRYPOINT [ "/usr/local/bin/tini","--","/home/vmuser/entrypoint.sh" ]
CMD [ "notebook" ]
