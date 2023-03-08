"""Module to perform unit tests."""
from src.sample_code import Sample


class TestSample:
    """Object to collect unit test for the example class."""

    def test_sample(self):
        """Test the sample code object."""
        list_a = [i for i in range(10)]

        for a in list_a:
            new_a = Sample(a).get_values()
            assert a == new_a
