import type { FastifyPluginCallback } from 'fastify'

import { authGuardHook, validateSchema } from '@services'
import { getFeedModel } from './models'
import type { GetFeedHandler } from './types'
import { getFeed } from './services'

const feed: FastifyPluginCallback = (app, _, done) => {
    app.post<GetFeedHandler>(
        '/',
        {
            preHandler: [authGuardHook, validateSchema(getFeedModel)]
        },
        async ({ body, userId }) => await getFeed(userId!, body)
    )

    done()
}

export default feed
