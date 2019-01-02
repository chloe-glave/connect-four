/// @description Reset

// Available after win
if global.winflag == true
or global.stalemate == true
{
	if keyboard_check_pressed(vk_space)
	{
		room_restart();
	}
}