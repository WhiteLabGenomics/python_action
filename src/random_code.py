"""File for random things."""


class Random:
    def __init__(self, number: int):
        """
        Random initialisation
        :param numer: a random number
        """
        self.number = number

    def get_values(self) -> int:
        """Return random value"""
        return self.number
