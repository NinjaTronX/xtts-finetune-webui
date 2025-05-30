#!/bin/bash
set -e

echo "🛠️ Updating system and installing required libraries..."
apt-get update
apt-get install -y libegl1 libopengl0 libxcb-cursor0

echo "📦 Installing Python dependencies..."
pip install -r https://raw.githubusercontent.com/daswer123/xtts-finetune-webui/main/requirements.txt
pip install gradio==4.44.1
pip install fastapi==0.103.1
pip install pydantic==2.3.0
pip install accelerate==0.21.0

echo "🧹 Uninstalling incompatible PyTorch versions..."
pip uninstall -y torch torchvision torchaudio

echo "🔥 Installing compatible PyTorch with CUDA 12.1..."
pip install torch==2.1.2 torchvision==0.16.2 torchaudio==2.1.2 --index-url https://download.pytorch.org/whl/cu121

echo "📁 Cloning XTTS fine-tune WebUI repository..."
cd /workspace
git clone https://github.com/NinjaTronX/xtts-finetune-webui.git
cd xtts-finetune-webui

echo "✅ Setup complete. To run the interface, execute:"
echo "python xtts_demo.py --share"
