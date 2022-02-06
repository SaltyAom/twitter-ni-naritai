import env from 'dotenv'
env.config()

import fastify from 'fastify'

import helmet from 'fastify-helmet'
import staticPlugin from 'fastify-static'
import cookie from 'fastify-cookie'

import { resolve } from 'path'

import { auth, base, profile, tweet } from '@modules'
import { run, mutateAuthHook } from '@services'

const app = fastify()

const main = () => {
    app.register(helmet)
        .register(cookie)
        .register(staticPlugin, {
            root: resolve('./public')
        })
        .decorateRequest('userId', null)
        .decorateRequest('auth', false)
        .addHook('onRequest', mutateAuthHook)
        .register(base)
        .register(auth, {
            prefix: '/auth'
        })
        .register(profile, {
            prefix: '/profile'
        })
        .register(tweet, {
            prefix: '/tweet'
        })
        .listen(8080, '0.0.0.0', (error, address) => {
            if (error) return console.error(error)

            console.log(`Running at ${address}`)
        })
}

run(main)
