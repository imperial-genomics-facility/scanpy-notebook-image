[![DockerPulls](https://img.shields.io/docker/pulls/imperialgenomicsfacility/scanpy-notebook-image.svg)](https://registry.hub.docker.com/r/imperialgenomicsfacility/scanpy-notebook-image)
[![DockerStars](https://img.shields.io/docker/stars/imperialgenomicsfacility/scanpy-notebook-image.svg)](https://registry.hub.docker.com/r/imperialgenomicsfacility/scanpy-notebook-image)
![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/imperialgenomicsfacility/scanpy-notebook-image)
[![](https://images.microbadger.com/badges/image/imperialgenomicsfacility/scanpy-notebook-image.svg)](https://microbadger.com/images/imperialgenomicsfacility/scanpy-notebook-image)
[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/imperial-genomics-facility/scanpy-notebook-image/master?urlpath=lab)
[![nbviewer](https://img.shields.io/badge/launch-nbviewer-coral)](https://nbviewer.jupyter.org/github/imperial-genomics-facility/scanpy-notebook-image/tree/master/)
# Notebook container image for running single cell data analysis using scanpy
A repository for keeping conda env and docker image file for running single cell analysis using scanpy. Example notebooks are kept at `examples` dir and template notebooks are kept in `templates` dir.

## Installed packages

 * Python v3.6.9
 * Scanpy v1.4.5
 * Scran v1.10.1
 * Leidenalg v0.7.0
 * MAST v1.12.0
 * Monocle v2.14.0
 * Clusterexperiment v2.6.0
 * Slingshot v1.4.0

 Please check the `environment.yml` file for more details.

## Explore notebooks

Explore the example notebooks from this repo in `examples` dir using nbviewer: <p/>
  [![nbviewer](https://img.shields.io/badge/launch-nbviewer-coral)](https://nbviewer.jupyter.org/github/imperial-genomics-facility/scanpy-notebook-image/tree/master/)

## Run notebooks

### Using binder

Launce notebooks in binder for exploratory analysis: <p/>
[![binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/imperial-genomics-facility/scanpy-notebook-image/master?urlpath=lab)

### Using Docker

* Install Docker following these instructions: [Docker Engine overview](https://docs.docker.com/install/)
* Use the following command to pull docker image from Docker hub

  * Pull the latest image
  <pre><code>docker pull imperialgenomicsfacility/scanpy-notebook-image
  </code></pre>

  * Pull a specific release <p/>
  <pre><code>docker pull imperialgenomicsfacility/scanpy-notebook-image:release-xyz
  </code></pre>

* Run notebook container in docker

<pre><code>docker run
  -p 8888:8888 
  -v /path/:/tmp 
  imperialgenomicsfacility/scanpy-notebook-image:tag
</code></pre>

### Using Singularity

* Build singularity image

<pre><code>singularity 
  build 
  scanpy-notebook-image.sif 
  docker://imperialgenomicsfacility/scanpy-notebook-image
</code></pre>

* Run jupyter notebook or nbconvert from singularity container

<pre><code>singularity
  run
  --bind /path:/tmp
  scanpy-notebook-image.sif
    jupyter nbconvert /tmp/notebook.ipynb --execute
</code></pre>