module round_corner(r, delta = 1) {
	cube_size = 2 * (r + delta);
	translate([-r,-r,-r])
	difference() {
		cube([cube_size, cube_size, cube_size], center = true);
		sphere(r=r);
		translate([-r-2*delta,-r-2*delta,-r-2*delta]) cube([r + 2*delta, cube_size + 2 * delta, cube_size + 2 * delta]);
		rotate([0,90,0]) translate([0,-r-2*delta,-r-2*delta]) cube([r + 2*delta, cube_size + 2 * delta, cube_size + 2 * delta]);
		rotate([0,0,-90]) translate([0,-r-2*delta,-r-2*delta]) cube([r + 2*delta, cube_size + 2 * delta, cube_size + 2 * delta]);
	}
}

module round_side(r, h, delta = 1) {
	translate([(r-delta) / 2, (r-delta) / 2, 0])
	difference() {
		cube([r + delta, r + delta, h], center = true);
		translate([(r+delta)/2, (r+delta)/2, 0]) cylinder(r = r, h = h + delta, center = true);
	}
}

module round_corner_and_sides(size, r, delta = 1) {
	round_corner(r, delta = delta);
	if (size[0] > 0) translate([-size[0]/2,0,0]) rotate([0,90,180]) round_side(r, size[0], delta = delta);
	if (size[1] > 0) translate([0,-size[1]/2,0]) rotate([-90,0,180]) round_side(r, size[1], delta = delta);
	if (size[2] > 0) translate([0,0,-size[2]/2]) rotate([0,0,180]) round_side(r, size[2], delta = delta);

}

//round_corner_and_sides([10,20,30], 3);
//round_side(2,5);
