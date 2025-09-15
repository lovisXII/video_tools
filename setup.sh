wget https://web9001.nomachine.com/download/9.1/Linux/nomachine_9.1.24_6_amd64.deb
sudo dpkg -i nomachine_9.1.24_6_amd64.deb

sudo apt install xrdp
sudo systemctl enable xrdp
sudo systemctl start xrdp
cd ~ && mkdir ffsubsync && cd ffsubsync
python3 -m venv .venv
source .venv/bin/activate
pip install ffsubsync

# Subtitles generation
git clone https://github.com/cyberofficial/Synthalingua.git
