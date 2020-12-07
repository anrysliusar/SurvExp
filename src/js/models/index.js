const User = require('./user').User;
const Role = require('./role').Role;
const Expert = require('./expert').Expert;
const Answer = require('./answer').Answer;
const Question = require('./question').Question;
const QuestionType = require('./questionType').QuestionType;
const PossibleAnswer = require('./possibleAnswer').PossibleAnswer;
const Survey = require('./survey').Survey;

module.exports = {
    User,
    Role,
    Expert,
    Answer,
    Question,
    QuestionType,
    PossibleAnswer,
    Survey
};