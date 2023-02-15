CREATE DATABASE museu;
use museu;

CREATE TABLE pintura(
id SERIAL PRIMARY KEY,
titulo VARCHAR (30) NOT NULL,
criacao VARCHAR (30)
);

INSERT INTO pintura (titulo, criacao) VALUES
('Monalisa', '1503 a 1519'),
('Odd Eye', 2016),
('It Was You', 2014),
('The Potato Eaters', 1885);

INSERT INTO pintura (titulo) VALUES
('Sunflowers'),
('The Starry Night'),
('Ohana'),
('Hello Again');

INSERT INTO pintura (titulo) VALUES
('Girl with a Pearl Earring'),
('Guernica');

CREATE TABLE pintor(
id_pintor INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR (50) NOT NULL,
origem VARCHAR (40)
);

INSERT INTO pintor (nome, origem) VALUES
('Leonardo da Vinci', 'Itália'),
('Audrey Kawasaki','Estados Unidos'),
('Fuco Ueda', 'Japão'),
('Van Gogh','Holanda'); 


INSERT INTO pintor (nome) VALUES
('Georges Seurat'),
('Pablo Picasso');

ALTER TABLE pintura
ADD COLUMN fk_id_pintor INT,
ADD CONSTRAINT fk_pintor FOREIGN KEY (fk_id_pintor) REFERENCES pintor (id_pintor)
ON DELETE CASCADE;

UPDATE pintura
SET fk_id_pintor = 4
WHERE id = 4;

SELECT pintura.titulo, pintor.nome, pintor.origem 
FROM pintura
INNER JOIN pintor ON pintor.id_pintor = pintura.fk_id_pintor;

SELECT pintura.titulo, pintor.nome
FROM pintura
LEFT JOIN pintor ON pintor.id_pintor = pintura.fk_id_pintor;

SELECT pintura.titulo, pintor.nome
FROM pintura
RIGHT JOIN pintor ON pintor.id_pintor = pintura.fk_id_pintor;

