include <board_measures.scad>
use <pcb_outline.scad>

// Places an outline of the female connector in just the right spot
header_dist_from_hole = 29;

module female_header() {
    translate([-width/2, -height/2]) {
        color("black")
        translate([hole_x_edge+header_dist_from_hole, hole_y_edge+hole_y_dist])
        square([51, 5], center=true);
    }
}

// Uncomment to see header in reference to board
//pcb_design();
female_header();
