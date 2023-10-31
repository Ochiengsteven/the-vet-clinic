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

-- What animals belong to Melody Pond
SELECT a.name AS animal_name
FROM animals a
JOIN owners o ON a.owner_id = o.id
WHERE o.full_name = 'Melody Pond';

-- List of all animals that are Pokemon
SELECT a.name AS animal_name
FROM animals a
JOIN species s ON a.species_id = s.id
WHERE s.name = 'Pokemon';

-- List all owners and their animals, including those who don't own any animals
SELECT o.full_name AS owner_name,
       a.name AS animal_name
FROM owners o
LEFT JOIN animals a ON o.id = a.owner_id;

-- How many animals are there per species
SELECT s.name AS species_name,
       COUNT(*) AS total_animals
FROM species s
JOIN animals a ON s.id = a.species_id
GROUP BY s.name;

-- List all Digimon owned by Jennifer Orwell
SELECT a.name AS animal_name
FROM animals a
JOIN owners o ON a.owner_id = o.id
JOIN species s ON a.species_id = s.id
WHERE o.full_name = 'Jennifer Orwell'
  AND s.name = 'Digimon';

-- List all animals owned by Dean Winchester that haven't tried to escape
SELECT a.name AS animal_name
FROM animals a
JOIN owners o ON a.owner_id = o.id
WHERE o.full_name = 'Dean Winchester'
  AND a.escape_attempts = 0;

-- who owns the most animals
SELECT full_name, COUNT(*) AS total_animals
FROM animals
JOIN owners ON animals.owner_id = owners.id
GROUP BY full_name
ORDER BY total_animals DESC
LIMIT 1;

--  last animal seen by William Tatcher
SELECT a.name AS last_seen_animal
FROM visits v
JOIN animals a ON v.animal_id = a.id
WHERE v.vet_id = (SELECT id FROM vets WHERE name = 'William Tatcher')
ORDER BY v.visit_date DESC
LIMIT 1;

-- How many different animals did Stephanie Mendez see
SELECT COUNT(DISTINCT v.animal_id) AS different_animals_seen
FROM visits v
WHERE v.vet_id = (SELECT id FROM vets WHERE name = 'Stephanie Mendez');

-- all vets and their specialties, including vets with no specialties
SELECT v.name AS vet_name, COALESCE(s.name, 'No specialty') AS specialty
FROM vets v
LEFT JOIN specializations sp ON v.id = sp.vet_id
LEFT JOIN species s ON sp.species_id = s.id;

--  all animals that visited Stephanie Mendez between April 1st and August 30th, 2020
SELECT a.name AS animal_name, v.visit_date
FROM visits v
JOIN animals a ON v.animal_id = a.id
WHERE v.vet_id = (SELECT id FROM vets WHERE name = 'Stephanie Mendez')
    AND v.visit_date BETWEEN '2020-04-01' AND '2020-08-30';

-- what animal had the most visits
SELECT a.name AS animal_name, COUNT(v.animal_id) AS visit_count
FROM visits v
JOIN animals a ON v.animal_id = a.id
GROUP BY a.name
ORDER BY visit_count DESC
LIMIT 1;

-- Maisy Smith's first visit
SELECT a.name AS first_visit_animal, MIN(v.visit_date) AS first_visit_date
FROM visits v
JOIN animals a ON v.animal_id = a.id
WHERE v.vet_id = (SELECT id FROM vets WHERE name = 'Maisy Smith')
GROUP BY a.name
ORDER BY first_visit_date
LIMIT 1;

-- Details for the most recent visit: animal information, vet information, and date of visit
SELECT a.name AS animal_name, v.visit_date, ve.name AS vet_name
FROM visits v
JOIN animals a ON v.animal_id = a.id
JOIN vets ve ON v.vet_id = ve.id
ORDER BY v.visit_date DESC
LIMIT 1;

-- How many visits were with a vet that did not specialize in that animal's species
SELECT COUNT(*) AS visits_without_specialty
FROM visits v
LEFT JOIN specializations s ON v.vet_id = s.vet_id AND v.animal_id = s.species_id
WHERE s.vet_id IS NULL;

--  specialty should Maisy Smith consider getting
SELECT s.name AS potential_specialty, COUNT(*) AS visit_count
FROM visits v
JOIN specializations sp ON v.vet_id = sp.vet_id
JOIN species s ON sp.species_id = s.id
WHERE v.vet_id = (SELECT id FROM vets WHERE name = 'Maisy Smith')
GROUP BY s.name
ORDER BY visit_count DESC
LIMIT 1;

-----------------------------------------------
/* =========== Queries to see execution time of specific requests =========== */

EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animal_id = 4;

EXPLAIN ANALYZE SELECT * FROM visits where vet_id = 2;

EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';
