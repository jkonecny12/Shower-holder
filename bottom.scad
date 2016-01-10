POLE_RADIUS=2;
WALL_HEIGHT=2;

TOOTH_DEPTH=1;
TOOTH_WIDTH=1;

WALL_THICK = 3;

BASE_WIDTH = POLE_RADIUS * 2 + WALL_THICK;
BASE_LENGHT = BASE_WIDTH + 1;


difference() {
    difference() {
        union() {
            cube([BASE_LENGHT, BASE_WIDTH, WALL_HEIGHT], true);

            difference() {
            translate([-(BASE_LENGHT / 2), 0, WALL_HEIGHT / 4])
                cylinder(h = WALL_HEIGHT + TOOTH_DEPTH, r = BASE_WIDTH / 2, center = true, $fn = 100);

            translate([-(BASE_LENGHT / 2), -BASE_WIDTH, 0])
            	cube([BASE_WIDTH + 2, BASE_WIDTH + 4, (WALL_HEIGHT + TOOTH_DEPTH) * 2]); 
            }
        }

        for(i = [0:BASE_LENGHT / (TOOTH_WIDTH * 2) - 1]) {
            STEP = TOOTH_WIDTH * 2;
            START = (BASE_LENGHT / 2) - (TOOTH_WIDTH / 2);
            translate([(-START + STEP * i), 0, TOOTH_DEPTH])
                cube([TOOTH_WIDTH, BASE_WIDTH * 2, TOOTH_DEPTH * 2], true);
        }
    }
    union() {
        translate([-(BASE_LENGHT / 2), 0, 0])
            cylinder(h = WALL_HEIGHT * 4, r = POLE_RADIUS, center = true, $fn = 100);
        translate([1, 0, 0])
            cube([BASE_LENGHT + 2, POLE_RADIUS * 2, WALL_HEIGHT * 2 + 2], center = true);
    }
}
