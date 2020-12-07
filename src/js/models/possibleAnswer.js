const connection = require('../connection');
const Sequilize = require('sequelize');
const Question = require('./question').Question;
const Model = Sequilize.Model;

class PossibleAnswer extends Model {}
PossibleAnswer.init(
    {
        text: {
            type: Sequilize.STRING,
            allowNull: false
        },
        question_id:{
            type: Sequilize.INTEGER,
            allowNull: false,
            references: {
                model: Question,
                key: 'id'
            }
        }
    },

    {
        sequelize: connection,
        modelName: 'possibleAnswer',
        timestamps: false
    }
);

module.exports = {
    PossibleAnswer: PossibleAnswer
};