-- Allow subsequent `make` runs work by dropping existing tables/views
DROP VIEW IF EXISTS cont;
DROP VIEW IF EXISTS dis;
DROP VIEW IF EXISTS ds9;
DROP VIEW IF EXISTS ds9_dvd;
DROP VIEW IF EXISTS ent;
DROP VIEW IF EXISTS ent_bluray;
DROP VIEW IF EXISTS ld;
DROP VIEW IF EXISTS pic;
DROP VIEW IF EXISTS pro;
DROP VIEW IF EXISTS short;
DROP VIEW IF EXISTS snw;
DROP VIEW IF EXISTS tas;
DROP VIEW IF EXISTS tas_bluray;
DROP VIEW IF EXISTS tng;
DROP VIEW IF EXISTS tng_bluray;
DROP VIEW IF EXISTS tng_dvd;
DROP VIEW IF EXISTS tos;
DROP VIEW IF EXISTS tos_bluray;
DROP VIEW IF EXISTS tos_dvdr;
DROP VIEW IF EXISTS tos_hddvd;
DROP VIEW IF EXISTS vshort;
DROP VIEW IF EXISTS voy;
DROP VIEW IF EXISTS voy_dvd;
DROP TABLE IF EXISTS medium_volume_episode;
DROP TABLE IF EXISTS medium_volume;
DROP TABLE IF EXISTS media_set;
DROP TABLE IF EXISTS episode;
DROP TABLE IF EXISTS movie;
DROP TABLE IF EXISTS series;

CREATE TABLE episode (
       episode_id INTEGER PRIMARY KEY,
       series_id INTEGER NOT NULL REFERENCES series,
       title TEXT NOT NULL,
       airdate DATE,
       remastered_airdate DATE,
       season INTEGER,
       episode_number INTEGER,
       production_code TEXT,
       stardate NUMERIC,
       date DATETIME,
       vignette BOOLEAN
);

CREATE TABLE media_set (
       media_set_id INTEGER PRIMARY KEY,
       series_id INTEGER NOT NULL REFERENCES series,
       type TEXT NOT NULL,
       season INTEGER
);

CREATE TABLE medium_volume (
       medium_volume_id INTEGER PRIMARY KEY,
       media_set_id INTEGER NOT NULL REFERENCES media_set,
       sequence INTEGER NOT NULL
);

CREATE TABLE medium_volume_episode (
       medium_volume_episode_id INTEGER PRIMARY KEY,
       medium_volume_id INTEGER NOT NULL REFERENCES medium_volume,
       episode_id INTEGER NOT NULL REFERENCES episode
);

CREATE TABLE movie (
       movie_id INTEGER PRIMARY KEY,
       title TEXT NOT NULL,
       release_date DATETIME NOT NULL,
       stardate NUMERIC
);

CREATE TABLE series (
       series_id INTEGER PRIMARY KEY,
       title TEXT NOT NULL,
       begin DATE NOT NULL,
       end DATE
);

-- Premade views to display per-series tables.

CREATE VIEW cont AS
  SELECT episode_id,
         title,
         airdate,
         episode_number,
         stardate,
         vignette
    FROM episode
   WHERE series_id = (SELECT series_id
                        FROM series
                       WHERE title='Star Trek Continues')
   ORDER BY airdate;

CREATE VIEW dis AS
  SELECT episode_id,
         title,
         airdate,
         season,
         episode_number,
         production_code,
         stardate,
         date
    FROM episode
   WHERE series_id = (SELECT series_id
                        FROM series
                       WHERE title='Star Trek: Discovery')
   ORDER BY airdate, production_code;

CREATE VIEW ds9 AS
  SELECT episode_id,
         title,
         airdate,
         season,
         episode_number,
         production_code,
         stardate
    FROM episode
   WHERE series_id = (SELECT series_id
                        FROM series
                       WHERE title='Star Trek: Deep Space Nine')
   ORDER BY airdate;

