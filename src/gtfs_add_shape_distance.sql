-- This script uses PostGIS to fill in the shape_dist_traveled  field in the shapes table using shape geometries.
-- It assumes that gtfs_tables_makespatial.sql has been run to build said geometries

-- It also uses the US National Atlas Equal-Area projection. 
-- When processing GTFS feeds outside the US, please use a different projection.
-- shape_dist is in Meters unless projection is changed.
\! echo "Begin gtfs_add_shape_distance.sql"
drop table if exists gtfs_shape_lengths;

begin;

create table gtfs_shape_lengths as
select shape_id, st_length(st_transform(the_geom,2163)) as shape_dist from gtfs_shape_geoms;

commit;
\! echo "End gtfs_add_shape_distance.sql"
