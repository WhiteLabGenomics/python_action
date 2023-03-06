"""Example file for random things."""


class Random:
    """Example class for random things."""

    def __init__(self, number: int):
        """
        Random initialisation

        Parameters
        ----------
        number: int
            a random number
        """
        self.number = number

    def get_values(self) -> int:
        """Return random value

        Returns
        -------
        int
        A random integer number"""
        return self.number
