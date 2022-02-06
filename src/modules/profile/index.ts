import type { FastifyPluginCallback } from 'fastify'

import { getProfile } from './services'

import type { GetProfileHandler } from './types'

const auth: FastifyPluginCallback = (app, _, done) => {
    app.get<GetProfileHandler>(
        '/:name',
        async ({ params }) => await getProfile(params)
    )

    done()
}

export default auth
