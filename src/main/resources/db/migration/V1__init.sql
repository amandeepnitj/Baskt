CREATE EXTENSION IF NOT EXISTS postgis;
CREATE EXTENSION IF NOT EXISTS pg_trgm;

CREATE TABLE users (
                       id            BIGSERIAL PRIMARY KEY,
                       email         VARCHAR(255) NOT NULL UNIQUE,
                       password_hash VARCHAR(255) NOT NULL,
                       role          VARCHAR(20)  NOT NULL,
                       created_at    TIMESTAMPTZ  NOT NULL DEFAULT now()
);

CREATE TABLE stores (
                        id         BIGSERIAL PRIMARY KEY,
                        owner_id   BIGINT       NOT NULL REFERENCES users(id),
                        name       VARCHAR(150) NOT NULL,
                        phone      VARCHAR(20)  NOT NULL,
                        address    VARCHAR(300) NOT NULL,
                        location   geography(Point, 4326) NOT NULL,
                        verified   BOOLEAN      NOT NULL DEFAULT false,
                        created_at TIMESTAMPTZ  NOT NULL DEFAULT now()
);
CREATE INDEX idx_stores_location ON stores USING GIST (location);

CREATE TABLE products (
                          id       BIGSERIAL PRIMARY KEY,
                          name     VARCHAR(200) NOT NULL,
                          brand    VARCHAR(100),
                          category VARCHAR(100),
                          unit     VARCHAR(30)
);
CREATE INDEX idx_products_name_trgm ON products USING GIN (name gin_trgm_ops);

CREATE TABLE store_products (
                                store_id   BIGINT        NOT NULL REFERENCES stores(id),
                                product_id BIGINT        NOT NULL REFERENCES products(id),
                                price      NUMERIC(10,2) NOT NULL CHECK (price >= 0),
                                in_stock   BOOLEAN       NOT NULL DEFAULT true,
                                updated_at TIMESTAMPTZ   NOT NULL DEFAULT now(),
                                version    BIGINT        NOT NULL DEFAULT 0,
                                PRIMARY KEY (store_id, product_id)
);