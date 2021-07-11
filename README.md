Ham PTT
=======

Remote bluethooth PTT switch for ham radio transmitters like Baofeng UV-5R

Problematic
-----------

Board helps to control transmitter from PC. Uart interface turned out to be irreplaceable. During transmit via uart
usb-ttl chip periodically crashes and stops working. Cause is some radio strong interference on USB cable. So Bluetooth
serial protocol stack chosen instead.

Schematic
---------

Host -> (Bluetooth) -> Esp-32 Arduino -> Relay -> Transmitter PTT button

Hardware
--------

- Host PC with Bluetooth (tested Ubuntu 20.04)  
- Esp32 DevKit v1 (or similar esp32)
- Relay shield
- Baofeng UV-5R

Examples
--------
 
- Find BT devices `hcitool scan`
- Python

```python
from hamptt import open_ptt

with open_ptt(bt_addr="A0:B1:C2:D3:E4:F5") as ptt:
    ptt.begin()
    # I.e. play message to transmitter or something else
    ptt.end()
```

Install
-------

* Host PC machine
  
  - Python 3.8 
  - Linux Bluetooth or similar Bluetooth libs for you distributive (required for pybluez)

```shell
sudo apt-get install bluez libbluetooth-dev
python3 -m pip install "hamptt[bt]"
```

* Esp32

  - Upload sketch to your esp-32 via PlatformIO: `pio run -t upload` 
    (NOTE! Check your board configuration, See: https://platformio.org/)
  - Connect pins Esp-32 -> relays
  
      - VVC -> Relay +
      - GND -> Relay -
      - GPIO 15 -> Relay IN

  - Connect relay and audio in/out via Transmitter Cable (you can rebuild your hands-free cable or buy another one).   
    I.e., schematics for Baofeng UV-5R looks like:
  
    ![alt text](https://www.dxzone.com/dx33739/baofeng-mic-pin-out-and-programming-cable-schematics.jpg "Baofeng UV-5R Pins") 
  
    See: https://www.dxzone.com/dx33739/baofeng-mic-pin-out-and-programming-cable-schematics.html

TODO
---- 

- [ ] Migrate to Poetry build