const models = require("./models");

const userMapper = (user) => {
    console.log(`${user.id} | ${user.name}`);
};

const roleMapper = (role) => {
    console.log(`${role.id} | ${role.name}`);
};


module.exports = {
    run: (async () => {
        console.log('--------\nUsers list\n--------');
        const usersList = await models.User.findAll();
        usersList.map(userMapper);

        console.log('--------\nProjects List\n--------');
        const rolesList = (await models.Role);
        rolesList.map(roleMapper);
    })
};