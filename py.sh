cd /notebooks
pip install --upgrade git+https://github.com/huggingface/diffusers.git 
pip install -U transformers accelerate scipy
pip install flax==0.5.0 --no-deps
pip install msgpack rich optax accelerate ftfy scipy
pip install ipywidgets
jupyter nbextension enable --py widgetsnbextension
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui
mkdir outputs
pip uninstall -y torch torchvision torchaudio
pip3 install torch torchvision torchaudio --no-cache-dir --index-url https://download.pytorch.org/whl/cu118

# Launch the Stable Diffusion Web UI. 
# Be sure to hash out whichever you are not using.
cd /notebooks/stable-diffusion-webui

## Launch Web UI for Stable Diffusion v2 models. Note: this prevents users from using checkpoints and embeddings trained on v1-X models.
python launch.py --share --gradio-auth dako:Lyy2629w. --enable-insecure-extension-access --config ~/../datasets/stable-diffusion-classic-v2/768-v-ema.yaml --ckpt ~/../datasets/pps/models/chilloutmix.safetensors --ckpt-dir ~/../datasets/pps/models --lora-dir ~/../notebooks/lora

## Launch Web UI for Stable Diffusion v1-x models.
#!python launch.py --share --ckpt ../../datasets/stable-diffusion-classic/SDv1.5.ckpt


cd /notebooks/stable-diffusion-webui/extensions/
rm -rf adetailer

git clone https://github.com/Bing-su/adetailer

cd /notebooks/stable-diffusion-webui/extensions/
rm -rf adetailer
mkdir /notebooks/stable-diffusion-webui/extensions/adetailer
cd /notebooks/stable-diffusion-webui/extensions/adetailer
wget https://github.com/Bing-su/adetailer/archive/refs/tags/v23.7.8.zip -O 111.zip
unzip 111.zip
cd /notebooks/stable-diffusion-webui/extensions/adetailer/adetailer-23.7.8
mv * ../
rm -rf /notebooks/stable-diffusion-webui/extensions/adetailer/adetailer-23.7.8
rm /notebooks/stable-diffusion-webui/extensions/adetailer/111.zip
