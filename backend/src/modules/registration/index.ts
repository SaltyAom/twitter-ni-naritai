import type { FastifyPluginCallback } from 'fastify'

import { validateSchema } from '@services'
import { findEmail, findProfile, findUser } from './services'

import { authSchema, profileSchema, emailSchema } from './models'

import type { AuthHandler, ProfileHandler, EmailHandler } from './types'

const registration: FastifyPluginCallback = (app, _, done) => {
    app.post<AuthHandler>(
        '/user',
        {
            preHandler: validateSchema(authSchema)
        },
        async ({ body }) => ({
            taken: await findUser(body)
        })
    )

    app.post<ProfileHandler>(
        '/profile',
        {
            preHandler: validateSchema(profileSchema)
        },
        async ({ body }) => ({
            taken: await findProfile(body)
        })
    )

    app.post<EmailHandler>(
        '/email',
        {
            preHandler: validateSchema(emailSchema)
        },
        async ({ body }) => ({
            taken: await findEmail(body)
        })
    )

    done()
}

export default registration
