-- Modificació de la taula municipis
ALTER TABLE municipis
	MODIFY codi_ine CHAR(5) NOT NULL;
ALTER TABLE municipis
	DROP INDEX `uk_municipis_codi_ine`,
    ADD UNIQUE INDEX `uk_municipis_codi_ine` (`codi_ine` ASC,`districte` ASC) VISIBLE;
    
    
-- Modificació taula persones
ALTER TABLE candidats 
	DROP CONSTRAINT fk_candidats_persones1;
ALTER TABLE persones
	MODIFY COLUMN persona_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	MODIFY COLUMN dni CHAR(10) DEFAULT NULL;
ALTER TABLE candidats 
	ADD   CONSTRAINT `fk_candidats_persones1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `grup1eleccions`.`persones` (`persona_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

ALTER TABLE persones 
	DROP INDEX `uk_candidats_dni`;
    
-- Modificació taula eleccions_municipis
ALTER TABLE eleccions_municipis
	MODIFY COLUMN vots_valids INT UNSIGNED GENERATED ALWAYS AS (vots_candidatures+vots_nuls) STORED,
    MODIFY COLUMN vots_emesos INT UNSIGNED GENERATED ALWAYS AS (vots_candidatures+vots_blanc+vots_nuls) STORED;


