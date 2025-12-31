CREATE DATABASE Emp_Dep;
USE Emp_Dep;

CREATE TABLE Departements(NumDep INT PRIMARY KEY AUTO_INCREMENT,
                          NomDep VARCHAR(60) NOT NULL,
                          VilleDep VARCHAR(60));

 CREATE TABLE Employes(IdEmp INT PRIMARY KEY AUTO_INCREMENT,
                       NomEmp VARCHAR(60) NOT NULL,
                       DateEmbEmp DATE,
                       SalaireEmp DECIMAL(10,2),
                       ComEmp DECIMAL(10,2),
                       NumDep INT,
                       CONSTRAINT fk_emp_dep 
                       FOREIGN KEY (NumDep) REFERENCES Departements(NumDep));

INSERT INTO Departements(NomDep,VilleDep)
     VALUES ('informatique','casablanca'),
            ('comptabilite','rabat'),
            ('electrique','fes');

INSERT INTO Employes(NomEmp,DateEmbEmp,SalaireEmp,ComEmp,NumDep)
     VALUES ('Ahmed','2021-02-01',500,50,1),
            ('Sara','2020-06-15',450,0,1),
            ('Youssef','2019-01-10',600,70,2),
            ('Imane','2022-09-20',400,30,3);

--REQUETE 1: Les départements de la ville de Casablanca
SELECT nomdep
FROM Departements
WHERE VilleDep='Casablanca';
+--------------+
| nomdep       |
+--------------+
| informatique |
+--------------+

--REQUETE 2: Les départements dont le numéro est 1
SELECT *
FROM Departements
WHERE NumDep=1;
+--------+--------------+------------+
| NumDep | NomDep       | VilleDep   |
+--------+--------------+------------+
|      1 | informatique | casablanca |
+--------+--------------+------------+

--REQUETE 3: la liste des employés ayant une commission
SELECT NomEmp,SalaireEmp,NomDep
FROM Employes NATURAL JOIN Departements
WHERE ComEmp>0;
+---------+------------+--------------+
| NomEmp  | SalaireEmp | NomDep       |
+---------+------------+--------------+
| Ahmed   |     500.00 | informatique |
| Youssef |     600.00 | comptabilite |
| Imane   |     400.00 | electrique   |
+---------+------------+--------------+

--REQUETE 4: les noms des employés ayant un salaire
SELECT NomEmp,NomDep
FROM Employes NATURAL JOIN Departements
WHERE SalaireEmp>0;
+---------+--------------+
| NomEmp  | NomDep       |
+---------+--------------+
| Ahmed   | informatique |
| Sara    | informatique |
| Youssef | comptabilite |
| Imane   | electrique   |
+---------+--------------+
