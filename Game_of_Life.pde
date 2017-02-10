class Block { //<>//
  final int blockSize = 50;
  int x; 
  int y;
  boolean alive;

  Block(int x, int y) {
    this.x = x;
    this.y = y;
  }
  void display() {
    if (alive == true) {
      fill(0);
    }
    if (alive == false) {
      fill(255);
    }
    rect(x*blockSize, y*blockSize, blockSize, blockSize);
  }
  boolean isAlive () {
    return alive;
  }

  void setAlive(boolean alive) {
    this.alive = alive;
  }

  int getX() {
    return x;
  }
  int getY() {
    return y;
  }
}




Block[][] Grid = new Block[100][100];
ArrayList<Block> alive = new ArrayList<Block>();
ArrayList<Block> dead = new ArrayList<Block>();

void setup() {
  size(1000, 1000);
  for (int i = 0; i<Grid.length; i++) {
    for (int j = 0; j<Grid.length; j++) {
      Grid[i][j] = new Block(i, j);
      int x = (int)random(2);
      if (x == 0) {
        Grid[i][j].setAlive(true);
      }
    }
  }
}
void draw() {

  for (int row = 0; row< Grid.length; row++) {
    for (int col = 0; col< Grid.length; col++) {
      Grid[row][col].display();
      if (getAliveCounter(getNeighbors(Grid[row][col])) == 3) {
        Grid[row][col].setAlive(true);
      } else {
        Grid[row][col].setAlive(false);
      }
    }
  }
}

Block[] getNeighbors(Block a) {
  Block[] neighbors = new Block[8];
  int x = a.getX();
  int y = a.getY();
  int index = 0;
  if (!(x - 1 < 0 || y - 1 < 0 || x + 1 > Grid.length -1 || y + 1 > Grid.length -1)) {
    for (int i = x-1; i<=x+1; i++) {
      for (int j = y-1; j<=y+1; j++) {
        if (!(x == i && y == j)) {
          neighbors[index] = Grid[i][j];
          index++;
        }
      }
    }
  }
  return neighbors;
}

int getAliveCounter(Block[] a) {
  int aliveCounter = 0;
  for (Block b : a) {
    if (b!=null) {
      if (b.isAlive() == true) {
        aliveCounter++;
      }
    }
  }
  return aliveCounter;
}