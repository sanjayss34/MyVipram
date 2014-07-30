#include <iostream>
#include <fstream>
#include <cstdlib>
#include <bitset>
using namespace std;
#define NUM_BITS 15
#define NUM_LINES 10000
#define NUM_LAYERS 4
#define NUM_NAND 4

int main(int argc, char* argv[])
{
	ifstream infile;
	ofstream outfile;
	infile.open(argv[1]);
	cout << argv[1] << "\n";
	outfile.open(argv[2], fstream::out | fstream::app);
	bitset<NUM_LINES> bArr[NUM_BITS];
	/*for (int m = 0; m < 15; m++)
	{
		bitset<NUM_LINES> bArr[m] (0);
	}*/
	int layer = atoi(argv[3]);
	for (int beg = 0; beg < 3; beg++)
	{
		char* loadUnnecessary = (char*) malloc(sizeof(char) * 1000);
		infile >> loadUnnecessary;
		//cout << loadUnnecessary << "\n";
	}
	char* nextLine = (char*) malloc(sizeof(char) * 1000);
	//infile >> nextLine;
	//cout << nextLine << "\n";
	//infile >> nextLine;
	//cout << nextLine << "\n";
	//infile >> nextLine;
	//cout << nextLine << "\n";
	for (int i = 0; i < NUM_LINES; i++)
	{
		for (int j = 0; j <= layer-1; j++)
		{
			int num = 0;
			infile >> num;
			char* delimeter = (char*) malloc(sizeof(char) * 5);
			infile >> delimeter;
		}
		int num2 = 0;
		infile >> num2;
		//if (i == 1)
			//cout << num2 << "\n";
		bitset<NUM_BITS> value(num2);
		//cout << value << "\n";
		for (int i2 = 0; i2 < NUM_BITS; i2++)
		{
			bArr[i2][i] = value[i2];
		}
		//if (bArr[1][i] == 1)
			//cout << i << "\n";
		/*if (i == 9998)
		{
			cout << value << " " << value[14] << "\n";
		}*/
		char* delim = (char*) malloc(sizeof(char) * 10);
		infile >> delim;
		for (int k = layer+1; k < 6; k++)
		{
			infile >> num2 >> delim;
		}
	}

	int selection[NUM_NAND] = {0};
	double minDifference = 1000000000.0;
	int count = 0;
	for (int a = 0; a < NUM_BITS; a++)
	{
		for (int b = a+1; b < NUM_BITS; b++)
		{
			for (int c = b+1; c < NUM_BITS; c++)
			{
				for (int d = c+1; d < NUM_BITS; d++)
				{
					count++;
					int counts[2][2][2][2];
					for (int c1 = 0; c1 < 2; c1++) for (int c2 = 0; c2 < 2; c2++) for (int c3 = 0; c3 < 2; c3++) for (int c4 = 0; c4 < 2; c4++) counts[c1][c2][c3][c4] = 0;
					for (int l = 0; l < NUM_LINES; l++)
					{
						counts[bArr[a][l]][bArr[b][l]][bArr[c][l]][bArr[d][l]]++;
					}
					double difference = 0.0;
					for (int cA = 0; cA < 2; cA++) for (int cB = 0; cB < 2; cB++) for (int cC = 0; cC < 2; cC++) for (int cD = 0; cD < 2; cD++) difference = difference + ((((double) counts[cA][cB][cC][cD])/ (double) NUM_LINES) - (1.0/16.0)) * ((((double) counts[cA][cB][cC][cD])/ (double) NUM_LINES) - (1.0/16.0));
					if ((a == 1) && (b == 2) && (c == 3) && (d == 10))
						cout << counts[1][1][1][1] << "\n";
					if (a == 10)
						cout <<"10\n";
					if (difference < minDifference)
					{
						selection[0] = a;
						selection[1] = b;
						selection[2] = c;
						selection[3] = d;
						minDifference = difference;
						cout << difference << " ";
						for (int cA = 0; cA < 2; cA++) for (int cB = 0; cB < 2; cB++) for (int cC = 0; cC < 2; cC++) for (int cD = 0; cD < 2; cD++) cout << counts[cA][cB][cC][cD] << " ";
						cout << "\n";
					}
				}
			}
		}
	}


	cout << count << "\n";
	outfile << 14-selection[0] << " " << 14-selection[1] << " " << 14-selection[2] << " " << 14-selection[3] << "\n";

	infile.close();
	outfile.close();
	
	return 0;
}