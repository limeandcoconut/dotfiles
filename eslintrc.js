'use strict'

module.exports = {
    extends: 'brian',
    parser: 'vue-eslint-parser',
    plugins: [
        'html',
        'vue',
    ],
    rules: {
        indent: [2, 4, {MemberExpression: 0}],
    },
}
