#include <iostream>

#define COLUMNS 3
#define ROWS 3

// i don't know how to send matrices to functions

int main() {
	int matrixA[COLUMNS][ROWS] = {
		{ 5, 7, -1 },
		{ 6, 0, -3 },
		{ -4, 3, 0 }
	};

	int matrixB[COLUMNS][ROWS] = {
		{ 0, 3, -5 },
		{ 2, 0, 0 },
		{ -1, -5, 3 }
	};

	int matrixC[COLUMNS][ROWS];

	for(int i = 0; i < COLUMNS; i++) {
		for(int j = 0; j < ROWS; j++) {
			matrixC[i][j] = matrixA[i][j] + matrixB[i][j];
		}
	}

	for(int i = 0; i < COLUMNS; i++) {
		for(int j = 0; j < ROWS; j++) {
			std::cout << matrixC[i][j] << ' ';
		}
		std::cout << '\n';
	}

	return 0;
}
