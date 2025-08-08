if [ "$(id -u)" != "0" ]; then
    echo " root goni"
    exit 1
fi


echo "42"
apt update
apt upgrade -y
apt install -y git nodejs npm openjdk-17-jre screen wget

echo "webmin maksim sosal"
curl -o webmin-setup-repo.sh https://raw.githubusercontent.com/webmin/webmin/master/webmin-setup-repo.sh
sh webmin-setup-repo.sh
apt update
apt-get install webmin --install-recommends

echo "kubek rubic"
cd /opt
git clone https://github.com/Seeroy/kubek-minecraft-dashboard.git
cd kubek-minecraft-dashboard
npm install

echo "AUTO SOSAL"
cat > /etc/systemd/system/kubek.service <<EOL
[Unit]
Description=Kubek Minecraft Panel
After=network.target

[Service]
Type=simple
User=minecraft
WorkingDirectory=/opt/kubek-minecraft-dashboard
ExecStart=/usr/bin/npm start
Restart=always
RestartSec=10
Environment=PATH=/usr/bin:/usr/local/bin
Environment=NODE_ENV=production

[Install]
WantedBy=multi-user.target
EOL

echo "portososal"
curl -SsL https://playit-cloud.github.io/ppa/key.gpg | gpg --dearmor | tee /etc/apt/trusted.gpg.d/playit.gpg >/dev/null
echo "deb [signed-by=/etc/apt/trusted.gpg.d/playit.gpg] https://playit-cloud.github.io/ppa/data ./" | tee /etc/apt/sources.list.d/playit-cloud.list
apt update
apt install playit

systemctl daemon-reload
systemctl enable minecraft.service
systemctl enable kubek.service
systemctl enable playit.service

echo "1488"
echo "tilox"
echo "sosi"

playit