class Scoring:
    def score_letter(self, letter):
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
