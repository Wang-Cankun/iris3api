FROM satijalab/seurat:latest
LABEL maintainer="Cankun Wang <cankun.wang@osumc.edu>"

WORKDIR /tmp

# Ubuntu dependency found at /rocker_scripts/install_tidyverse.sh
RUN NCPUS=${NCPUS:-1}
RUN set -e
RUN apt-get update -qq && apt-get -y --no-install-recommends install \
	libxml2-dev \
	libcairo2-dev \
	libgit2-dev \
	default-libmysqlclient-dev \
	libpq-dev \
	libsasl2-dev \
	libsqlite3-dev \
	libssh2-1-dev \
	unixodbc-dev

# Found more libraries need to be installed during my debugging
RUN apt-get -y --no-install-recommends install \
	libbz2-dev \
	liblzma-dev \
	libsodium-dev

###############
# HTSlib 1.11.0#
# Folk from https://github.com/chrisamiller/docker-r-seurat/blob/master/Dockerfile
###############
#ENV HTSLIB_INSTALL_DIR=/opt/htslib

RUN wget --no-check-certificate https://github.com/samtools/htslib/archive/1.11.0.zip && \
	unzip 1.11.0.zip && \
	rm 1.11.0.zip && \
	cd /tmp/htslib-1.11.0 && \
	#./configure  --enable-plugins --prefix=$HTSLIB_INSTALL_DIR && \
	make && \
	make install && \ 
	cp -R * /usr/lib/

# Install Bioconductor dependencies
RUN R -e 'BiocManager::install(c("JASPAR2020","GO.db", "GenomicAlignments", "ggbio", "biovizBase"), Ncpu = 2L)'

# Install CRAN dependencies

RUN install2.r --error --skipinstalled -r $CRAN \
	Polychrome \
	qs \
	plumber \
	vroom \
	lintr \
	gert \
	Signac

# Install GitHub R dependencies

RUN installGithub.r -u FALSE\
	Wang-Cankun/iris3api@master

# Clean up installation
RUN rm -rf /tmp/* 
RUN rm -rf /var/lib/apt/lists/*

# Set up working directory

RUN MKDIR /data
WORKDIR /data

# Expose plumber API port inside docker
# May not needed for pure R package
# EXPOSE 8000

# Start R API server

ENTRYPOINT ["R"]

# Test running
# docker run --rm -d --name satijalab/seurat:latest
# docker run --rm -d --name wangcankun100/iris3api