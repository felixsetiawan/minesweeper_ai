from readfile import readFile, extractInfoFromFile
import clips


class tile:
    def __init__(self, value) -> None:
        self.known = False
        self.value = None


boardSize, nBomb, listBombCoords = extractInfoFromFile("input.txt")

matriks = [[tile(None)] * boardSize] * boardSize

print(matriks)