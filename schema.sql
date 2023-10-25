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

-- transaction to set species to unspecified
BEGIN TRANSACTION;

UPDATE animals
SET species = 'unspecified';

-- Verify the change was made
SELECT * FROM animals;

-- Roll back the transaction
ROLLBACK;

-- Verify that the species column is back to its original state
SELECT * FROM animals;

-- set species to pokemon and digimon
BEGIN TRANSACTION;

-- Update the species column to "digimon" for animals with names ending in "mon"
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';

UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL OR species = '';

SELECT * FROM animals;

COMMIT;

-- Verify that changes persist after the commit
SELECT * FROM animals;

-- Delete data transaction and rollbac
BEGIN TRANSACTION;

DELETE FROM animals;

ROLLBACK;

-- delete animals born after 2022 and update weight
BEGIN TRANSACTION;

-- Delete all animals born after Jan 1st, 2022
DELETE FROM animals
WHERE birthdate > '2022-01-01';

-- Create a savepoint for the transaction
SAVEPOINT before_update;

-- Update all animals' weight to be their weight multiplied by -1
UPDATE animals
SET weight = weight * -1;

-- Rollback to the savepoint
ROLLBACK TO before_update;

-- Update all animals' weights that are negative to be their weight multiplied by -1
UPDATE animals
SET weight = weight * -1
WHERE weight < 0;

COMMIT;