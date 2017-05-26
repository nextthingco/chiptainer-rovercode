FROM ntc-registry.githost.io/nextthingco/chiptainer_python_io:master

RUN apk update && \
apk add git &&\
apk add ffmpeg &&\
apk add g++ && \
apk add gcc && \
apk add make && \
apk add python && \
apk add nginx && \
apk add python-dev && \
apk add py-setuptools && \
apk add py2-pip && \
apk add py2-yaml

RUN pip install flask flask-socketio gevent uwsgi "docutils<0.13.1" Sphinx==1.4.8 sphinx_rtd_theme pytest-flask pytest-cov mock requests responses pylint==1.6.5 prospector==0.12.4 flask-cors python-dotenv

EXPOSE 80

ADD www /var/www/rovercode/www
ADD nginx-site /etc/nginx/sites-enabled/rovercode

WORKDIR /etc/nginx/sites-enabled
RUN rm -f default

WORKDIR /var/www/rovercode
RUN git clone -b uwsgi-2.0 https://github.com/unbit/uwsgi.git
WORKDIR /var/www/rovercode/uwsgi
RUN python uwsgiconfig.py --build core
RUN python uwsgiconfig.py --plugin plugins/python core
RUN python uwsgiconfig.py --plugin plugins/corerouter core
RUN python uwsgiconfig.py --plugin plugins/http core
RUN python uwsgiconfig.py --plugin plugins/gevent core
RUN cp uwsgi /var/www/rovercode/www
RUN cp python_plugin.so /var/www/rovercode/www
RUN cp corerouter_plugin.so /var/www/rovercode/www
RUN cp http_plugin.so /var/www/rovercode/www
RUN cp gevent_plugin.so /var/www/rovercode/www
WORKDIR /var/www/rovercode
RUN rm -rf uwsgi
WORKDIR /var/www/rovercode/www
RUN echo '/etc/init.d/nginx start && uwsgi rovercode.ini --plugins python,corerouter,http,gevent --gevent 1000 --http-websockets' > /usr/bin/run.sh
ENTRYPOINT ["bash", "/usr/bin/run.sh"]

