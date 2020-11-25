def readFile(fileName):
    f = open(fileName, "r")
    return f

def extractInfoFromFile(fileObject):
    boardSize = int(fileObject.readline())
    nBomb = int(fileObject.readline())
    listBombCoords = []
    for line in fileObject:
        listBombCoords.append(line.strip().split(','))
    fileObject.close()

    stripped_list_bomb_coords = []
    for array in listBombCoords:
        array = [int(x.strip(' ')) for x in array]
        stripped_list_bomb_coords.append(array)
    return boardSize, nBomb, stripped_list_bomb_coords