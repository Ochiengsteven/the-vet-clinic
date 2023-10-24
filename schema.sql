CREATE DATABASE vet_clinic;

CREATE TABLE animals(
	id int NOT NULL PRIMARY KEY,
	name VARCHAR(25),
	date_of_birth DATE,
	escape_attempts INT,
	neutered BOOLEAN,
	weight_kg DECIMAL
);