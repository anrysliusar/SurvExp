const tests = [
    require("./connections"),
    // require("./build"),
    require("./app"),
];

tests.forEach(test => {
    test.run()
});
