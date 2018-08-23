CREATE OR REPLACE FUNCTION b.trg_alta_producto()
RETURNS TRIGGER AS $$
BEGIN 
    RAISE NOTICE 'Se agrego el nombre %, descripcion % y precio % ',
    NEW.name, NEW.description, NEW.price;
    INSERT INTO b.log(detail) VALUES(concat('Se agrego el nombre',NEW.name,'de descripcion',NEW.description,'y precio',NEW.price));
    RETURN NEW;
END;
$$LANGUAGE plpgsql;
CREATE TRIGGER trg_alta_producto AFTER INSERT ON b.products FOR EACH ROW EXECUTE PROCEDURE b.trg_alta_producto();

CREATE OR REPLACE FUNCTION b.trg_baja_producto()
RETURNS TRIGGER AS $$
BEGIN 
    RAISE NOTICE 'Se elimino el nombre %, descripcion % y precio % ',
    OLD.name, OLD.description, OLD.price;
    INSERT INTO b.log(detail) VALUES(concat('Se elimino el nombre',OLD.name,'de descripcion',OLD.description,'y precio',OLD.price));
    RETURN OLD;
END;
$$LANGUAGE plpgsql;
CREATE TRIGGER trg_baja_producto AFTER DELETE ON b.products FOR EACH ROW EXECUTE PROCEDURE b.trg_baja_producto();

CREATE OR REPLACE FUNCTION b.trg_modificacion_producto()
RETURNS TRIGGER AS $$
BEGIN 
    IF NEW.name!=OLD.name
    THEN
	INSERT INTO b.log(detail) VALUES(concat('Se modifico el nombre',OLD.name,'por',NEW.name));
	RAISE NOTICE 'Se modifico el nombre % por %',OLD.name,NEW.name;
     END IF;

       IF NEW.description!=OLD.description
    THEN
	INSERT INTO b.log(detail) VALUES(concat('Se modifico la descripcion',OLD.description,'por',NEW.description));
	RAISE NOTICE 'Se modifico la descripcion % por %',OLD.description,NEW.description;
    END IF;

      IF NEW.price!=OLD.price
    THEN
	INSERT INTO b.log(detail) VALUES(concat('Se modifico el precio',OLD.price,'por',NEW.price));
	RAISE NOTICE 'Se modifico el precio % por %',OLD.price,NEW.price;
     END IF;
     RETURN NEW;
END;
$$LANGUAGE plpgsql;
CREATE TRIGGER trg_modificacion_producto AFTER UPDATE ON b.products FOR EACH ROW EXECUTE PROCEDURE b.trg_modificacion_producto();
