import logging
from contextlib import contextmanager
from typing import Generator

from hamptt.boards.abstptt import AbstractPtt
from hamptt.utils import RepeatedTimer

_logger = logging.getLogger(__name__)


@contextmanager
def _bt_ptt(bt_addr: str) -> Generator[AbstractPtt, None, None]:
    from hamptt.boards.btptt import BtPtt
    ptt_obj = BtPtt(bt_addr)
    pinger = RepeatedTimer(1, ptt_obj.ping)
    pinger.start()

    try:
        yield ptt_obj

    finally:
        _logger.debug('Closing bt ptt')
        pinger.stop()
        ptt_obj.end()
        ptt_obj.close()


@contextmanager
def _gpio_ptt(gpio: str) -> Generator[AbstractPtt, None, None]:
    from hamptt.boards.gpiobtt import GpioPtt
    ptt_obj = GpioPtt(gpio)
    try:
        yield ptt_obj

    finally:
        _logger.debug('Closing gpio ptt')
        ptt_obj.end()
        ptt_obj.close()


def retry_if(ex: Exception):
    if isinstance(ex, KeyboardInterrupt):
        return False
    return True


def open_ptt(bt_addr: str = "", gpio: str = "") -> Generator[AbstractPtt, None, None]:
    """
    Entry point for all ptt implementations
    """
    assert bt_addr or gpio
    assert not (bt_addr and gpio)

    if bt_addr:
        return _bt_ptt(bt_addr)

    elif gpio:
        return _gpio_ptt(gpio)
