import 'dart:io';

void main() {
  List<String> board = ["1", "2", "3", "4", "5", "6", "7", "8", "9"];
  String currentPlayer = "X";
  bool gameEnded = false;

  while (!gameEnded) {
    printBoard(board);
    print("Player $currentPlayer, choose a number (1-9): ");
    String? input = stdin.readLineSync();

    if (input == null || int.tryParse(input) == null) {
      print("Please enter a valid number.");
      continue;
    }

    int pos = int.parse(input);

    if (pos < 1 || pos > 9) {
      print("Number must be between 1 and 9.");
      continue;
    }

    if (board[pos - 1] == "X" || board[pos - 1] == "O") {
      print("This spot is already taken.");
      continue;
    }

    board[pos - 1] = currentPlayer;

    if (checkWinner(board, currentPlayer)) {
      printBoard(board);
      print("Player $currentPlayer wins!");
      gameEnded = true;
    } else if (checkDraw(board)) {
      printBoard(board);
      print("It's a draw!");
      gameEnded = true;
    } else {
      currentPlayer = (currentPlayer == "X") ? "O" : "X";
    }
  }

  print("Game over.");
}

void printBoard(List<String> board) {
  print("");
  print("${board[0]} | ${board[1]} | ${board[2]}");
  print("--+---+--");
  print("${board[3]} | ${board[4]} | ${board[5]}");
  print("--+---+--");
  print("${board[6]} | ${board[7]} | ${board[8]}");
  print("");
}

bool checkWinner(List<String> b, String player) {
  return (b[0] == player && b[1] == player && b[2] == player) ||
      (b[3] == player && b[4] == player && b[5] == player) ||
      (b[6] == player && b[7] == player && b[8] == player) ||
      (b[0] == player && b[3] == player && b[6] == player) ||
      (b[1] == player && b[4] == player && b[7] == player) ||
      (b[2] == player && b[5] == player && b[8] == player) ||
      (b[0] == player && b[4] == player && b[8] == player) ||
      (b[2] == player && b[4] == player && b[6] == player);
}

bool checkDraw(List<String> b) {
  for (int i = 0; i < b.length; i++) {
    if (b[i] != "X" && b[i] != "O") {
      return false;
    }
  }
  return true;
}
