num_profiles = 12;
rotation = 42;
u_profile_width = 15;
u_profile_depth = 20;
show_u_profiles = true;

module u_profile(width=u_profile_width,depth=u_profile_depth,height=1000) {
    thickness = 1;
    difference() {
        cube([width, depth, height], center=true);
        translate([0,-thickness/2,0])
        cube([width-thickness*2, depth-thickness, height], center=true);
    }
}


radius = 64;
height = 80;
bottom_thickness=10;
difference() {
    cylinder(h=height, r=radius, center=true, $fn=120);
    for(i=[0:num_profiles]){
        rotate([0,0,(360/num_profiles)*i])
        translate([radius-u_profile_depth/2,0,0])
        rotate([0,rotation,90])
        hull() { u_profile(); };
    }
    rotate([0,0,(360 / num_profiles) / 2]) translate([0,0,bottom_thickness]) cylinder(h=height, r=42, $fn=120, center=true);

    for (i=[0:num_profiles/2]) {
        rotate([0,90,i*(360/num_profiles)]) cylinder(h=120, r=3, center=true, $fn=32);
    }    
}

if (show_u_profiles) {
    for(i=[0:num_profiles]){
        rotate([0,0,(360/num_profiles)*i])
        translate([radius-u_profile_depth/2,0,0])
        rotate([0,rotation,90])
        u_profile();
    }}