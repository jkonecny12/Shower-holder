POLE_RADIUS=2;
WALL_HEIGHT=2;

TOOTH_DEPTH=1;
TOOTH_WIDTH=1;

WALL_THICK = 3;

BASE_WIDTH = POLE_RADIUS * 2 + WALL_THICK;
BASE_LENGHT = BASE_WIDTH + 1;

BUTTON_DISTANCE = 10;
BUTTON_H = 1.5;
BUTTON_R2 = (WALL_HEIGHT + TOOTH_DEPTH) / 2;
BUTTON_R1 = BUTTON_R2 / 2;

difference() {
    union () {
        difference() {
            translate([0, 0, -(TOOTH_DEPTH / 2)])
                cube([BASE_LENGHT, BASE_WIDTH, WALL_HEIGHT], true);

            for(i = [1:BASE_LENGHT / (TOOTH_WIDTH * 2)]) {
                STEP = TOOTH_WIDTH * 2;
                START = (BASE_LENGHT / 2) + (TOOTH_WIDTH / 2);
                translate([(-START + STEP * i), 0, TOOTH_DEPTH / 2])
                    cube([TOOTH_WIDTH + 0.01, BASE_WIDTH * 2, TOOTH_DEPTH * 2], true);
            }
        }

        cube([BASE_LENGHT, BASE_WIDTH - (TOOTH_WIDTH * 2), (WALL_HEIGHT + TOOTH_DEPTH)], true);
    }

    union() {
        translate([-(BASE_LENGHT / 2), 0, 0])
            cylinder(h = WALL_HEIGHT * 4, r = POLE_RADIUS, center = true, $fn = 100);
    }
}

// End holder part
translate([(BASE_LENGHT / 2) + (TOOTH_WIDTH / 2), 0, 0])
    cube([TOOTH_WIDTH, BUTTON_DISTANCE + (BUTTON_R2 * 2), (WALL_HEIGHT + TOOTH_DEPTH)], true);

translate([(BASE_LENGHT / 2) + TOOTH_WIDTH + (BUTTON_H / 2), 0, 0]) {
    rotate([0,90,0]) {
        translate([0, BUTTON_DISTANCE / 2, 0])
            cylinder(h = BUTTON_H, r1 = BUTTON_R1, r2 = BUTTON_R2, center = true, $fn = 100);
        translate([0, -(BUTTON_DISTANCE / 2), 0])
            cylinder(h = BUTTON_H, r1 = BUTTON_R1, r2 = BUTTON_R2, center = true, $fn = 100);
    }
}
