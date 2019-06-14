class Scoring:
    def __init__(self, language=''):
        self.language = language

    def score_letter(self, letter):
        if self.language == 'spanish':
            if letter in ['A', 'E', 'O', 'S', 'I', 'U', 'N', 'L', 'R', 'T']:
                return 1
            elif letter in ['C', 'D', 'G']:
                return 2
            elif letter in ['B', 'M', 'P']:
                return 3
            elif letter in ['F', 'H', 'V', 'Y']:
                return 4
            elif letter in ['J']:
                return 5
            elif letter in ['K', 'LL', 'Ñ', 'Q' 'RR', 'W', 'X']:
                return 8
            elif letter in ['Z']:
                return 10
            else:
                return 0
        else:
            if letter in ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T']:
                return 1
            elif letter in ['D', 'G']:
                return 2
            elif letter in ['B', 'C', 'M', 'P']:
                return 3
            elif letter in ['F', 'H', 'V', 'W', 'Y']:
                return 4
            elif letter in ['K']:
                return 5
            elif letter in ['J', 'X']:
                return 8
            elif letter in ['Q', 'Z']:
                return 10
            else:
                return 0