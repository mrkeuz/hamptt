from hamptt import open_ptt
from hamptt.boards.btptt import BtPtt
from tests import BT_ADDR_1


def test_ptt():
    ptt: BtPtt
    with open_ptt(br_addr=BT_ADDR_1) as ptt:
        ptt.begin()

        ptt.end()

