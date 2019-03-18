-- Exercices N°2

-- 1 
-- Afficher tous les jeux sans afficher l'id
SELECT nom FROM jeux_video

-- 2
-- Afficher les jeux ordonnés par prix descendant
SELECT nom, prix FROM jeux_video ORDER by prix DESC

-- 3
-- Afficher tous les jeux de Patrick
SELECT nom, possesseur FROM jeux_video WHERE possesseur LIKE 'patrick%' 

-- 4
-- Répondre à la question : "Quel est la moyenne du nombre de joueur par jeu ?"
SELECT nom, nbre_joueurs_max AVG FROM jeux_video AS nbre_joueurs_max

-- 5
-- Répondre à la question : "Quel est le ou les jeu(x) le plus cher ?"
SELECT nom, prix FROM `jeux_video` WHERE prix=ALL(SELECT MAX(prix) FROM jeux_video) 
-- requete imbriquée 

-- 6
-- Afficher les jeux qui sont sur "Xbox"
SELECT nom, console FROM `jeux_video` WHERE console='Xbox'

-- 7
-- Afficher le nombre de jeux qui sont sur la "Xbox"
SELECT console, COUNT(console) FROM `jeux_video` WHERE console='Xbox' 

-- 8
-- Afficher le nombre de jeux par console
SELECT console, COUNT(console) FROM `jeux_video` GROUP by console ORDER by COUNT(console) DESC

-- 9
-- Afficher le nombre de jeux par personne
SELECT possesseur, COUNT(possesseur) FROM `jeux_video` GROUP by possesseur

-- BONUS: 
SELECT possesseur, COUNT(possesseur) , GROUP_CONCAT(nom) AS 'jeux' FROM `jeux_video` GROUP by possesseur

-- 10
-- Afficher les jeux qui contiennent la lettre "x" dans leur nom
SELECT nom FROM `jeux_video` WHERE nom LIKE '%x%'

-- 11
-- Afficher les jeux qui commence par "fi"
SELECT nom FROM `jeux_video` WHERE nom LIKE 'fi%' 

-- 12
-- Repondre à la question : "Quels sont les personnes qui possèdent les jeux qui commence par "fi" ?"
SELECT nom, possesseur FROM `jeux_video` WHERE nom LIKE 'fi%' 

-- 13
-- Repondre à la question : "Combien Corentin a t il de console ?"
SELECT possesseur, COUNT(console) FROM jeux_video WHERE possesseur='Corentin' 

-- Exercices N°3
-- Sachant cela, on voudrait réaliser une nouvelle base de données sur les jeux, qui contiennent les même informations, mais sans aucunes répétitions.
CREATE TABLE IF NOT EXISTS possesseur (ID int(11), nom VARCHAR(45))

CREATE TABLE IF NOT EXISTS console (prix varchar(255), nbre_joueurs_max int(11))

INSERT INTO possesseur (nom) SELECT DISTINCT possesseur FROM jeux_video

INSERT INTO console (nom) SELECT DISTINCT console FROM jeux_video

UPDATE `jeux_video` SET `id_possesseur`=1 WHERE possesseur='Florent'

SELECT * From jeux_video JOIN possesseur ON jeux_video.possesseur= possesseur.nom  -- jointure
SET jeux_video.id_possesseur= possesseur.ID


-- reprendre l'exercice 2

-- 1
-- Afficher tous les jeux sans afficher l'id
SELECT `jeux_video`.nom, `prix`, `nbre_joueurs_max`, `commentaires`, `console`.nom, `possesseur`.nom FROM `jeux_video` JOIN console ON id_console = console.id JOIN possesseur ON id_possesseur = possesseur.ID 

-- 2
-- Afficher les jeux ordonnés par prix descendant
SELECT `jeux_video`.nom, `prix`, `nbre_joueurs_max`, `commentaires`, `console`.nom, `possesseur`.nom FROM `jeux_video` JOIN console ON id_console = console.id JOIN possesseur ON id_possesseur = possesseur.ID ORDER by prix DESC


-- 3
-- Afficher tous les jeux de Patrick
SELECT jeux_video.nom, possesseur.nom FROM jeux_video JOIN possesseur ON id_possesseur= possesseur.ID WHERE possesseur.nom= 'Patrick' 

-- 4
-- -- Répondre à la question : "Quel est la moyenne du nombre de joueur par jeu ?"
SELECT AVG(nbre_joueurs_max) FROM jeux_video
-- 5
-- Répondre à la question : "Quel est le ou les jeu(x) le plus cher ?"
SELECT nom, prix FROM `jeux_video` WHERE prix=ALL(SELECT MAX(prix) FROM jeux_video)

-- 6
-- Afficher les jeux qui sont sur "Xbox"
SELECT jeux_video.nom, console.nom FROM `jeux_video` JOIN console ON id_console= console.id WHERE console.nom='Xbox' 

-- 7
-- Afficher le nombre de jeux qui sont sur la "Xbox"
SELECT COUNT(id_console) FROM `jeux_video` JOIN console ON id_console= console.id WHERE console.nom='Xbox'

-- 8
-- Afficher le nombre de jeux par console
SELECT id_console, console.nom, COUNT(*) FROM `jeux_video` JOIN console ON id_console= console.id GROUP by id_console

-- 9
-- Afficher le nombre de jeux par personne
SELECT id_possesseur, possesseur.nom, COUNT(*) FROM `jeux_video` JOIN possesseur ON id_possesseur= possesseur.id GROUP by id_possesseur

-- 10
-- Afficher les jeux qui contiennent la lettre "x" dans leur nom
SELECT nom FROM `jeux_video` WHERE nom LIKE '%x%'

-- 11
-- Afficher les jeux qui commence par "fi"
SELECT nom FROM `jeux_video` WHERE nom LIKE 'fi%' 

-- 12
-- Repondre à la question : "Quels sont les personnes qui possèdent les jeux qui commence par "fi" ?"
SELECT jeux_video.nom, possesseur.nom FROM `jeux_video` JOIN possesseur ON id_possesseur= possesseur.id WHERE jeux_video.nom LIKE 'fi%' 

-- 13
-- Repondre à la question : "Combien Corentin a t il de console ?"
SELECT COUNT(id_console), possesseur.nom FROM jeux_video JOIN possesseur ON id_possesseur= possesseur.id WHERE possesseur.nom='Corentin' 


-- Notes
SELECT DISTINCT possesseur FROM `jeux_video` -- DISTINCT enlève les doublons

ALTER TABLE `jeux_video`
  DROP `possesseur`; -- supression colonne
  
  ALTER TABLE `jeux_video` ADD FOREIGN KEY (`id_possesseur`) REFERENCES `possesseur`(`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT; -- contrainte de clé étrangère pour id_possesseur 