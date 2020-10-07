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


