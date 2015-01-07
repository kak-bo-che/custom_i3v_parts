wood_thickness=6;
base_width=258;
mid_width=2*62+2*6+258;
top_width=170;
side_length=143;
offset_to_rail=60-wood_thickness;

module stepper(){
	stepper_width=62;
	square([stepper_width, 80-wood_thickness]);
}
module rail_support(){
	square([22, wood_thickness]);
}
module i3v_base(){
	square([wood_thickness, side_length]);
	translate([wood_thickness+base_width, 0]) square([wood_thickness, side_length]);
	translate([wood_thickness, 7]) square([base_width, wood_thickness]);
	translate([-62, side_length]) square([mid_width, wood_thickness]);
	translate([-62, side_length + wood_thickness]) stepper();
	translate([base_width + 2*wood_thickness, side_length + wood_thickness]) stepper();
	translate([offset_to_rail, side_length+wood_thickness]) rail_support();
	echo(offset_to_rail + top_width - 22);
	translate([offset_to_rail + top_width - 22, side_length+wood_thickness]) rail_support();
	translate([offset_to_rail ,side_length+wood_thickness+240]) square([top_width, wood_thickness]);
}
difference(){
	translate([-100, -15]) square([500, 500]);
	i3v_base();
}