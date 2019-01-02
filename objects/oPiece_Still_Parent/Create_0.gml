/// @description Static piece script

#region Check which piece this is

name = object_get_name(object_index);

if name == "oPiece_Still_Red"
	{
		global.winner = "Red" // piece is red
	}
	
if name == "oPiece_Still_Yellow"
	{
		global.winner = "Yellow" // piece is yellow
	}

#endregion


#region Horizontal win checking

count = 0;

var i;
for (i = global.x_min; i <= global.x_max; i += global.x_spacing) // check each horizontal position
{
	if instance_position(i, y, object_index) // checking for this colour (x = i)
	{
		count += 1; // check for pieces next to each other
		
		if count >= 4 // four in a row horizontally
		{
			global.winflag = true;
			show_debug_message("Horizontal Win Found");
		}
	}
	else
	{
		count = 0; // reset if there is a break between same colour
	}
}

#endregion


#region Vertical win checking

count = 0;

var j;
for (j = global.y_min; j <= global.y_max; j += global.y_spacing) // check each vertical position
{
	if instance_position(x, j, object_index) // checking for this colour (y = j)
	{
		count += 1; // check for pieces next to each other
		
		if count >= 4 // four in a row vertically
		{
			global.winflag = true;
			show_debug_message("Vertical Win Found");
		}
	}
	else
	{
		count = 0; // reset if there is a break between same colour
	}
}

#endregion

// Diagonal win checks ignore the original piece to prevent double checking

#region Diagonal win checking (downwards)

count = 0;
var k; 

// Check right+down
var l = (y + global.y_spacing); // start at 1 below y position

for (k = (x + global.x_spacing); k <= global.x_max; k += global.x_spacing) // start at 1 right of x position, move right
{

	if instance_position(k, l, object_index)
	{
		count += 1; // check for pieces diagonally adjacent
	}
	else
	{
		break; // end loop if piece not found
	}
	
	if l < global.y_max // prevent y from going below board
	{
		l += global.y_spacing; // move y check down
	}
	else
	{
		break;
	}
}

// Check left+up
l = (y - global.y_spacing); // start at 1 above y position

for (k = (x - global.x_spacing); k >= global.x_min; k -= global.x_spacing) // start at 1 left of x position, move left
{

	if instance_position(k, l, object_index)
	{
		count += 1; // check for pieces diagonally adjacent
		
	}
	else
	{
		break; // end loop if piece not found
	}
	
	if l > global.y_min // prevent y from going above board
	{
		l -= global.y_spacing; // move y check up
	}
	else
	{
		break;
	}
}


if count >= 3 // four in a row diagonally (not counting starting piece)
{
	global.winflag = true;
	show_debug_message("Diagonal Win Down Found");
}

#endregion


#region Diagonal win checking (upwards)

count = 0;
var o; 

// Check right+up
var p = (y - global.y_spacing); // start at 1 above y position

for (o = (x + global.x_spacing); o <= global.x_max; o += global.x_spacing) // start at 1 right of x position, move x check right
{
	if instance_position(o, p, object_index) // if piece matches colour
	{
		count += 1; // check for pieces diagonally adjacent
		show_debug_message(string(object_index) + "Found");
	}
	else
	{
		break; // end loop if piece not found
	}
	
	if p < global.y_min // prevent y from going above board
	{
		p -= global.y_spacing; // move y check up
	}
	else
	{
		break;
	}
}


// Check left+down
p = (y + global.y_spacing); // start at 1 below y position

for (o = (x - global.x_spacing); o >= global.x_min; o -= global.x_spacing) // start at 1 left of x position, move left
{
	if instance_position(o, p, object_index)
	{
		count += 1; // check for pieces diagonally adjacent
		show_debug_message(string(object_index) + " Found");
	}
	else
	{
		break; // end loop if piece not found
	}
	
	if p < global.y_max // prevent y from going below board
	{
		p += global.y_spacing; // move y check down
	}
	else
	{
		break;
	}
}

show_debug_message("Di Count: " + string(count));

if count >= 3 // four in a row diagonally (not counting starting piece)
{
	global.winflag = true;
	show_debug_message("Diagonal Win Up Found");
}

#endregion


#region Check for stalemate

scount = 0;

var w;
for (w = global.x_min; w <= global.x_max; w += global.x_spacing) // check each horizontal position
{
	if not place_free(i, 384) // checking for pieces (x = w)
	{
		scount += 1; // add to count
		
		if scount == 7 // all of top row filled
		{
			global.stalemate = true;
			show_debug_message("Stalemate Found");
		}
	}
}

#endregion


#region Create the next piece

if global.winflag == false 
and global.stalemate == false // spawn if game not over
{
	if name == "oPiece_Still_Red"
	{
		instance_create_layer(1024, 128, "Instances", oPiece_Moving_Yellow); // red creates yellow
	}

	if name == "oPiece_Still_Yellow"
	{
		instance_create_layer(1024, 128, "Instances", oPiece_Moving_Red); // yellow creates red
	}
}

#endregion