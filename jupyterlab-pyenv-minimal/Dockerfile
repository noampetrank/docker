FROM ubuntu
RUN apt-get update && apt-get update
RUN apt-get install openssl -y
RUN apt-get install libssl-dev -y
RUN apt-get install libreadline-gplv2-dev -y
RUN apt-get install libncursesw5-dev -y
RUN apt-get install libsqlite3-dev -y
RUN apt-get install libgdbm-dev -y
RUN apt-get install libc6-dev -y
RUN apt-get install libbz2-dev -y
RUN apt-get install curl -y
RUN apt-get install software-properties-common -y
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -E -
RUN apt-get install nodejs -y
RUN apt-get install python-pip -y
RUN apt-get install git -y
RUN pip2 install ipython git+https://github.com/drorspei/ipython-autoimport git+https://github.com/drorspei/ipython-suggestions plotly qgrid
RUN python2 -m ipython_autoimport >> $(ipython locate profile)/ipython_config.py
RUN python2 -m ipython_suggestions >> $(ipython locate profile)/ipython_config.py
RUN curl https://pyenv.run | bash -E -
ENV PYENV_ROOT=/root/.pyenv
ENV PATH=/root/.pyenv/shims:/root/.pyenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN apt-get install zlib1g-dev -y
RUN apt-get install libffi-dev -y
RUN pyenv install 3.7.3
RUN eval "$(pyenv init -)"
RUN eval "$(pyenv virtualenv-init -)"
RUN pyenv virtualenv 3.7.3 jlab
RUN $HOME/.pyenv/versions/jlab/bin/pip install jupyterlab ipympl ipyparallel
ADD ./kernel.json /root/kernel.json
RUN mv /root/kernel.json `/root/.pyenv/versions/jlab/bin/jupyter kernelspec list | grep python2 | awk '{print $2}'`/kernel.json
RUN /root/.pyenv/versions/jlab/bin/jupyter labextension install @jupyter-widgets/jupyterlab-manager @jupyterlab/plotly-extension jupyter-matplotlib jupyterlab-drawio qgrid
RUN /root/.pyenv/versions/jlab/bin/jupyter nbextension enable --py widgetsnbextension
RUN echo '/root/.pyenv/versions/jlab/bin/jupyter lab --allow-root --ip=0.0.0.0' >> /root/jlab.sh
RUN chmod 755 /root/jlab.sh
CMD ["sh" "/root/jlab.sh"]
