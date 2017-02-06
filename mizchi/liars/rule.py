import numpy as np
class GameMaster():
    def __init__(self, player=4):
        self.symbols = ['h', 'c', 'd', 's']
        self.number = 13
        self.cardset = []

        perm = np.random.permutation(player)
        for i in range(0, player):
            for j in range(0, self.number):
                self.cardset.append([self.symbols[perm[i]], j])

    def refer_log(self, field):
        self.log = field.log
        return self.log[-1,-1]
 
   def 
