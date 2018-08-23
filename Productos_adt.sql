CREATE TABLE b.products(
	name 		text NOT NULL,
	description	text NOT NULL,
	price		integer NOT NULL
	
);

CREATE TABLE b.log(
	id		serial NOT NULL,
	timestamptz	timestamptz DEFAULT now(),
	detail		text
	
);