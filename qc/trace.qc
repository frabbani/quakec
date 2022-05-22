
//FXR
float TraceEntities( entity forent, vector p0, vector p1 ) = {
	vector o = p0;
	vector e = p1;
	
	traceline( o, e, TRUE, forent );
	
	e = trace_endpos;
	entity ignore = forent;

	while( TRUE ){
		traceline( o, e, FALSE, ignore );
		if( trace_fraction >= 1.0 )
			return FALSE;
	
		trace_entity( trace_ent, o, e );
		if( trace_fraction < 1.0 )
			return TRUE;
		ignore = trace_ent;
		o = trace_endpos;	
	}	
	
	return FALSE;
}