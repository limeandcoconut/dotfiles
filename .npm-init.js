const cp = require('child_process')
let isPrivate

const USER = process.env.GITHUB_USERNAME || 'limeandcoconut'
let name = basename || package.name
let repo

module.exports = {
    
    name: prompt('name', name, (response) => {
        name = response
        repo = `github.com/${USER}/${name}`
        return response
    }),

    version: '0.0.1',

    author: 'Jacob Smith <js@jacobsmith.tech> (https://github.com/limeandcoconut)',

    private: prompt('private', 'false', (response) => {
        isPrivate = (typeof response === 'boolean') ? response : Boolean(response.match('true'))
        return isPrivate
    }),

    create: prompt('create github repo', 'yes', (response) => {
        response = response.match(/^\s*y/i)

        if (response) {
            let data = JSON.stringify({
                name, 
                private: isPrivate
            })
            console.log('\nenter github password:')

            cp.execSync(`curl -u '${USER}' https://api.github.com/user/repos -d '${data}' `)
            cp.execSync(`git init`)
            cp.execSync(`git remote add origin https://${repo}.git`)
        }
    }),

    main: prompt('entry point', 'index.js'),

    repository: {
        type: 'git',
        url: `git://${repo}.git`
    },

    bugs: {url: `https://${repo}/issues`},

    homepage: `https://${repo}`,

    keywords: prompt((string) => string.split(/\s+/)),

    license: 'isc',

    cleanup: (cb) => {
        cb(null, undefined)
    }
}