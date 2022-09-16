"""File to do unit tests."""
import unittest

from src.random_code import Random


class RandomTest(unittest.TestCase):
    """Unit test for the example."""

    def test_random(self):
        """Test the random code."""
        liste_a = [i for i in range(10)]
        for a in liste_a:
            new_a = Random(a).get_values()
            self.assertEqual(a, new_a)


if __name__ == "__main__":
    unittest.main()
