"""Example file for template."""


class Sample:
    """Example class"""

    def __init__(self, number: int):
        """
        Identical initialisation

        Parameters
        ----------
        number: int
            a number
        """
        self.number = number

    def get_values(self) -> int:
        """Return value

        Returns
        -------
        int
            The memorised integer number"""
        return self.number
