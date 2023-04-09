/// @description	Returns an array with shuffled values
/// @param	{array} array

function array_shuffle(array){
	
	var i, j, k;
	var length = array_length(array)

	for (i = 0; i < length; i += 1)
	{
	    j = irandom_range(i, length - 1)
	    if (i != j)
	    {
	        k = array[i]
	        array[i] = array[j]
	        array[j] = k
	    }
	}
	
	return array
}