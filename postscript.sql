COMMENT ON SCHEMA
    agi_grundbuchplan_pub
IS
    'Zusätzliche Tabellen, um den Plan für das Grundbuch korrekt darzustellen. Fragen: stefan.ziegler@bd.so.ch'
;

GRANT USAGE ON SCHEMA agi_grundbuchplan_pub TO public, ogc_server, sogis_service, gretl;

GRANT SELECT ON ALL TABLES IN SCHEMA agi_grundbuchplan_pub TO public, ogc_server, sogis_service;

GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA agi_grundbuchplan_pub TO gretl;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA agi_grundbuchplan_pub TO gretl;



--TODO


CREATE INDEX grundbuchplan_boflaechesymbol_art_txt_idx ON agi_grundbuchplan_pub.grundbuchplan_boflaechesymbol USING btree (art_txt);
CREATE INDEX grundbuchplan_boflaechesymbol_bfsnr_idx ON agi_grundbuchplan_pub.grundbuchplan_boflaechesymbol USING btree (bfs_nr);

CREATE INDEX grundbuchplan_grenzpunkt_bfsnr_idx ON agi_grundbuchplan_pub.grundbuchplan_grenzpunkt USING btree (bfs_nr);
CREATE INDEX grundbuchplan_grenzpunkt_punktzeichen_idx ON agi_grundbuchplan_pub.grundbuchplan_grenzpunkt USING btree (punktzeichen);
CREATE INDEX grundbuchplan_grenzpunkt_gueltigkeit_idx ON agi_grundbuchplan_pub.grundbuchplan_grenzpunkt USING btree (gueltigkeit);
CREATE INDEX grundbuchplan_grenzpunkt_mutation_idx ON agi_grundbuchplan_pub.grundbuchplan_grenzpunkt USING btree (mutation);

CREATE INDEX grundbuchplan_grundstueckpos_bfsnr_idx ON agi_grundbuchplan_pub.grundbuchplan_grundstueckpos USING btree (bfs_nr);
CREATE INDEX grundbuchplan_grundstueckpos_art_idx ON agi_grundbuchplan_pub.grundbuchplan_grundstueckpos USING btree (art);
CREATE INDEX grundbuchplan_grundstueckpos_mutation_idx ON agi_grundbuchplan_pub.grundbuchplan_grundstueckpos USING btree (mutation);

CREATE INDEX grundbuchplan_liegenschaft_bfsnr_idx ON agi_grundbuchplan_pub.grundbuchplan_liegenschaft USING btree (bfs_nr);
CREATE INDEX grundbuchplan_liegenschaft_mutation_idx ON agi_grundbuchplan_pub.grundbuchplan_liegenschaft USING btree (mutation);
