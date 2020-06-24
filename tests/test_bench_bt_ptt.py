import time

import pytest  # type: ignore

import hamptt.boards.btptt
from tests import BT_ADDR_1

max_time = 5


@pytest.mark.benchmark(
    group="group-name",
    min_time=0.1,
    max_time=max_time,
    min_rounds=5,
    timer=time.time,
    disable_gc=True,
    warmup=False
)
def test_send_recv(benchmark):
    ptt = hamptt.boards.btptt.BtPtt(BT_ADDR_1)

    try:
        @benchmark
        def fun():
            ptt._send_recv("c")
    finally:
        ptt.close()
        time.sleep(1)


@pytest.mark.benchmark(
    group="group-name",
    min_time=0.1,
    max_time=max_time,
    min_rounds=5,
    timer=time.time,
    disable_gc=True,
    warmup=False
)
def test_send(benchmark):
    ptt1 = BtPtt(BT_ADDR_1)

    try:
        @benchmark
        def fun():
            ptt1._send("l")
    finally:
        ptt1.close()
        time.sleep(1)


@pytest.mark.benchmark(
    group="group-name",
    min_time=0.1,
    max_time=max_time,
    min_rounds=5,
    timer=time.time,
    disable_gc=True,
    warmup=False
)
def test_send_batch(benchmark):
    ptt1 = BtPtt(BT_ADDR_1)

    try:
        @benchmark
        def fun():
            ptt1._send("l" * 1000000)
    finally:
        ptt1.close()
        time.sleep(1)
