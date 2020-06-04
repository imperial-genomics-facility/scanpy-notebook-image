[![DockerPulls](https://img.shields.io/docker/pulls/imperialgenomicsfacility/scanpy-notebook-image.svg)](https://registry.hub.docker.com/r/imperialgenomicsfacility/scanpy-notebook-image)
[![DockerStars](https://img.shields.io/docker/stars/imperialgenomicsfacility/scanpy-notebook-image.svg)](https://registry.hub.docker.com/r/imperialgenomicsfacility/scanpy-notebook-image)
[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/imperial-genomics-facility/scanpy-notebook-image/master?urlpath=lab)
[![nbviewer](https://img.shields.io/badge/launch-nbviewer-coral)](https://nbviewer.jupyter.org/github/imperial-genomics-facility/scanpy-notebook-image/tree/master/)
# Notebook container image for running single cell data analysis using scanpy
A repository for keeping conda env and docker image file for running single cell analysis using scanpy. Example notebooks are kept at `examples` dir and template notebooks are kept in `templates` dir.

## Before using examples notebooks

List of prerequisites for using these example notebooks:

* [JupyterLab Documentation](https://jupyterlab.readthedocs.io/en/latest/index.html)
* [Single cell analysis using Cellranger (10X genomics)](https://support.10xgenomics.com/single-cell-gene-expression/software/pipelines/latest/what-is-cell-ranger)
* [Scanpy package for single cell data analysis](https://icb-scanpy.readthedocs-hosted.com/en/stable/)

## List of example notebooks:

* [Preprocessing and clustering 3k PBMCs from a Healthy Donor (10x Genomics) v0.0.3 :](https://nbviewer.jupyter.org/github/imperial-genomics-facility/scanpy-notebook-image/blob/master/examples/Clustering_3K_PBMCs_v0.0.3.ipynb) [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/imperial-genomics-facility/scanpy-notebook-image/master?urlpath=lab%2Ftree%2Fexamples%2FClustering_3K_PBMCs_v0.0.3.ipynb)

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
