#include <iostream>
#include <string>
#include <string_view>
#include <cstdint>

void showTotalMatches(int total, int vowels, int consonants, int numbers, std::string_view word) {
	std::cout << "In the string \"" << word << "\" there is a total of ";
	std::cout << total << " words, " << vowels << " vowels, " << consonants << " consonants and ";
	std::cout << numbers << " numbers.\n";
}

void searchInString(std::string_view stringToSearch) {
	int total = 0;
	int vowel = 0;
	int consonant = 0;
	int numbers = 0;

	for(std::size_t i = 0U; i < stringToSearch.length(); i++) {
		switch(stringToSearch[i]) {
			case 'a':
				[[fallthrough]];
			case 'e':
			case 'i':
			case 'o':
			case 'u':
			case 'A':
			case 'E':
			case 'I':
			case 'O':
			case 'U':
				total+= 1;
				vowel+= 1;
			break;
			case 'b':
				[[fallthrough]];
			case 'c':
			case 'd':
			case 'f':
			case 'g':
			case 'h':
			case 'j':
			case 'k':
			case 'l':
			case 'm':
			case 'n':
			case 'p':
			case 'q':
			case 'r':
			case 's':
			case 't':
			case 'v':
			case 'w':
			case 'x':
			case 'y':
			case 'z':
				total += 1;
				consonant += 1;
			break;
			case '0':
				[[fallthrough]];
			case '1':
			case '2':
			case '3':
			case '4':
			case '5':
			case '6':
			case '7':
			case '8':
			case '9':
				total += 1;
				numbers += 1;
			break;
			default:
			break;
		}

	}

	showTotalMatches(total, vowel, consonant, numbers, stringToSearch);
}

int main() {
	std::string word = "Assembly12";

	searchInString(word);

	return 0;
}
