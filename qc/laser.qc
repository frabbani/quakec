
void()	laser_point =[	0, laser_point ]
{
	makevectors( self.owner.v_angle );

	vector o = self.owner.origin + v_up * self.owner.size.z * 0.5 +  v_forward * 20;
	traceline( o, o + v_forward * 1000, TRUE, self );
	vector e = trace_endpos;
	
	trace_entity( self.hitman, o, e );
	setorigin ( self, trace_endpos );
	if( trace_ent == self.hitman ){
		setmodel( self, "progs/mine/laserpoint.mdl" );
	}
	else
		setmodel (self, "progs/s_bubble.spr");
	
	
};


void SpawnLaser() =
{

	centerprint( self, "laser spawned!");
	
	entity laser = spawn ();
	laser.owner = self;
	laser.hitman = self.hitman;
	laser.angles = self.v_angle;
	setmodel (laser, "progs/s_bubble.spr");
	setorigin ( laser, self.origin );
	laser.nextthink = time + 0.1;
	laser.think = laser_point;
	laser.solid = SOLID_NOT;
	laser.movetype = MOVETYPE_NONE;
	laser.flags = FL_MONSTER;
}