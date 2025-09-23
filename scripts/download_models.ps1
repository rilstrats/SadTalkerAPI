# Create checkpoints directory
New-Item -Path "./checkpoints" -ItemType Directory

# Download the new links
Invoke-WebRequest -Uri "https://github.com/OpenTalker/SadTalker/releases/download/v0.0.2-rc/mapping_00109-model.pth.tar" -OutFile "./checkpoints/mapping_00109-model.pth.tar"
Invoke-WebRequest -Uri "https://github.com/OpenTalker/SadTalker/releases/download/v0.0.2-rc/mapping_00229-model.pth.tar" -OutFile "./checkpoints/mapping_00229-model.pth.tar"
Invoke-WebRequest -Uri "https://github.com/OpenTalker/SadTalker/releases/download/v0.0.2-rc/SadTalker_V0.0.2_256.safetensors" -OutFile "./checkpoints/SadTalker_V0.0.2_256.safetensors"
Invoke-WebRequest -Uri "https://github.com/OpenTalker/SadTalker/releases/download/v0.0.2-rc/SadTalker_V0.0.2_512.safetensors" -OutFile "./checkpoints/SadTalker_V0.0.2_512.safetensors"

# Create gfpgan/weights directory
New-Item -Path "./gfpgan/weights" -ItemType Directory

# Download the enhancer files
Invoke-WebRequest -Uri "https://github.com/kenwaytis/faster-SadTalker-API/releases/download/0.1.3/alignment_WFLW_4HG.pth" -OutFile "./gfpgan/weights/alignment_WFLW_4HG.pth"
Invoke-WebRequest -Uri "https://github.com/kenwaytis/faster-SadTalker-API/releases/download/0.1.3/detection_Resnet50_Final.pth" -OutFile "./gfpgan/weights/detection_Resnet50_Final.pth"
Invoke-WebRequest -Uri "https://github.com/kenwaytis/faster-SadTalker-API/releases/download/0.1.3/GFPGANv1.4.onnx" -OutFile "./gfpgan/weights/GFPGANv1.4.onnx"
Invoke-WebRequest -Uri "https://github.com/kenwaytis/faster-SadTalker-API/releases/download/0.1.3/parsing_parsenet.pth" -OutFile "./gfpgan/weights/parsing_parsenet.pth"