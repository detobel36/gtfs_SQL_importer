\! echo "Begin cartodb_shape_geoms.sql"

SELECT shapes.shape_id, ST_SetSRID(ST_MakeLine(shapes.the_geom), 4326) As the_geom
  FROM (
    SELECT shape_id, ST_MakePoint(shape_pt_lon, shape_pt_lat) AS the_geom
    FROM shapes 
    ORDER BY shape_id, shape_pt_sequence
  ) AS shapes
GROUP BY shapes.shape_id;

\! echo "End cartodb_shape_geoms.sql"
