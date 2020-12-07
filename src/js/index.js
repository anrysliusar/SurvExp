const models = require("./models");

const userMapper = (user) => {
    console.log(`${user.id} | ${user.name}`);
};

const roleMapper = (role) => {
    console.log(`${role.id} | ${role.name}`);
};


(async () => {
    console.log('--------\nUsers list\n--------');
    const usersList = await models.User.findAll();
    usersList.map(userMapper);

    console.log('--------\nProjects List\n--------');
    const rolesList = (await models.Role);
    rolesList.map(roleMapper);


    // const projects = await models.Project.findAll({
    //         include: [{
    //             model: models.User,
    //             through: {
    //                 attributes: ['role']
    //             }
    //         }]
    // });
    // projects.map(project => {
    //     console.log('#' + project.id + ' | ' + project.name);
    //     project.users.map(user => {
    //         console.log(user.id + ' | ' + user.name + ' | ' + user.project_user.dataValues.role);
    //     });
    // })
})();