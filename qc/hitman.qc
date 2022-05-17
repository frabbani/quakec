


void()	hitman_stand1 =[	13,	hitman_stand1	]
{
};

void() SpawnHitman = 
{
	centerprint( self, "hitman spawned!");
	
	self.hitman = spawn ();
	setmodel( self.hitman, "progs/player.mdl" );
	setorigin ( self.hitman, self.origin + '0 0 20' + v_forward * 100 );
	
	setsize (self.hitman, '-16 -16 -28', '16 16 28');
	self.hitman.nextthink = time + 0.1;
	self.hitman.think = hitman_stand1;
	self.hitman.solid = SOLID_SLIDEBOX;
	self.hitman.movetype = MOVETYPE_STEP;
	self.hitman.flags = self.hitman.flags | FL_MONSTER;
	self.frame = 13;

}

