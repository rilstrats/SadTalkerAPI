FROM nvidia/cuda:11.6.2-runtime-ubuntu20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update -y
RUN apt install -y python3 python-is-python3 pip ffmpeg
RUN apt clean && rm -rf /var/lib/apt/lists/*

RUN pip install torch==1.13.1+cu116 torchvision==0.14.1+cu116 torchaudio==0.13.1 \
    --extra-index-url https://download.pytorch.org/whl/cu116

RUN pip install flatbuffers numpy packaging protobuf sympy onnxruntime-gpu==1.14

WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt

RUN pip install fastapi[all] loguru httpcore==0.15
RUN pip install ffprobe-python
RUN rm -rf /root/.cache/pip/*

COPY checkpoints checkpoints
COPY gfpgan gfpgan
COPY images images
COPY src src
COPY main.py .

CMD ["uvicorn", "main:app", "--reload", "--port", "10364", "--host", "0.0.0.0"]
