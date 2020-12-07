const connection = require('../connection');
const Sequilize = require('sequelize');
const User = require('./user').User;
const Model = Sequilize.Model;

class Expert extends Model {}
Expert.init(
    {
        occupation: {
            type: Sequilize.STRING,
            allowNull: false
        },
        user_id:{
            type: Sequilize.INTEGER,
            allowNull: false,
            references: {
                model: User,
                key: 'id'
            }
        }
    },

    {
        sequelize: connection,
        modelName: 'expert',
        timestamps: false
    }
);

module.exports = {
    Expert: Expert
};