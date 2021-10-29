num_string = string(floor(num_input));
size = string_length(num_string);
for (i = 1; i <= size; i++;) {
	char[i] = real(string_char_at(num_string,i));
	}
ready = true;

