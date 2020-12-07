const connection = require('../connection');
const Sequilize = require('sequelize');
const Model = Sequilize.Model;

class QuestionType extends Model {}
QuestionType.init(
    {
        name: {
            type: Sequilize.STRING,
            allowNull: false
        },
    },

    {
        sequelize: connection,
        modelName: 'questionType',
        timestamps: false
    }
);

module.exports = {
    QuestionType: QuestionType
};