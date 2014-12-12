// Constants for different measurements on the board, numbers come from:
// https://github.com/raspberrypi/hats/blob/master/hat-board-mechanical.pdf

// Radius of fillets on edge of PCB
edge_radius = 3;

// Size of PVB
width = 65;
height = 56.5;

// Size of mounting holes
hole_size_r = 2.75;
hole_x_dist = 58;
hole_y_dist = 49;

// Distance of holes from edge of board
hole_x_edge = (width - hole_x_dist)/2;
hole_y_edge = (height - hole_y_dist)/2;

// Radius of rounded edge for cutouts
cutout_radius = 1;

// Display flex cutout
display_flex_cutout_width = 5;
display_flex_cutout_height = 17;
display_flex_cutoff_x = -0.1;
display_flex_cutoff_y = 19.5;

// Camera flex slot
camera_flex_slot_width = 2;
camera_flex_slot_height = 17;
camera_flex_slot_x = 45;
camera_flex_slot_y = 11.5;

