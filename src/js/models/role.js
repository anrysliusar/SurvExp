const connection = require('../connection');
const Sequilize = require('sequelize');

const Model = Sequilize.Model;
class Role extends Model {}
Role.init(
    {
        name: {
            type: Sequilize.STRING,
            allowNull: false
        },
    },
    {
        sequelize: connection,
        modelName: 'role'
    }
);

module.exports = {
    Role: Role
};