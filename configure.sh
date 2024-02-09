sudo cp -r ./* ~/

sudo apt install libboost-dev \
                 libboost-log-de \
                 vlibboost-program-options-dev \
                 libssl-dev \
                 cmake \
                 g++

cmake -S . -B build -DCMAKE_BUILD_TYPE=Release \
                    -DENABLE_SYSTEMD=ON \
                    -DENABLE_WEBSOCKET=ON \
                    -DENABLE_NGROK=ON

cmake --build build
sudo cmake --install build