-- Tabla raw: datos directos de la API NASA NeoWs
CREATE TABLE IF NOT EXISTS asteroids (
    id BIGINT PRIMARY KEY,
    name TEXT,
    absolute_magnitude_h FLOAT,
    diameter_min_km FLOAT,
    diameter_max_km FLOAT,
    velocity_km_per_hour FLOAT,
    miss_distance_km FLOAT,
    close_approach_date DATE,
    is_potentially_hazardous BOOLEAN
);

-- Tabla feature store: features procesadas listas para ML
CREATE TABLE IF NOT EXISTS asteroids_features (
    id BIGINT PRIMARY KEY,
    absolute_magnitude_h FLOAT,
    diameter_mean_km_log FLOAT,
    velocity_km_per_hour_log FLOAT,
    miss_distance_km_log FLOAT,
    is_potentially_hazardous BOOLEAN
);

-- Row Level Security
ALTER TABLE asteroids ENABLE ROW LEVEL SECURITY;
ALTER TABLE asteroids_features ENABLE ROW LEVEL SECURITY;

CREATE POLICY "public read asteroids"
ON asteroids FOR SELECT USING (true);

CREATE POLICY "public write asteroids"
ON asteroids FOR INSERT WITH CHECK (true);

CREATE POLICY "public update asteroids"
ON asteroids FOR UPDATE USING (true);

CREATE POLICY "public read asteroids_