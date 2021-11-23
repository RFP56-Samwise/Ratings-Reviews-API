-- Table: public.reviews

-- DROP TABLE IF EXISTS public.reviews;

CREATE TABLE IF NOT EXISTS public.reviews
(
    review_id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    product_id integer NOT NULL,
    rating integer NOT NULL,
    date bigint NOT NULL,
    summary character varying(150) COLLATE pg_catalog."default" NOT NULL,
    body character varying(1000) COLLATE pg_catalog."default" NOT NULL,
    recommend boolean DEFAULT false,
    reported boolean DEFAULT false,
    reviewer_name character varying(60) COLLATE pg_catalog."default" NOT NULL,
    email character varying(250) COLLATE pg_catalog."default",
    response character varying(250) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    helpfulness integer NOT NULL DEFAULT 0,
    CONSTRAINT reviews_pkey PRIMARY KEY (review_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.reviews
    OWNER to schill;
-- Index: reviews_product_id_idx

-- DROP INDEX IF EXISTS public.reviews_product_id_idx;

CREATE INDEX IF NOT EXISTS reviews_product_id_idx
    ON public.reviews USING btree
    (product_id ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: reviews_recommend_idx

-- DROP INDEX IF EXISTS public.reviews_recommend_idx;

CREATE INDEX IF NOT EXISTS reviews_recommend_idx
    ON public.reviews USING btree
    (recommend ASC NULLS LAST)
    TABLESPACE pg_default;