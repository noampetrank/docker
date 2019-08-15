FROM ubuntu

# Install packages for python3 and nodejs
RUN apt-get update && apt-get update
RUN apt-get install openssl -y
RUN apt-get install libssl-dev -y
RUN apt-get install libreadline-gplv2-dev -y
RUN apt-get install libncursesw5-dev -y
RUN apt-get install libsqlite3-dev -y
RUN apt-get install tk-dev -y
RUN apt-get install libgdbm-dev -y
RUN apt-get install libc6-dev -y
RUN apt-get install libbz2-dev -y
RUN apt-get install curl -y
RUN apt-get install software-properties-common -y
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install nodejs --user -y

# Python2 stuff
RUN pip2 install ipython git+https://github.com/drorspei/ipython-autoimport git+https://github.com/drorspei/ipython-suggestions plotly qgrid --user
RUN python2 -m ipython_autoimport >> $(ipython locate profile)/ipython_config.py
RUN python2 -m ipython_suggestions >> $(ipython locate profile)/ipython_config.py

# Install pyenv and python3.7.3 environment
RUN curl https://pyenv.run | bash
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH
RUN pyenv install 3.7.3
RUN eval "$(pyenv init -)"
RUN eval "$(pyenv virtualenv-init -)"
RUN pyenv virtualenv 3.7.3 jlab

# Install jupyter lab and fix python2 kernel file
RUN $HOME/.pyenv/versions/jlab/bin/pip install jupyterlab ipympl ipyparallel
RUN cp kernel.json `$HOME/.pyenv/versions/jlab/bin/jupyter kernelspec list | grep python2 | awk '{print $2}'`/kernel.json

# Install extensions
RUN $HOME/.pyenv/versions/jlab/bin/jupyter labextension install @jupyter-widgets/jupyterlab-manager @jupyterlab/plotly-extension jupyter-matplotlib jupyterlab-drawio qgrid
RUN $HOME/.pyenv/versions/jlab/bin/jupyter nbextension enable --py widgetsnbextension

# Set alias
RUN echo 'alias jlab="$HOME/.pyenv/versions/jlab/bin/jupyter lab"' >> $HOME/.bashrc
