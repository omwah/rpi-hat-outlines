use <fillets/fillets.scad>
include <board_measures.scad>

// Make all curves look better
$fn=100;

module board() {
    // Round corners of board
    minkowski() {
        // Board outline, remove the amount of size that
        // the minkowski operation wil add to the sides
        square([width-edge_radius*2, height-edge_radius*2]);

        // Move so keep board size
        translate([edge_radius, edge_radius])
            circle(r=edge_radius);
    }
}

module mounting_holes() {
    for (x_pos = [0, 1]) {
        for (y_pos = [0, 1]) {
            translate([hole_x_edge+hole_x_dist*x_pos, hole_y_edge+hole_y_dist*y_pos])
                circle(d=hole_size);
        }
    }
}


module display_flex_cutout() {
    // Create display flex cut out using a rectangle and
    // fillets to smooth the cutout
    translate([display_flex_cutoff_x, display_flex_cutoff_y]) {
        union() {
            difference() {
                // Main cutout area
                square([display_flex_cutout_width,display_flex_cutout_height]);

                // Bottom right fillet
                translate([display_flex_cutout_width-cutout_radius,
                           cutout_radius])
                    rotate([0, 0, 90])
                    fil_2d_i(cutout_radius, angle=90);

                // Top right fillet
                translate([display_flex_cutout_width-cutout_radius,
                           display_flex_cutout_height-cutout_radius])
                    rotate([0, 0, 180])
                    fil_2d_i(cutout_radius, angle=90);
            }

            // Bottom left fillet
            translate([cutout_radius, -cutout_radius])
                rotate([0, 0, -90])
                fil_2d_i(cutout_radius, angle=90);

            // Top left fillet
            translate([cutout_radius,
                       display_flex_cutout_height+cutout_radius])
                rotate([0, 0, 0])
                fil_2d_i(cutout_radius, angle=90);
        }
    
    }

}

module camera_flex_slot() {
    translate([camera_flex_slot_x, camera_flex_slot_y]) {
        square([camera_flex_slot_width, camera_flex_slot_height-cutout_radius*2], center=true);
        translate([0, camera_flex_slot_height/2-cutout_radius])
            circle(r=cutout_radius);
        translate([0, -camera_flex_slot_height/2+cutout_radius])
            circle(r=cutout_radius);
    }
}

// Center at origin
module pcb_design() {
    translate([-width/2, -height/2]) {
        // Remove holes from board
        difference() {
            board();
            mounting_holes();
            display_flex_cutout();
            camera_flex_slot();
        }

    }
}

pcb_design();
