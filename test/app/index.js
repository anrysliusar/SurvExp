const models = require("../../src/js/models");
const Table = require("cli-table3");
const _ = require("lodash-node");
const chalk = require("chalk");

const toTable = (data, ...fields) => {
    let res = new Table({head: fields.map(f => _.last(f.split(".")))});
    data.forEach(item => {
        let d = [];
        fields.forEach(field => {
            d.push(_.get(item, field) || " ");
        });
        res.push(d);
    });
    return res.toString();
};


module.exports = {
    run: (async () => {
            const usersList = await models.User.findAll();
            console.log(chalk.green(`Users list`));
            console.log(toTable(usersList, "id", "name", "role_id"));

            const rolesList = await models.Role.findAll();
            console.log(chalk.green(`Roles List`));
            console.log(toTable(rolesList, "id", "name"));

            const expertsList = await models.Expert.findAll();
            console.log(chalk.green(`Experts list`));
            console.log(toTable(expertsList, "id", "occupation", "user_id"));

            const answersList = await models.Answer.findAll();
            console.log(chalk.green(`Answers list`));
            console.log(toTable(answersList, "id", "date", "text", "expert_id", "question_id"));

            const questionsList = await models.Question.findAll();
            console.log(chalk.green(`Question list`));
            console.log(toTable(questionsList, "id", "text", "survey_id", "questionType_id"));

            const questionTypesList = await models.QuestionType.findAll();
            console.log(chalk.green(`Question types list`));
            console.log(toTable(questionTypesList, "id", "name"));

            const possibleAnswersList = await models.PossibleAnswer.findAll();
            console.log(chalk.green(`Possible answers list`));
            console.log(toTable(possibleAnswersList, "id", "text", "question_id"));

            const surveysList = await models.Survey.findAll();
            console.log(chalk.green(`Surveys list`));
            console.log(toTable(surveysList, "id", "name", "topic", "deadline"));


        }
    )
};