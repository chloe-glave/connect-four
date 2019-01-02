/// @description Text for menu

// Setting parameters
draw_set_font(Win);
draw_set_halign(fa_center);

// Title
draw_text_transformed(1024, 300, "Connect Four!", 2, 2, 0);
draw_text_transformed(1024, 500, "Press Space to Start", 2, 2, 0);

// Controls
draw_text_transformed(1024, 1120, "Controls", 1.5, 1.5, 0);

// Red
draw_text(384, 1400, "A/D to move");
draw_text(384, 1500, "S to drop");

// Yellow
draw_text(1664, 1400, "Left/Right to move");
draw_text(1664, 1500, "Down to drop");

// Credit
draw_text_transformed(1855, 1727, "Chloe Glave 2018", 0.5, 0.5, 0);