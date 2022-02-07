import type { FastifyPluginCallback } from 'fastify'

import { refreshToken } from '@services'
import { signUp, signIn } from './services'

import { signUpSchema, signInSchema } from './models'

import type { SignUpHandler } from './types'

const auth: FastifyPluginCallback = (app, _, done) => {
    app.put<SignUpHandler>(
        '/signup',
        {
            schema: signUpSchema
        },
        async ({ body }, res) => {
            const user = await signUp(body)
            if (user instanceof Error)
                return res.status(401).send({ error: user.message })

            const { username } = user

            return {
                username
            }
        }
    )

    app.post<SignUpHandler>(
        '/signin',
        {
            schema: signInSchema
        },
        async ({ body, cookies: { accessToken } }, res) => {
            const user = await signIn(body)

            if (user instanceof Error)
                return res.status(403).send({ error: user.message })

            const { id, username } = user
            const token = await refreshToken({
                id,
                previous: accessToken
            })

            res.setCookie('accessToken', `${token},${id}`, {
                httpOnly: true,
                sameSite: true,
                path: '/'
            })

            return {
                username
            }
        }
    )

    done()
}

export default auth