CREATE VIEW ds9_dvd AS
  SELECT episode.title,
         media_set.season,
         medium_volume.sequence AS disc
    FROM episode
    JOIN medium_volume_episode USING (episode_id)
    JOIN medium_volume USING (medium_volume_id)
    JOIN media_set USING (media_set_id)
    JOIN series USING (series_id)
   WHERE media_set.type = 'DVD'
     AND episode.series_id = (SELECT series_id
                                FROM series
                               WHERE title='Star Trek: Deep Space Nine')
   ORDER BY airdate;

CREATE VIEW ent AS
  SELECT episode_id,
         title,
         airdate,
         season,
         episode_number,
         production_code,
         stardate,
         date
    FROM episode
   WHERE series_id = (SELECT series_id
                        FROM series
                       WHERE title='Star Trek: Enterprise')
   ORDER BY airdate;

CREATE VIEW ent_bluray AS
  SELECT episode.title,
         media_set.season,
         medium_volume.sequence AS disc
    FROM episode
    JOIN medium_volume_episode USING (episode_id)
    JOIN medium_volume USING (medium_volume_id)
    JOIN media_set USING (media_set_id)
    JOIN series USING (series_id)
   WHERE media_set.type = 'Blu-ray'
     AND episode.series_id = (SELECT series_id
                                FROM series
                               WHERE title='Star Trek: Enterprise')
   ORDER BY airdate;

CREATE VIEW ld AS
  SELECT episode_id,
         title,
         airdate,
         season,
         episode_number,
         production_code,
         stardate
    FROM episode
   WHERE series_id = (SELECT series_id
                        FROM series
                       WHERE title='Star Trek: Lower Decks')
   ORDER BY airdate, episode_number;

CREATE VIEW pic AS
  SELECT episode_id,
         title,
         airdate,
         season,
         episode_number,
         production_code,
         stardate
    FROM episode
   WHERE series_id = (SELECT series_id
                        FROM series
                       WHERE title='Star Trek: Picard')
   ORDER BY airdate;

CREATE VIEW pro AS
  SELECT episode_id,
         title,
         airdate,
         season,
         episode_number,
         production_code,
         stardate
    FROM episode
   WHERE series_id = (SELECT series_id
                        FROM series
                       WHERE title='Star Trek: Prodigy')
   ORDER BY airdate, episode_number;

CREATE VIEW sa AS
  SELECT episode_id,
         title,
         airdate,
         season,
         episode_number,
         production_code,
         stardate
    FROM episode
   WHERE series_id = (SELECT series_id
                        FROM series
                       WHERE title='Star Trek: Starfleet Academy')
   ORDER BY airdate;

CREATE VIEW short AS
  SELECT episode_id,
         title,
         airdate,
         season,
         episode_number
    FROM episode
   WHERE series_id = (SELECT series_id
                        FROM series
                       WHERE title='Star Trek: Short Treks')
   ORDER BY airdate, episode_number;

CREATE VIEW snw AS
  SELECT episode_id,
         title,
         airdate,
         season,
         episode_number,
         production_code,
         stardate
    FROM episode
   WHERE series_id = (SELECT series_id
                        FROM series
                       WHERE title='Star Trek: Strange New Worlds')
   ORDER BY airdate;

CREATE VIEW tas AS
  SELECT episode_id,
         title,
         airdate,
         season,
         episode_number,
         production_code,
         stardate
    FROM episode
   WHERE series_id = (SELECT series_id
                        FROM series
                       WHERE title='Star Trek: The Animated Series')
   ORDER BY airdate;

CREATE VIEW tas_bluray AS
  SELECT episode.title,
         medium_volume.sequence AS disc
    FROM episode
    JOIN medium_volume_episode USING (episode_id)
    JOIN medium_volume USING (medium_volume_id)
    JOIN media_set USING (media_set_id)
    JOIN series USING (series_id)
   WHERE media_set.type = 'Blu-ray'
     AND episode.series_id = (SELECT series_id
                                FROM series
                               WHERE title='Star Trek: The Animated Series')
   ORDER BY airdate;

CREATE VIEW tng AS
  SELECT episode_id,
         title,
         airdate,
         season,
         episode_number,
         production_code,
         stardate
    FROM episode
   WHERE series_id = (SELECT series_id
                        FROM series
                       WHERE title='Star Trek: The Next Generation')
   ORDER BY airdate;

