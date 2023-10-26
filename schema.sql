CREATE DATABASE vet_clinic;

-- create table and columns
CREATE TABLE animals(
	id int NOT NULL PRIMARY KEY,
	name VARCHAR(25),
	date_of_birth DATE,
	escape_attempts INT,
	neutered BOOLEAN,
	weight_kg DECIMAL
);

-- add column species
ALTER TABLE animals
ADD species VARCHAR(50);

-- create table owners
CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    age INT
);

-- create table species
CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

-- set animals id to primary key and auto increment
ALTER TABLE animals DROP COLUMN id;
ALTER TABLE animals ADD COLUMN id SERIAL PRIMARY KEY;

-- Remove the "species" column and Add the "species_id" column as a foreign key referencing the "species" table
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id INT;
ALTER TABLE animals
ADD CONSTRAINT fk_species
FOREIGN KEY (species_id)
REFERENCES species (id);

-- Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE animals
ADD CONSTRAINT fk_owners
FOREIGN KEY (owner_id)
REFERENCES owners (id);
