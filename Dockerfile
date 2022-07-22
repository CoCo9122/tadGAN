FROM python:3.6-slim-buster

WORKDIR /app/src/

RUN apt-get update && apt-get -y install gcc libmariadb-dev

COPY ./requirements.txt /app/

RUN pip install --upgrade pip

RUN pip install Cython
RUN pip install jupyterlab
RUN pip install jupyterlab_tabnine
RUN pip install numpy
RUN pip install matplotlib
RUN pip install tensorflow
RUN pip install orion-ml

CMD ["jupyter", "lab", "--port", "8080", "--ip=0.0.0.0", "--allow-root", "--no-browser", "--NotebookApp.token=''"]