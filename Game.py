from util import readFile, extractInfoFromFile
import clips

def init_map(self):
    # Add positions to the map
    for x in range(0, self.boardSize):
        for y in range(0, self.boardSize):
            w = Pos(x,y)
            self.grid.addWidget(w, y, x)
            # Connect signal to handle expansion.
            w.clicked.connect(self.trigger_start)
            w.revealed.connect(self.on_reveal)
            w.expandable.connect(self.expand_reveal)

    # Place resize on the event queue, giving control back to Qt before.
    QTimer.singleShot(0, lambda: self.resize(1,1)) # <1>

def reset_map(self):
    self._reset_position_data()
    self._reset_add_mines()
    self._reset_calculate_adjacency()
    self._reset_add_starting_marker()
    self.update_timer()

def _reset_position_data(self):
    # Clear all mine positions
    for x in range(0, self.boardSize):
        for y in range(0, self.boardSize):
            w = self.grid.itemAtPosition(y, x).widget()
            w.reset()

def _reset_add_mines(self):
    # Add mine positions
    positions = []
    while len(positions) < self.n_mines:
        x, y = random.randint(0, self.boardSize-1), random.randint(0, self.boardSize-1)
        if (x ,y) not in positions:
            w = self.grid.itemAtPosition(y,x).widget()
            w.is_mine = True
            positions.append((x, y))

    # Calculate end-game condition
    self.end_game_n = (self.boardSize * self.boardSize) - (self.n_mines + 1)
    return positions