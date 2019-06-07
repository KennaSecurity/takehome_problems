import unittest

from scoring import Scoring


class TestEnglishScoring(unittest.TestCase):
    def setUp(self):
        self.subject = Scoring()

    def test_one_point(self):
        for letter in ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T']:
            with self.subTest(letter=letter):
                self.assertEqual(self.subject.score_letter(letter), 1)

    def test_two_points(self):
        for letter in ['D', 'G']:
            with self.subTest(letter=letter):
                self.assertEqual(self.subject.score_letter(letter), 2)

    def test_three_points(self):
        for letter in ['B', 'C', 'M', 'P']:
            with self.subTest(letter=letter):
                self.assertEqual(self.subject.score_letter(letter), 3)

    def test_four_points(self):
        for letter in ['F', 'H', 'V', 'W', 'Y']:
            with self.subTest(letter=letter):
                self.assertEqual(self.subject.score_letter(letter), 4)

    def test_five_points(self):
        for letter in ['K']:
            with self.subTest(letter=letter):
                self.assertEqual(self.subject.score_letter(letter), 5)

    def test_eight_points(self):
        for letter in ['J', 'X']:
            with self.subTest(letter=letter):
                self.assertEqual(self.subject.score_letter(letter), 8)

    def test_ten_points(self):
        for letter in ['Q', 'Z']:
            with self.subTest(letter=letter):
                self.assertEqual(self.subject.score_letter(letter), 10)


class TestSpanishScoring(unittest.TestCase):
    def setUp(self):
        self.subject = Scoring()


if __name__ == '__main__':
    unittest.main()
