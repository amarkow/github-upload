/*

makes a helical ornament

see some details in the helix module

for further explanations see -

Helical Pencil Holders
http://www.thingiverse.com/thing:1814109

and

Double Helix Pencil Holders
http://www.thingiverse.com/thing:1805732


PCM   November 2016
*/




helical_ornament();




module helical_ornament()
{
     scale(1.25)
       difference()
    {
        rotate([0,180,0])
  union()
    {
           union()
        {

    helix(0,250,5,20,30,.2,1,6,1.4);
    helix(0,250,5,20,-30,.2,1,6,1.4);
   helix(0,250,5,20,-90,.2,1,6,1.4);
    helix(0,250,5,20,-150,.2,1,6,1.4);
   helix(0,250,5,20,-210,.2,1,6,1.4);
   helix(0,250,5,20,-270,.2,1,6,1.4);
        }
    
        rotate([0,180,0])
       union()
        {

     helix(0,250,5,20,30,.2,1,6,1.4);
    helix(0,250,5,20,-30,.2,1,6,1.4);
   helix(0,250,5,20,-90,.2,1,6,1.4);
    helix(0,250,5,20,-150,.2,1,6,1.4);
   helix(0,250,5,20,-210,.2,1,6,1.4);
   helix(0,250,5,20,-270,.2,1,6,1.4);
        }

  translate([0,0,-53])
coin(3,7,3);
        translate([0,0,51])
cylinder(r=3,h=3,center=true,$fn=24);

}
translate([0,0,50])
rotate([90,0,0])
cylinder(r=1.5,h=10,center=true,$fn=24);
}
}








module helix(ns,nf,ni,r,off,rz,rb,rfn,sc)
{
    /*
      variables for the helix module
    
    ns a starting value for i,(t), degrees -

     nf the ending value for t

    ni the interval for the points between ns and
       nf which are to be evaluated

    r  radius of the helix - varied within this module

   off        an angle in degrees - phase offset for the helix

   rz             step along z axis that makes helix

   rb                 a distance - the radius of the cylinder that
                    connects points computed for the
                    helix - also the radius of the sphere
                    that is placed at points where
                    cylinders connect
                    
   rfn              $fn for the cylinders 

   sc               a scale factor that multiplies the
                 individual x and y values - 
   */ 
    

    
    
    for ( i = [ns:ni:nf])
    {
                    /*
    x1,y1,z1 and x2,y2,z2 are two adjacent points along a helix

tx, ty, and tz are the mean of x, y and z;
ax, ay, and az the differences between the two coordinates.

a cylinder is created with a length equal to the distance
between the points and a radius equal to the passed parameter, rb.
The cylinder is then rotated to coincide with the vector between 
the two points.  The centered cylinder is then translated to
the mean position.  Finally a sphere is created at join points        
in order to smooth the curve

*/  
        
     r = r - 0.08*i;      // code that varies r
     x1 = r*cos(i+off)*sc;
     y1 = r*sin(i+off)*sc;
        r = r - 0.08*i;            // code that varies r
     x2 = r*cos(i+ni+off)*sc;
     y2 = r*sin(i+ni+off)*sc;
        z1 = i*rz;
        z2 = z1+ni*rz;
     tx = (x1+x2)/2;
     ty = (y1+y2)/2;
     tz = (z1+z2)/2;
     ax = x1 - x2;
     ay = y1 - y2;
     az = z1 - z2;
     translate(v=[-tx,-ty,-tz])
rotate(a = [-acos(-az/sqrt(ax*ax+ay*ay+az*az)), 0, -atan2(-ax, -ay)])
cylinder(r=rb,h=sqrt(ax*ax+ay*ay+az*az),center=true,$fn=rfn);
        translate(v=[-x2,-y2,-z2])
        sphere(r=rb,center=true);

        if (i==0)
        {translate(v=[-x1,-y1,-z1])
        sphere(r=rb,center=true,$fn=24);}

}}




