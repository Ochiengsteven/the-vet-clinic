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
SET owner_id = (SELECT id FROM owners WHERE name = 'Sam Smith')
WHERE name = 'Agumon';

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE name = 'Jennifer Orwell')
WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE name = 'Bob')
WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE name = 'Melody Pond')
WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE name = 'Dean Winchester')
WHERE name IN ('Angemon', 'Boarmon');
