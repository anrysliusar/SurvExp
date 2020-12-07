const connection = require('../connection');
const Sequilize = require('sequelize');
const Expert = require('./expert').Expert;
const Question = require('./question').Question;
const Model = Sequilize.Model;

class Answer extends Model {}
Answer.init(
    {
        date: {
            type: Sequilize.DATE,
            allowNull: false
        },
        text: {
            type: Sequilize.TEXT,
            allowNull: false
        },
        expert_id:{
            type: Sequilize.INTEGER,
            allowNull: false,
            references: {
                model: Expert,
                key: 'id'
            }
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
        modelName: 'answer',
        timestamps: false
    }
);

module.exports = {
    Answer: Answer
};