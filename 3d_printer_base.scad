wood_thickness=6;
base_width=257;
stepper_width=60;
mid_width=2*stepper_width+2*wood_thickness+259;
top_width=170;
side_length=143;
rail_width=22;
offset_to_rail=wood_thickness+54;

module stepper(){
	square([stepper_width, 80-wood_thickness]);
}
module rail_support(){
	square([rail_width, wood_thickness]);
}
module i3v_base(){
	// back sides
	square([wood_thickness, side_length]);
	translate([wood_thickness+base_width, 0]) square([wood_thickness, side_length]);

	// back
	translate([wood_thickness, 7]) square([base_width, wood_thickness]);

	// mid
	translate([-(stepper_width+1), side_length]) square([mid_width, wood_thickness]);

	// steppers
	translate([-stepper_width, side_length + wood_thickness]) stepper();
	translate([base_width + 2*wood_thickness, side_length + wood_thickness]) stepper();

	// rail supports
	translate([offset_to_rail - 1, side_length+wood_thickness]) rail_support();
	translate([offset_to_rail - 1 + top_width - rail_width, side_length + wood_thickness]) rail_support();

	// front
	translate([offset_to_rail ,side_length+wood_thickness+240]) square([top_width, wood_thickness]);
}

linear_extrude(height=wood_thickness){
	difference(){
		translate([-100, -15]) square([500, 500]);
		i3v_base();
	}
}