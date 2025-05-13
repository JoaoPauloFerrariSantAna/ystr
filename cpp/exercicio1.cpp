#include <iostream>
#include <string>
#include <string_view>
#include <cstdint>
#include <array>

// wanted to to try this way, teacher
// i could have tried to use a switch with a bunch of cases in a switch here,
// it would have been more simple

int searchInString(std::string_view stringToSearch) {
	constexpr std::array<char, 21> whatToSearch { 'a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', ' ' };

	int matches = 0;

	for(std::size_t i = 0U; i < stringToSearch.length(); i++) {
		for(std::size_t j = 0U; j < whatToSearch.size(); j++) {
			if(stringToSearch[i] == whatToSearch[j]) {
				matches += 1;
			}
		}
	}

	return matches;
}

int main() {
	std::string word = "Assembly";

	std::cout << searchInString(word) << '\n';

	return 0;
}
