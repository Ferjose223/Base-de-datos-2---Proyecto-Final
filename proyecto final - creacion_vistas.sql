--Creacion de vistas--





--1ra vista--

CREATE VIEW vEspecialidad_Dentista
as
SELECT CONCAT (a.nombre, " ", a.apellido) AS "Nombre",
e.nombre AS "Especialidad"
FROM dentista AS a
INNER JOIN dentista_especialidad AS b 
ON a.id = b.id_dentista
INNER JOIN especialidades AS e
ON e.id = b.id_especialidad

SELECT * FROM vespecialidad_dentista


-- 2da vistas   --

CREATE VIEW vCita
as
SELECT concat(p.nombre," ",p.apellido) AS "Paciente",
concat(a.nombre," ",a.apellido) AS "Dentista",
t.nombre AS "Tratamiento",
ag.fecha,ag.hora
FROM paciente  AS p
INNER JOIN cita AS c ON c.id_paciente = p.id
INNER JOIN agenda AS ag ON c.id_agenda = ag.id
INNER JOIN dentista AS a ON ag.id_dentista= a.id
INNER JOIN tratamiento AS t ON c.id_tratamiento= t.id

SELECT * FROM vCita


-- 3ra vista -- 
CREATE VIEW vFactura
as
SELECT concat(p.nombre," ",p.apellido) AS "Paciente",
t.nombre AS "Tratamiento", t.costo,f.abono,
m.nombre AS "Metodo de pago",
f.fecha_pago AS "Fecha de pago"
FROM paciente AS p
INNER JOIN factura AS f ON p.id = f.id_paciente
INNER JOIN tratamiento AS t ON f.id_tratamiento = t.id
INNER JOIN metodo_pago AS m ON f.id_metodo_pago = m.id 

SELECT * FROM vfactura

-- 4ta vista --
CREATE VIEW vPaciente_Expediente
as
SELECT concat(p.nombre," ",p.apellido) AS "Paciente",
DATE_FORMAT(FROM_DAYS(TO_DAYS(NOW())-TO_DAYS(p.fecha_nacimiento)), "%y")+0 AS "Edad",
o.num_diente AS "Odontograma n°diente",
co.nombre AS "Dolecia o enfermedad"
FROM paciente AS p
INNER JOIN complicades AS co ON co.id=p.id_complicadez
INNER JOIN odontograma AS o ON o.id_paciente = p.id


-- 5ta vista -- 
CREATE VIEW vCantCitas
as
SELECT concat(a.nombre," ",a.apellido) AS "Dentista",
COUNT(*) AS "Cantidad de citas"
FROM dentista  AS a
INNER JOIN agenda AS ag ON ag.id_dentista = a.id
GROUP BY a.id

SELECT * FROM vCantCitas













