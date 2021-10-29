// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function func_scramble_array(array) {
	swap = 0;
	original = 0;
	size = array_length(array);
	
	for (i=0;i<size;i++) {
		checked[i] = false;
		}
	
	for (i=0;i<size;i++) {
		if (!checked[i]) {
			swap = irandom(size-1);
			original = array[i];
		
			array[i] = array[swap];
			array[swap] = original;
			checked[i] = true;
			checked[swap] = true;
			}
		}

	return array;
	}