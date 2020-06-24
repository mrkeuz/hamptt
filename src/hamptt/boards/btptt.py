import logging

import bluetooth  # type: ignore

from func_timeout import func_set_timeout # type: ignore

from hamptt.boards.abstptt import AbstractPtt

_logger = logging.getLogger(__name__)


class BtPtt(AbstractPtt):
    def __init__(self, bd_addr):
        self.sock = bluetooth.BluetoothSocket(bluetooth.RFCOMM)
        port = 1
        self.sock.connect((bd_addr, port))
        pass

    def begin(self):
        recv = self._send_recv("t")
        if recv != b"TX":
            raise BaseException(f"Cannot start transmit. Transmitter return '{recv}', but expected 'TX'")

    def end(self):
        recv = self._send_recv("r")
        if recv != b"RX":
            raise BaseException(f"Cannot end transmit. Transmitter return '{recv}', but expected 'RX'")

    @func_set_timeout(2.5)
    def _send_recv(self, data):
        self.sock.send(data)
        answer = b""
        answer += self.sock.recv(1500)
        return answer

    def _send(self, data):
        self.sock.send(data)

    def close(self):
        _logger.debug("Close socket")
        self.sock.close()


if __name__ == '__main__':
    ptt = BtPtt("00:00:00:00:00:00")
