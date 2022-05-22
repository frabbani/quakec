
void()	laser_point =[	0, laser_point ]
{
	makevectors( self.owner.v_angle );

	vector o = self.owner.origin + v_up * self.owner.size.z * 0.5 +  v_forward * 20;
	
	TraceEntities( self, o, o + v_forward * 1000 );
	setorigin( self, trace_endpos );
	if( trace_fraction < 1.0 ){
		setmodel( self, "progs/redsight.spr" );
	}
	else{
		setmodel (self, "progs/bluesight.spr");
	}
	
	/*
	vector e = trace_endpos;
	
	trace_entity( self.hitman, o, e );
	if( trace_ent == self.hitman ){
		setorigin ( self, trace_endpos );
		setmodel( self, "progs/redsight.spr" );
	}
	else{
		setorigin ( self, e );
		setmodel (self, "progs/bluesight.spr");
	}
	*/
	
};


void SpawnLaser() =
{

	centerprint( self, "laser spawned!");
	
	entity laser = spawn ();
	laser.owner = self;
	laser.hitman = self.hitman;
	laser.angles = self.v_angle;
	setmodel (laser, "progs/bluesight.spr");
	setorigin ( laser, self.origin );
	laser.nextthink = time + 0.1;
	laser.think = laser_point;
	laser.solid = SOLID_NOT;
	laser.movetype = MOVETYPE_NONE;
}