const connection = require('../connection');
const Sequilize = require('sequelize');
const Survey = require('./survey').Survey;
const QuestionType = require('./questionType').QuestionType;
const Model = Sequilize.Model;

class Question extends Model {}
Question.init(
    {
        text: {
            type: Sequilize.STRING,
            allowNull: false
        },
        survey_id:{
            type: Sequilize.INTEGER,
            allowNull: false,
            references: {
                model: Survey,
                key: 'id'
            }
        },
        questionType_id:{
            type: Sequilize.INTEGER,
            allowNull: false,
            references: {
                model: QuestionType,
                key: 'id'
            }
        }
    },

    {
        sequelize: connection,
        modelName: 'question',
        timestamps: false
    }
);

module.exports = {
    Question: Question
};