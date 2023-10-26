-- animals with the names ending with mon
SELECT * FROM animals
WHERE name LIKE '%mon';

-- names of animals date_of_birth BETWEEN '2016-01-01' AND '2019-12-31'
SELECT name FROM animals
WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

-- names of animals that are neutered and have less than 3 escape attempts
SELECT name FROM animals
WHERE neutered = TRUE AND escape_attempts < 3;

SELECT date_of_birth FROM animals
WHERE name IN ('Agumon', 'Pikachu');

SELECT name, escape_attempts FROM animals
WHERE weight_kg > 10.5;

SELECT * FROM animals
WHERE neutered = TRUE;

SELECT * FROM animals
WHERE name <> 'Gabumon';

SELECT * FROM animals
WHERE weight_kg BETWEEN 10.4 AND 17.3;

-- how many animals are there
SELECT COUNT(*) AS total_animals
FROM animals;

-- how many animals are there that never tried escaping
SELECT COUNT(*) AS non_escape_count
FROM animals
WHERE escape_attempts = 0;

-- avarage weight of animals
SELECT AVG(weight_kg) AS avg_weight
FROM animals;

-- Who escapes the most, neutered or not neutered animals?
SELECT name, escape_attempts AS max_escapes
FROM animals
WHERE escape_attempts = (SELECT MAX(escape_attempts) FROM animals);

-- The minimum and maximum weight of each type of animal.
SELECT species,
       MIN(weight_kg) AS min_weight,
       MAX(weight_kg) AS max_weight
FROM animals
WHERE species IN ('pokemon', 'digimon')
GROUP BY species;

-- Average number of escape attempts per animal type of those born between 1990 and 2000
SELECT species,
       AVG(escape_attempts) AS average_escapes
FROM animals
WHERE species IN ('pokemon', 'digimon')
  AND date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;

-- TRANSACTIONS

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