module coin(r,thick,tradius)
{
/*

originally written to make coin like
disks - used here to make a hanger
for the ornaments

db    =  diameter of the coin in mm

thick =  thickness of the coin  in mm

tradius = radius used to smooth edge

thick - 2*radius   must be positive

*/
db = 2*r;

tr = thick - 2*tradius;

l1=(db - 2* tradius)/2;


 n1 = 5;

/*

l1 is length of straight portion

*/

rotate_extrude (convexity = 10,$fn=24)
translate([0,tradius,0])
polygon
       (points = [

        [ 0,0 ],[0,-tradius],
        [ tradius*cos(-18*n1) + l1, tradius*sin(-18*n1)],
        [ tradius*cos(-17*n1) + l1, tradius*sin(-17*n1)],
        [ tradius*cos(-16*n1) + l1, tradius*sin(-16*n1)],
        [ tradius*cos(-15*n1) + l1, tradius*sin(-15*n1)],
        [ tradius*cos(-14*n1) + l1, tradius*sin(-14*n1)],
        [ tradius*cos(-13*n1) + l1, tradius*sin(-13*n1)],
        [ tradius*cos(-12*n1) + l1, tradius*sin(-12*n1)],
        [ tradius*cos(-11*n1) + l1, tradius*sin(-11*n1)],
        [ tradius*cos(-10*n1) + l1, tradius*sin(-10*n1)],
        [ tradius*cos(-9*n1) + l1, tradius*sin(-9*n1)],
        [ tradius*cos(-8*n1) + l1, tradius*sin(-8*n1)],
        [ tradius*cos(-7*n1) + l1, tradius*sin(-7*n1)],
        [ tradius*cos(-6*n1) + l1, tradius*sin(-6*n1)],
        [ tradius*cos(-5*n1) + l1, tradius*sin(-5*n1)],
        [ tradius*cos(-4*n1) + l1, tradius*sin(-4*n1)],
        [ tradius*cos(-3*n1) + l1, tradius*sin(-3*n1)],
        [ tradius*cos(-2*n1) + l1, tradius*sin(-2*n1)],
        [ tradius*cos(-1*n1) + l1, tradius*sin(-1*n1)],
        [ tradius*cos(-0*n1) + l1, tradius*sin(0*n1)],

        [ tradius*cos(-0*n1) + l1,tr],

        [ tradius*cos(0*n1) + l1,tr + tradius*sin(0*n1)],
        [ tradius*cos(1*n1) + l1,tr + tradius*sin(1*n1)],
        [ tradius*cos(2*n1) + l1,tr + tradius*sin(2*n1)],
        [ tradius*cos(3*n1) + l1,tr + tradius*sin(3*n1)],
        [ tradius*cos(4*n1) + l1,tr + tradius*sin(4*n1)],
        [ tradius*cos(5*n1) + l1,tr + tradius*sin(5*n1)],
        [ tradius*cos(6*n1) + l1,tr + tradius*sin(6*n1)],
        [ tradius*cos(7*n1) + l1,tr + tradius*sin(7*n1)],
        [ tradius*cos(8*n1) + l1,tr + tradius*sin(8*n1)],
        [ tradius*cos(9*n1) + l1,tr + tradius*sin(9*n1)],
        [ tradius*cos(10*n1) + l1,tr + tradius*sin(10*n1)],
        [ tradius*cos(11*n1) + l1,tr + tradius*sin(11*n1)],
        [ tradius*cos(12*n1) + l1,tr + tradius*sin(12*n1)],
        [ tradius*cos(13*n1) + l1,tr + tradius*sin(13*n1)],
        [ tradius*cos(14*n1) + l1,tr + tradius*sin(14*n1)],
        [ tradius*cos(15*n1) + l1,tr + tradius*sin(15*n1)],
        [ tradius*cos(16*n1) + l1,tr + tradius*sin(16*n1)],
        [ tradius*cos(17*n1) + l1,tr + tradius*sin(17*n1)],
        [ tradius*cos(18*n1) + l1,tr + tradius*sin(18*n1)],
        [ 0,tr + tradius*sin(18*n1)],[0,0],


              ]
              );
}






