from util import readFile, extractInfoFromFile
import clips

class tile:
    def __init__(self, value) -> None:
        self.known = False
        self.value = None

filename = input("file name: ")
boardSize, nBomb, listBombCoords = extractInfoFromFile("testcase/" + filename)

matriks = [[tile(None)] * boardSize] * boardSize

print(boardSize)
print(nBomb)
print(listBombCoords)