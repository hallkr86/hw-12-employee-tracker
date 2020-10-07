
DROP DATABASE IF EXISTS employer_managerdb;
CREATE database employer_managerdb;

USE employer_managerdb;


CREATE TABLE department(
  id INT NOT NULL AUTO_INCREMENT,
  department_name VARCHAR(30) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE role(
  id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(30) NOT NULL,
  salary DECIMAL(10,2) NOT NULL,
  department_id INT NOT null,
  FOREIGN KEY (department_id) references department (id),
  PRIMARY KEY (id)
);

CREATE TABLE employee(
  id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  role_id INT,
  FOREIGN KEY (role_id) references role (id),
  manager_id INT,
  FOREIGN KEY (manager_id) references employee (id),
  PRIMARY KEY (id)
);

USE employer_managerdb;

/* Insert 3 Rows into your new table */
/*dept table*/
INSERT INTO department (department_name)
VALUES ("Engineering"), ("Finance"), ("Legal"), ("Sales");


/*role table*/
INSERT INTO role (title, salary, department_id)
VALUES ("Sales Lead", 100000, 5);

INSERT INTO role (title, salary, department_id)
VALUES ("Salesperson", 80000, 5);

INSERT INTO role (title, salary, department_id)
VALUES ("Lead Engineer", 150000, 2);

INSERT INTO role (title, salary, department_id)
VALUES ("Software Engineer", 120000, 2);

INSERT INTO role (title, salary, department_id)
VALUES ("Accountant", 125000, 4);

INSERT INTO role (title, salary, department_id)
VALUES ("Legal Team Lead", 250000, 3);

INSERT INTO role (title, salary, department_id)
VALUES ("Lawyer", 190000, 3);

INSERT INTO role (title, salary, department_id)
VALUES ("Lead Engineer", 150000, 2);


/*employee table*/
INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES ("John", "Doe", 222, NULL);

INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES ("Mike", "Chan", 125, 222);

INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES ("Ashley", "Rodriguez", 238, NULL);

INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES ("Kevin", "Tupik", 130, 238);

INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES ("Malia", "Brown", 150, NULL);

INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES ("Sarah", "Lourd", 235, NULL);

INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES ("Tom", "Allen", 180, 235);

INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES ("Christian", "Eckenrode", 238, NULL);

SELECT * FROM department;
SELECT * FROM employee;
SELECT * FROM role;

SELECT employee.id, employee.first_name, employee.last_name, role.title, department.department_name, role.salary, manager.first_name, manager.last_name
FROM employee
INNER JOIN role ON employee.role_id = role.id
INNER JOIN department ON role.department_id=department.id
LEFT JOIN employee AS manager ON employee.manager_id=manager.id;
