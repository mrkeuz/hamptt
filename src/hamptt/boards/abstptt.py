from abc import ABCMeta, abstractmethod


class AbstractPtt(metaclass=ABCMeta):
    @abstractmethod
    def begin(self):
        pass

    @abstractmethod
    def end(self):
        pass

    @abstractmethod
    def close(self):
        pass
