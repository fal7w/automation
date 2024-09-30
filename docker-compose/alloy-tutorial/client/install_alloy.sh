echo "Remove existing monitoring tools"
sudo apt remove prom* alloy*
sudo apt autoremove -y
sudo systemctl daemon-reload

echo "Install prerequisite package and add grafana repository"
sudo apt-get install -y gpg unzip wget curl
sudo mkdir -p /etc/apt/keyrings/
wget -q -O - https://apt.grafana.com/gpg.key | sudo gpg --dearmor | sudo tee /etc/apt/keyrings/grafana.gpg > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | sudo tee /etc/apt/sources.list.d/grafana.list
sudo apt-get update

echo "Install Grafana Alloy"
sudo apt-get install -y alloy

echo "Enable docker integration (optional)"
sudo usermod -a -G docker alloy
sudo sed -i 's/User=alloy/User=root/' "$ALLOY_SERVICE_FILE"
sudo systemctl daemon-reload
sudo systemctl restart alloy

echo "Enabling Grafana Alloy"
sudo systemctl daemon-reload
sudo systemctl enable alloy
sudo systemctl start alloy
sudo systemctl status alloy
