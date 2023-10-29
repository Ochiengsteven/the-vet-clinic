INSERT INTO animals VALUES (1,'Agumon', '2020-02-03', 0, TRUE, 10.23);
INSERT INTO animals VALUES (2,'Gabumon', '2018-11-15', 2, TRUE, 8);
INSERT INTO animals VALUES (3,'Pikachu', '2021-01-07', 1, FALSE, 15.04);
INSERT INTO animals VALUES (4,'Devimon', '2017-05-12', 5, TRUE, 11);

-- insert additional data
-- Insert Charmander's information
INSERT INTO animals VALUES (5, 'Charmander', '2020-02-08', 0, FALSE, -11);

-- Insert Plantmon's information
INSERT INTO animals VALUES (6, 'Plantmon', '2021-11-15', 2, TRUE, -5.7);

-- Insert Squirtle's information
INSERT INTO animals VALUES (7, 'Squirtle', '1993-04-02', 3, FALSE, -12.13);

-- Insert Angemon's information
INSERT INTO animals VALUES (8, 'Angemon', '2005-06-12', 1, TRUE, -45);

-- Insert Boarmon's information
INSERT INTO animals VALUES (9, 'Boarmon', '2005-06-07', 7, TRUE, 20.4);

-- Insert Blossom's information
INSERT INTO animals VALUES (10, 'Blossom', '1998-10-13', 3, TRUE, 17);

-- Insert Ditto's information
INSERT INTO animals VALUES (11, 'Ditto', '2022-05-14', 4, TRUE, 22);

-- insert values to the owners table
INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);

-- Insert data into the species table
INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');

-- Update the species_id for animals whose names end in "mon" to be "Digimon"
UPDATE animals
SET species_id = (SELECT id FROM species WHERE name = 'Digimon')
WHERE name LIKE '%mon';

-- Update the species_id for all other animals to be "Pokemon"
UPDATE animals
SET species_id = (SELECT id FROM species WHERE name = 'Pokemon')
WHERE name NOT LIKE '%mon';

-- Update owner_id for animals based on owner information
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith')
WHERE name = 'Agumon';

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob')
WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond')
WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
WHERE name IN ('Angemon', 'Boarmon');

-- inser vets data
INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, '2019-01-17');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, '1981-05-04');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, '2008-06-08');


-- insert specializations data
-- Vet IDs
SELECT id FROM vets WHERE name = 'William Tatcher';
SELECT id FROM vets WHERE name = 'Stephanie Mendez';
SELECT id FROM vets WHERE name = 'Jack Harkness';

-- Species IDs
SELECT id FROM species WHERE name = 'Pokemon';
SELECT id FROM species WHERE name = 'Digimon';

INSERT INTO specializations (vet_id, species_id) VALUES (1, 1); -- William Tatcher is specialized in Pokemon
INSERT INTO specializations (vet_id, species_id) VALUES (2, 2); -- Stephanie Mendez is specialized in Digimon
INSERT INTO specializations (vet_id, species_id) VALUES (2, 1); -- Stephanie Mendez is also specialized in Pokemon
INSERT INTO specializations (vet_id, species_id) VALUES (3, 2); -- Jack Harkness is specialized in Digimon


-- Insert visit data

-- Agumon visits
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (1, 1, '2020-05-24'); -- Agumon visited William Tatcher on May 24th, 2020
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (2, 1, '2020-07-22'); -- Agumon visited Stephanie Mendez on Jul 22th, 2020

-- Gabumon visits
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (3, 2, '2021-02-02'); -- Gabumon visited Jack Harkness on Feb 2nd, 2021

-- Pikachu visits
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (2, 3, '2020-01-05'); -- Pikachu visited Maisy Smith on Jan 5th, 2020
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (2, 3, '2020-03-08'); -- Pikachu visited Maisy Smith on Mar 8th, 2020
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (2, 3, '2020-05-14'); -- Pikachu visited Maisy Smith on May 14th, 2020

-- Devimon visits
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (2, 4, '2021-05-04'); -- Devimon visited Stephanie Mendez on May 4th, 2021

-- Charmander visit
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (3, 5, '2021-02-24'); -- Charmander visited Jack Harkness on Feb 24th, 2021

-- Plantmon visits
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (1, 6, '2019-12-21'); -- Plantmon visited Maisy Smith on Dec 21st, 2019
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (1, 6, '2020-08-10'); -- Plantmon visited William Tatcher on Aug 10th, 2020
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (2, 6, '2021-04-07'); -- Plantmon visited Maisy Smith on Apr 7th, 2021

-- Squirtle visit
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (2, 7, '2019-09-29'); -- Squirtle visited Stephanie Mendez on Sep 29th, 2019

-- Angemon visits
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (3, 8, '2020-10-03'); -- Angemon visited Jack Harkness on Oct 3rd, 2020
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (3, 8, '2020-11-04'); -- Angemon visited Jack Harkness on Nov 4th, 2020

-- Boarmon visits
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (2, 9, '2019-01-24'); -- Boarmon visited Maisy Smith on Jan 24th, 2019
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (2, 9, '2019-05-15'); -- Boarmon visited Maisy Smith on May 15th, 2019
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (2, 9, '2020-02-27'); -- Boarmon visited Maisy Smith on Feb 27th, 2020
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (2, 9, '2020-08-03'); -- Boarmon visited Maisy Smith on Aug 3rd, 2020

-- Blossom visits
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (2, 10, '2020-05-24'); -- Blossom visited Stephanie Mendez on May 24th, 2020
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (1, 10, '2021-01-11'); -- Blossom visited William Tatcher on Jan 11th, 2021


-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';
