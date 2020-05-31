CREATE TRIGGER `wyzwalacz1` after INSERT 
ON `osoba` 
FOR EACH row 
  INSERT INTO logs 
  VALUES      (NULL, 
               new.id_osoba, 
               'Inserted osoba', 
               Now()); 
