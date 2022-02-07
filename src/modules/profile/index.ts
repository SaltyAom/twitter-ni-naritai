import type { FastifyPluginCallback } from 'fastify'

import { followProfile, getProfile, unfollowProfile } from './services'
import { followProfileSchema } from './models'

import type { FollowProfileHandler, GetProfileHandler } from './types'

const auth: FastifyPluginCallback = (app, _, done) => {
    app.get<GetProfileHandler>(
        '/:name',
        async ({ params }) => await getProfile(params)
    )

    app.post<FollowProfileHandler>(
        '/follow',
        { schema: followProfileSchema },
        async ({ body: { id }, userId }, res) => {
            const followed = await followProfile({ id, userId: userId! })
            if (followed instanceof Error)
                return res.status(401).send({
                    error: followed.message
                })

            const { password, ...profile } = followed
            return profile
        }
    )

    app.post<FollowProfileHandler>(
        '/unfollow',
        { schema: followProfileSchema },
        async ({ body: { id }, userId }, res) => {
            const followed = await unfollowProfile({ id, userId: userId! })
            if (followed instanceof Error)
                return res.status(401).send({
                    error: followed.message
                })

            const { password, ...profile } = followed
            return profile
        }
    )

    done()
}

export default auth
