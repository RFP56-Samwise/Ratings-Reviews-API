-- Table: public.review_photos

-- DROP TABLE IF EXISTS public.review_photos;

CREATE TABLE IF NOT EXISTS public.review_photos
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    review_id integer NOT NULL,
    url text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT review_photos_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.review_photos
    OWNER to schill;
-- Index: review_photos_review_id_idx

-- DROP INDEX IF EXISTS public.review_photos_review_id_idx;

CREATE INDEX IF NOT EXISTS review_photos_review_id_idx
    ON public.review_photos USING btree
    (review_id ASC NULLS LAST)
    TABLESPACE pg_default;