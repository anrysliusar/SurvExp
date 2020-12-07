const dbConnection = require("../../src/js/connection");
const chalk = require('chalk');

module.exports = {
    run: (async() => {
        try {
            await dbConnection.authenticate();
            console.log(chalk.green('Connection has been established successfully.'))
        } catch (error) {
            console.log(chalk.red('Database connection not established'))
        }
    })
};
