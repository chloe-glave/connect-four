/// @description Text

// Winner
if global.winflag == true
{
	draw_set_font(Win);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text_transformed(1024, 128, string(global.winner) + " Wins!", 2, 2, 0); // Print the winner
	
	draw_text_transformed(1024, 214, "Rematch? (space)", 0.5, 0.5, 0);
}

if global.stalemate == true
{
	draw_set_font(Win);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text_transformed(1024, 128, "Stalemate!", 2, 2, 0); // Print the winner
	
	draw_text_transformed(1024, 214, "Rematch? (space)", 0.5, 0.5, 0);
	
	draw_text_transformed(1024, 896, "How did you two even do that?", 0.75, 0.75, 0);
}