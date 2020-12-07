const tests = [
    require("./connections"),
    require("./app"),
];

tests.forEach(test => {
    test.run()
});
