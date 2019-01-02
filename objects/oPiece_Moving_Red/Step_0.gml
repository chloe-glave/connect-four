/// @description Main Code

#region Keyboard input for different players

if name == "oPiece_Moving_Red" // Left side
{
	key_left = keyboard_check_pressed(ord("A"));
	key_right = keyboard_check_pressed(ord("D"));
	key_drop = keyboard_check_pressed(ord("S"));
}

if name == "oPiece_Moving_Yellow" // Right side
{
	key_left = keyboard_check_pressed(vk_left);
	key_right = keyboard_check_pressed(vk_right);
	key_drop = keyboard_check_pressed(vk_down);
}
	
#endregion


#region Piece Movement

if stopped == false
{
	// Move sideways
	if key_left and bbox_left > 64 // Left wall collide
	{
		x -= global.x_spacing; // Move left
	}

	if key_right and bbox_right < (room_width - 64) // Right wall collide
	{
		x += global.x_spacing; // Move right
	}
}

if key_drop // Start alarm
{
	if not place_meeting(x, (y + global.y_spacing), oPiece_Still_Red) // check for filled up column
	and not place_meeting(x, (y + global.y_spacing), oPiece_Still_Yellow)
	{
		stopped = true; // Stop moving to sides
		alarm[0] = 0.2*room_speed; // Move piece down
	}
}

#endregion