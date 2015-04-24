CREATE OR REPLACE VIEW tos_bluray AS
 SELECT ep.id,
    ep.title,
    ms.season,
    mv.sequence AS disc
   FROM episode ep,
    media_set ms,
    medium_type mt,
    medium_volume mv,
    medium_volume_episode mve,
    series s
  WHERE (((((((ep.id = mve.episode) AND (ms.id = mv.media_set)) AND (ms.type = mt.id)) AND (mve.volume = mv.id)) AND (s.id = ep.series)) AND (s.title = 'Star Trek: The Original Series'::text)) AND (mt.type = 'Blu-ray'::text))
  ORDER BY ep.airdate, ep.production_code;