CREATE VIEW tng_bluray AS
  SELECT episode.title,
         media_set.season,
         medium_volume.sequence AS disc
    FROM episode
    JOIN medium_volume_episode USING (episode_id)
    JOIN medium_volume USING (medium_volume_id)
    JOIN media_set USING (media_set_id)
    JOIN series USING (series_id)
   WHERE media_set.type = 'Blu-ray'
     AND episode.series_id = (SELECT series_id
                                FROM series
                               WHERE title='Star Trek: The Next Generation')
   ORDER BY airdate;

CREATE VIEW tng_dvd AS
  SELECT episode.title,
         media_set.season,
         medium_volume.sequence AS disc
    FROM episode
    JOIN medium_volume_episode USING (episode_id)
    JOIN medium_volume USING (medium_volume_id)
    JOIN media_set USING (media_set_id)
    JOIN series USING (series_id)
   WHERE media_set.type = 'DVD'
     AND episode.series_id = (SELECT series_id
                                FROM series
                               WHERE title='Star Trek: The Next Generation')
   ORDER BY airdate;

CREATE VIEW tos AS
  SELECT episode_id,
         title,
         airdate,
         remastered_airdate,
         season,
         episode_number,
         production_code,
         stardate
    FROM episode
   WHERE series_id = (SELECT series_id
                        FROM series
                       WHERE title='Star Trek: The Original Series')
   ORDER BY airdate NULLS LAST, production_code;

CREATE VIEW tos_bluray AS
  SELECT episode.title,
         media_set.season,
         medium_volume.sequence AS disc
    FROM episode
    JOIN medium_volume_episode USING (episode_id)
    JOIN medium_volume USING (medium_volume_id)
    JOIN media_set USING (media_set_id)
    JOIN series USING (series_id)
   WHERE media_set.type = 'Blu-ray'
     AND episode.series_id = (SELECT series_id
                                FROM series
                               WHERE title='Star Trek: The Original Series')
   ORDER BY airdate NULLS LAST;

CREATE VIEW tos_dvdr AS
  SELECT episode.title,
         media_set.season,
         medium_volume.sequence AS disc
    FROM episode
    JOIN medium_volume_episode USING (episode_id)
    JOIN medium_volume USING (medium_volume_id)
    JOIN media_set USING (media_set_id)
    JOIN series USING (series_id)
   WHERE media_set.type = 'DVD (remastered)'
     AND episode.series_id = (SELECT series_id
                                FROM series
                               WHERE title='Star Trek: The Original Series')
   ORDER BY airdate NULLS LAST;

CREATE VIEW tos_hddvd AS
  SELECT episode.title,
         media_set.season,
         medium_volume.sequence AS disc
    FROM episode
    JOIN medium_volume_episode USING (episode_id)
    JOIN medium_volume USING (medium_volume_id)
    JOIN media_set USING (media_set_id)
    JOIN series USING (series_id)
   WHERE media_set.type = 'HD DVD'
     AND episode.series_id = (SELECT series_id
                                FROM series
                               WHERE title='Star Trek: The Original Series')
   ORDER BY airdate NULLS LAST;

CREATE VIEW voy AS
  SELECT episode_id,
         title,
         airdate,
         season,
         episode_number,
         production_code,
         stardate
    FROM episode
   WHERE series_id = (SELECT series_id
                        FROM series
                       WHERE title='Star Trek: Voyager')
   ORDER BY airdate;

CREATE VIEW voy_dvd AS
  SELECT episode.title,
         media_set.season,
         medium_volume.sequence AS disc
    FROM episode
    JOIN medium_volume_episode USING (episode_id)
    JOIN medium_volume USING (medium_volume_id)
    JOIN media_set USING (media_set_id)
    JOIN series USING (series_id)
   WHERE media_set.type = 'DVD'
     AND episode.series_id = (SELECT series_id
                                FROM series
                               WHERE title='Star Trek: Voyager')
   ORDER BY airdate;

CREATE VIEW vshort AS
  SELECT episode_id,
         title,
         airdate,
         episode_number,
         production_code
    FROM episode
   WHERE series_id = (SELECT series_id
                        FROM series
                       WHERE title='Star Trek: very Short Treks')
   ORDER BY airdate;
