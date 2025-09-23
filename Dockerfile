FROM pytorch/pytorch:2.7.1-cuda12.8-cudnn9-runtime

RUN apt-get -qq update && \
    apt-get -qq install --no-install-recommends ffmpeg && \
    apt-get -qq clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY requirements.txt .
RUN pip install --quiet -r requirements.txt && \
    rm -rf /root/.cache/pip/*

COPY checkpoints checkpoints
COPY gfpgan gfpgan
COPY images images
COPY src src
COPY main.py .

CMD ["uvicorn", "main:app", "--reload", "--port", "10364", "--host", "0.0.0.0"]
