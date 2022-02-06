import type { FastifyPluginCallback } from 'fastify'

import { authGuardHook } from '~/services'
import { newTweet, getTweet } from './services'

import { createTweetSchema } from './models'

import type { CreateTweetHandler, GetTweetHandler } from './types'

const tweet: FastifyPluginCallback = (app, _, done) => {
    app.put<CreateTweetHandler>(
        '/new',
        {
            preHandler: authGuardHook,
            schema: createTweetSchema
        },
        async ({ body, userId }, res) => {
            const tweet = await newTweet({ ...body, authorId: userId! })
            if (tweet instanceof Error)
                return res.status(401).send(tweet.message)

            return tweet
        }
    )

    app.get<GetTweetHandler>(
        '/:id',
        async ({ params: { id } }) => await getTweet(id)
    )

    done()
}

export default tweet
