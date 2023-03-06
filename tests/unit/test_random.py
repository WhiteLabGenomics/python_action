"""Module to perform unit tests."""
from src.random_code import Random


class RandomTest:
    """Object to collect unit test for the example class."""

    def test_random(self):
        """Test the random code object."""
        list_a = [i for i in range(10)]

        for a in list_a:
            new_a = Random(a).get_values()
            assert a == new_a
