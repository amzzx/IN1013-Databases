-- IN1013 - HW 4: Task 2 (UPDATE PART)

-- 1. Insert into events table the information ‘Fluffy’, ‘2020-10-15’, ‘vet’, ‘antibiotics’.
-- SELECT * FROM petEvent;
INSERT INTO petEvent VALUES ("Fluffy", "2020-10-15", "vet", "antibiotics");
-- SELECT * FROM petEvent;

-- 2. Insert into events table the information ‘Hammy’, ‘2020-10-15’, ‘vet’, ‘antibiotics’. 
-- Note that Hammy is a male ‘hamster’ of ‘Diane’ which was born on 2010-10-30 and STILL DIDN’T DIE.
-- SELECT * FROM petPet;
INSERT INTO petPet VALUES ("Hammy", "Diane", "hamster", "M", "2010-10-30", NULL);
INSERT INTO petEvent VALUES ("Hammy", "2020-10-15", "vet", "antibiotics");
-- SELECT * FROM petEvent;
-- SELECT * FROM petPet;

-- 3. It appeared that Fluffy had 5 kittens 2 of which are male.
-- I had to to insert a random date for this event, as the date cannot be NULL (part of the primary key), this detail weren't specified in the homework
INSERT INTO petEvent VALUES ("Fluffy", "2020-10-15", "litter", "5 kittens, 3 female, 2 male");
-- SELECT * FROM petEvent;

-- 4. Also, on “1997-08-03” it was Claws who broke the rib.
UPDATE petEvent SET petname = "Claws" WHERE eventdate = "1997-08-03" AND remark = "broken rib";
-- SELECT * FROM petEvent;

-- 5. Unfortunately, Puffball died on ‘2020-09-01’.
UPDATE petPet SET death = "2020-09-01" WHERE petname = "Puffball";
-- SELECT * FROM petPet;
-- DESC petEvent;

-- 6. Harold asked me to remove his dog from my database due to GDPR.
-- Drop the existing foreign key so we can add a constraint to it. First find the name of the foreign key to drop.
-- SELECT CONSTRAINT_NAME FROM information_schema.KEY_COLUMN_USAGE WHERE TABLE_NAME = 'petEvent';
ALTER TABLE petEvent DROP FOREIGN KEY petevent_ibfk_1;
-- Then add the new one with the desired cascade constraint option. 
ALTER TABLE petEvent ADD CONSTRAINT fk_petname FOREIGN KEY (petname) REFERENCES petPet(petName) ON DELETE CASCADE;
-- DESC petEvent;
-- SELECT * FROM petEvent;
-- Remove Harold's dog from petPet table (and the corresponding dog data should be removed from petEvent).
DELETE FROM petPet WHERE owner = "Harold" AND species = "dog";
-- SELECT * FROM petPet;
-- SELECT * FROM petEvent;