sudo apt install libboost-dev libboost-log-dev libboost-program-options-dev libssl-dev \
                 cmake \
                 g++ -y

cmake -S . -B build -DCMAKE_BUILD_TYPE=Release \
                    -DENABLE_SYSTEMD=ON \
                    -DENABLE_WEBSOCKET=ON \
                    -DENABLE_NGROK=ON

cmake --build build
sudo cmake --install build