const mysql = require('mysql');
const inquirer = require('inquirer');
const { ENGINE_METHOD_RAND } = require('constants');
const employeeArray = [];

// create the connection information for the sql database
const connection = mysql.createConnection({
  host: 'localhost',

  // Your port; if not 3306
  port: 3306,

  // Your username
  user: 'root',

  // Your password
  password: 'Aiden624!',
  database: 'employer_managerdb'
});

// connect to the mysql server and sql database
connection.connect(function (err) {
  console.log("Connected as id: "+connection.threadId)
  start();
  // run the start function after the connection is made to prompt the user
  
})

//function to ask user which option would they like to choose.
const start = function() {
    inquirer
      .prompt({
        name: 'options',
        type: 'list',
        message: 'What would you like to do?',
        choices: ['View All Employees', 'View All Employees by Department', 'View All Employees by Role', 'Add Employee', 'Add Departments', 'Add Roles', 'Update Employee Role']
      }).then(function (answer) {
        if (answer.options === 'View All Employees') {
          viewEmployees();
        } else if (answer.options === 'View All Employees by Department') {
            viewEmployeesbyDept();
        } else if (answer.options === 'View All Employees by Role') {
            viewEmployeesbyRole();
        } else if (answer.options === 'Add Employee') {
            addEmployee();
        } else if (answer.options === 'Add Department') {
            addDept();
        } else if (answer.options === 'Add Roles') {
            addRoles();
        } else if (answer.options === 'Update Employee Role') {
            updateRole();
        } else {
          connection.end();
        }
      });
  }

  function viewEmployees(){
    connection.query("SELECT * FROM employee", function(err,res){
      if (err) throw err;
      for (var i = 0; i < res.length; i++) {
        console.log(res[i].id + " | " + res[i].first_name + " | " + res[i].last_name + " | " + res[i].role_id + " | " + res[i].manager_id);
      }
      console.log("----------------------------------------------");
    });
  }

  // function viewEmployeesbyDept(){
  //   connection.query("SELECT * FROM employee", function(err,res){
  //     if (err) throw err;
  //     for (var i = 0; i < res.length; i++) {
  //       console.log(res[i].id + " | " + res[i].first_name + " | " + res[i].last_name + " | " + res[i].role_id + " | " + res[i].manager_id);
  //     }
  //     console.log("----------------------------------------------");
  //   });
  // }

  // function viewEmployeesbyDept(){
  //   connection.query("SELECT * FROM employee", function(err,res){
  //     if (err) throw err;
  //     for (var i = 0; i < res.length; i++) {
  //       console.log(res[i].id + " | " + res[i].first_name + " | " + res[i].last_name + " | " + res[i].role_id + " | " + res[i].manager_id);
  //     }
  //     console.log("----------------------------------------------");
  //   });
  // }

  function addEmployee(){
    connection.query("SELECT title, role_id FROM role;" , function(err,res){
      if (err) throw err;
      for(var i = 0; i < results.length; i++) {
        const roleId = {
          name: results[i].title,
          value: results[i].role_id,
        };employeeArray.push(roleId);
      }
    })
    
    inquirer.prompt([
    {
      name: "firstName",
      type: "input",
      message: "Please enter the employee's first name"
    },
    {
      name: "lastName",
      type: "input",
      message: "Please enter the employee's last name"
    },
    {
      name: "role",
      type: "list",
      message: "Please enter the employee's role",
      choices: ["Accountant", "Lawyer", "Lead Engineer", "Legal Team Lead", "Sales Lead", "Salesperson", "Software Engineer"]
    },
    {
      name: "deptManager",
      type: "list",
      message: "Please enter the employee's manager",
      choices: ["John Doe", "Ashley Rodriguez", "Malia Brown", "Sarah Lourd", "Christian Eckenrode"]
    }
  ]).then(function(answer){
    connection.query("INSERT INTO employee (first_name, last_name, role_id)
        VALUES ('', '', '' );" 
        function(err, res){
        if (err) throw err;
      console.log("Your Employee was created successfully!");
      start();
      }
    }
  })
  
  };

  function addDept(){
    console.log("Add Department");
    inquirer.prompt([
      {
        name: "addDept",
        type: "input",
        message: "Please enter the department you would like to add"
      }
  ]).then(function(answer){
    connection.query("INSERT INTO department SET ?", {
      addDepartment:answer.addDepartment
    }),function(err,res){
      console.log("Your Department was created successfully!");
      start();
    }
  })
}

function addRoles(){
  console.log("Add Roles");
  inquirer.prompt([
    {
      name: "addRole",
      type: "input",
      message: "Please enter the role you would like to add"
    }
]).then(function(answer){
  connection.query("INSERT INTO role SET ?", {
    addRole:answer.addRole
  }),function(err,res){
    console.log("Your Role was created successfully!");
    start();
  }
})
}

function updateRole(){
  connection.query("SELECT * FROM employee", function(err,res){
  console.log(res);
  inquirer.prompt([
    {
      name: "nameupdate ",
      type: "list",
      choices: function(value){
        const choiceArray = [];
        for(const i = 0; i < res.length; i++){
          choiceArray.push(res[i].first_name, last_name);
        }
      },
      message: "Please select the employee you would like to update"

    }
]).then(function(answer){
})
})
  }  

  // function stopPrompt(){
  //   inquirer.prompt([
  //     {
  //       type: "confirm",
  //       name: "continue",
  //       message: "Would you like to continue?"
  //     }
  //   ]).then(function(res){
  //     if(res.continue){
  //       start();
  //     }else 
  //   })
  // }