/// @description Move down

// Restart alarm
	alarm[0] = 0.2*room_speed;

// Check if still able to move
if bbox_bottom < (room_height - 32) // not touching bottom
and not place_meeting(x, (y + global.y_spacing), oPiece_Still_Red) // not touching other pieces
and not place_meeting(x, (y + global.y_spacing), oPiece_Still_Yellow)
{
	y += global.y_spacing; // Move down
}

else
{
	if name == "oPiece_Moving_Red" // check which colour to use
	{
		instance_create_layer(x, y, "Instances", oPiece_Still_Red); // replace self with still
		instance_destroy();
	}
	
	if name == "oPiece_Moving_Yellow"
	{
		instance_create_layer(x, y, "Instances", oPiece_Still_Yellow); // Replace self with still
		instance_destroy();
	}
}

