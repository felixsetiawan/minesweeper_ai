from readfile import readFile, extractInfoFromFile
import clips

class tile:
    def __init__(self, value) -> None:
        self.known = False
        self.value = None

f = readFile('input.txt')
boardSize, nBomb, listBombCoords = extractInfoFromFile(f)

matriks = [[tile(None)] * boardSize] * boardSize

print(matriks)