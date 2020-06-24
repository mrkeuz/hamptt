=============
Ham radio PTT
=============
 
Implementations of Push-To-Tank circuit for ham radio transmitters like Baofeng UV-5R

Schematic
---------

Host -> (Bluetooth) -> Esp-32 Arduino -> Relay -> Transmitter PTT button

Considerations
--------------

Using Bluetooth stack over uart considered to avoid hangs builtin esp-32 usb-to-uart controller during transmit some data.
Cause is some radio interference on usb cable.

Hardware
--------

* `Esp32 DevKit v1 <https://docs.zerynth.com/latest/official/board.zerynth.doit_esp32/docs/index.html>`_
* Relay shield

Examples
________

Command line ::

    TBD

From python

* Bluetooth PTT::

    from hamptt import open_ptt

    with open_ptt(bt_addr="A0:B1:C2:D3:E4:F5") as ptt
        ptt.begin()
        # I.e. play sound to transmitter or something else
        ptt.end()

* GPIO PTT ::

    TBD


Installation
------------

Host machine:

* Linux Bluetooth or similar for you distributive (required for pyBluez) ::

    sudo apt-get install bluez libbluetooth-dev

* Python ::

    TBD

Hardware:

* Upload sketch via ArdiuinoIde to your esp-32::

    src/arduiono/ptt_firmware_bt/ptt_firmware_bt.ino

* Connect pins Esp-32 -> relays

  - VVC      -> Relay +
  - GND      -> Relay -
  - GPIO 15  -> Relay IN

* Connect relay and audio in/out to Transmitter Cable.
  You can rebuild your hands-free cable or buy another one. I.e. Schematics for Baofeng looks like:

  .. image:: https://www.dxzone.com/dx33739/baofeng-mic-pin-out-and-programming-cable-schematics.jpg

  See: https://www.dxzone.com/dx33739/baofeng-mic-pin-out-and-programming-cable-schematics.html

Enjoy!