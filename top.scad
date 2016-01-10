POLE_RADIUS=2;
WALL_HEIGHT=2;

TOOTH_DEPTH=1;
TOOTH_WIDTH=1;

WALL_THICK = 3;

BASE_WIDTH = POLE_RADIUS * 2 + WALL_THICK;
BASE_LENGHT = BASE_WIDTH + 1;


difference() {
    union () {
        difference() {
            cube([BASE_LENGHT, BASE_WIDTH, WALL_HEIGHT], true);

            for(i = [1:BASE_LENGHT / (TOOTH_WIDTH * 2)]) {
                STEP = TOOTH_WIDTH * 2;
                START = (BASE_LENGHT / 2) + (TOOTH_WIDTH / 2);
                translate([(-START + STEP * i), 0, TOOTH_DEPTH])
                    cube([TOOTH_WIDTH + 0.01, BASE_WIDTH * 2, TOOTH_DEPTH * 2], true);
            }
        }

        translate([0,0,TOOTH_DEPTH / 2])
            cube([BASE_LENGHT, BASE_WIDTH - (TOOTH_WIDTH * 2), (WALL_HEIGHT + TOOTH_DEPTH)], true);
    }

    union() {
        translate([-(BASE_LENGHT / 2), 0, 0])
            cylinder(h = WALL_HEIGHT * 4, r = POLE_RADIUS, center = true, $fn = 100);
    }
}
