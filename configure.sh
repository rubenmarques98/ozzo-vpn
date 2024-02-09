sudo apt install libboost-dev libboost-log-dev libboost-program-options-dev libssl-dev \
                 cmake \
                 g++ -y

sudo cmake -S /root -B build -DCMAKE_BUILD_TYPE=Release \
                    -DENABLE_SYSTEMD=ON \
                    -DENABLE_WEBSOCKET=ON \
                    -DENABLE_NGROK=ON

sudo cmake --build build
sudo cmake --install build