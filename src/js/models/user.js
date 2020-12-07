const connection = require('../connection');
const Sequilize = require('sequelize');
const Role = require('./role').Role;
const Model = Sequilize.Model;
class User extends Model {}
User.init(
    {
        name: {
            type: Sequilize.STRING,
            allowNull: false
        },
        role_id:{
            type: Sequilize.INTEGER,
            allowNull: false,
            references: {
                model: Role,
                key: 'id'
            }
        }
    },

    {
        sequelize: connection,
        modelName: 'user'
    }
);
User.belongsTo(Role)

module.exports = {
    User
};