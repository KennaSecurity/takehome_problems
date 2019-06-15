class Scoring:
    def __init__(self, language='english'):
        self.language = language
        self.englookup = {'A': 1, 'E': 1, 'I': 1, 'O': 1, 'U': 1, 'L': 1, 'N': 1, 'R': 1, 'S': 1,
        'T': 1, 'D': 2, 'G': 2, 'B': 3, 'C': 3, 'M': 3, 'P': 3, 'F': 4, 'H': 4, 'V': 4, 'W': 4, 'Y': 4,
        'K': 5, 'J': 8, 'X': 8, 'Q': 10, 'Z': 10}
        self.splookup = {'A': 1, 'E': 1, 'O': 1, 'S': 1, 'I': 1, 'U': 1, 'N': 1, 'L': 1, 'R': 1, 'T': 1,
        'C': 2, 'D': 2, 'G': 2, 'B': 3, 'M': 3, 'P': 3, 'F': 4, 'H': 4, 'V': 4, 'Y': 4, 'J': 6, 'K': 8,
        'LL': 8, 'Ñ': 8, 'Q': 8, 'RR': 8, 'W': 8, 'X': 8, 'Z': 10}

    def score_letter(self, letter):
        if self.language == 'english':
            if letter in self.englookup:
                return self.englookup[letter]
            else:
                return 0
        elif self.language == 'spanish':
            if letter in self.splookup:
                return self.splookup[letter]
            else:
                return 0
        else:
            return "Unsupported Language"