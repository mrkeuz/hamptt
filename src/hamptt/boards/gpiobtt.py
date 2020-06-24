from hamptt.boards.abstptt import AbstractPtt


class GpioPtt(AbstractPtt):
    def __init__(self, gpio):
        self.gpio = gpio
        pass

    def begin(self):
        # GPIO.pin(self.gpio, HIGH)
        pass

    def end(self):
        # GPIO.pin(self.gpio, LOW)
        pass

    def close(self):
        pass
