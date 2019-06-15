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
        self.subject = Scoring('spanish')

    def test_one_point(self):
        for letter in ['A', 'E', 'O', 'S', 'I', 'U', 'N', 'L', 'R', 'T']:
            with self.subTest(letter=letter):
                self.assertEqual(self.subject.score_letter(letter), 1)

    def test_two_point(self):
        for letter in ['C', 'D', 'G']:
            with self.subTest(letter=letter):
                self.assertEqual(self.subject.score_letter(letter), 2)

    def test_three_point(self):
        for letter in ['B', 'M', 'P']:
            with self.subTest(letter=letter):
                self.assertEqual(self.subject.score_letter(letter), 3)

    def test_four_point(self):
        for letter in ['F', 'H', 'V', 'Y']:
            with self.subTest(letter=letter):
                self.assertEqual(self.subject.score_letter(letter), 4)

    def test_six_point(self):
        for letter in ['J']:
            with self.subTest(letter=letter):
                self.assertEqual(self.subject.score_letter(letter), 6)

    def test_eight_point(self):
        for letter in ['K', 'LL', 'Ñ', 'Q', 'RR', 'W', 'X']:
            with self.subTest(letter=letter):
                self.assertEqual(self.subject.score_letter(letter), 8)

    def test_ten_point(self):
        for letter in ['Z']:
            with self.subTest(letter=letter):
                self.assertEqual(self.subject.score_letter(letter), 10)



if __name__ == '__main__':
    unittest.main()
