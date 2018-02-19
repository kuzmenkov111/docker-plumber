FROM rocker/r-base

# Add a non-root user who will launch the apps
RUN useradd plumber \
	&& mkdir /home/plumber \
	&& chown plumber:plumber /home/plumber \
	&& addgroup plumber staff
	
RUN apt-get update -qq && apt-get install -y \
  git-core \
  libssl-dev \
  libcurl4-gnutls-dev


  
# Add some default app. @TODO Should plumbapp.sh not be an R script?
ADD demo.R /apps/demo.R
ADD plumbapp.sh /plumbapp.sh
RUN chmod 700 /plumbapp.sh \
  && chgrp -R staff /apps

# Plumb your app into 8000
EXPOSE 8000

CMD ["/plumbapp.sh", "/apps/demo.R"]
