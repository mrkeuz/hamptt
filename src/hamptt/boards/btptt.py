import logging
from threading import Lock

import bluetooth  # type: ignore
from func_timeout import func_set_timeout  # type: ignore

from hamptt.boards.abstptt import AbstractPtt

_logger = logging.getLogger(__name__)


class BtPtt(AbstractPtt):
    _send_lock: Lock = Lock()

    def __init__(self, bd_addr):
        self.sock = bluetooth.BluetoothSocket(bluetooth.RFCOMM)
        port = 1
        self.sock.connect((bd_addr, port))

    def begin(self):
        recv = self._send_recv("t")
        if recv != b"TX":
            raise ConnectionError(f"Cannot start transmit. Transmitter return '{recv}', but expected 'TX'")

    def end(self):
        recv = self._send_recv("r")
        if recv != b"RX":
            raise ConnectionError(f"Cannot end transmit. Transmitter return '{recv}', but expected 'RX'")

    @func_set_timeout(2.5)
    def _send_recv(self, data):
        try:
            self._send_lock.acquire()

            self.sock.send(data)
            answer = b""
            answer += self.sock.recv(1500)
            return answer
        finally:
            self._send_lock.release()

    @func_set_timeout(2.5)
    def _send(self, data):
        try:
            self._send_lock.acquire()
            self.sock.send(data)
        finally:
            self._send_lock.release()

    def close(self):
        try:
            self.end()
            self._send_lock.acquire()
            _logger.debug("Close socket")
            self.sock.close()
        finally:
            self._send_lock.release()

    def ping(self):
        _logger.debug("Ping BT PTT")
        recv = self._send_recv("C")
        if recv != b"WORK":
            raise ConnectionError(f"Cannot ping device. Got answer '{recv}', but expected 'WORK'")


if __name__ == '__main__':
    ptt = BtPtt("00:00:00:00:00:00")
