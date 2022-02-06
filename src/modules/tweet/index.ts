import type { FastifyPluginCallback } from 'fastify'

import { authGuardHook } from '@services'
import { newTweet, getTweet, favoriteTweet } from './services'

import { createTweetSchema, favoriteTweetSchema } from './models'

import type {
    CreateTweetHandler,
    FavoriteTweetHandler,
    GetTweetHandler
} from './types'

const tweet: FastifyPluginCallback = (app, _, done) => {
    app.put<CreateTweetHandler>(
        '/new',
        {
            preHandler: authGuardHook
        },
        async ({ body, userId }, res) => {
            if (!body.content && !body.retweetId)
                return res
                    .status(401)
                    .send({ error: 'Either content or retweetId is required' })

            const tweet = await newTweet({ ...body, authorId: userId! })
            if (tweet instanceof Error)
                return res.status(401).send(tweet.message)

            return tweet
        }
    )

    app.get<GetTweetHandler>(
        '/id/:id',
        async ({ params: { id } }) => await getTweet(id)
    )

    app.post<FavoriteTweetHandler>(
        '/favorite',
        { preHandler: authGuardHook, schema: favoriteTweetSchema },
        async ({ body: { id }, userId }) =>
            await favoriteTweet({
                id,
                userId: userId!
            })
    )

    done()
}

export default tweet
