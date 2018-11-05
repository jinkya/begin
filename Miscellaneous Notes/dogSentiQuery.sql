-- Table: public.dogsentiment

-- DROP TABLE public.dogsentiment;

CREATE TABLE public.dogsentiment
(
  id integer,
  score real,
  comparative real,
  tokens character varying(500),
  words character varying(500),
  positive character varying(500),
  negative character varying(500),
  CONSTRAINT dogsentiment_id_fkey FOREIGN KEY (id)
      REFERENCES public.dogs (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.dogsentiment
  OWNER TO postgres;
