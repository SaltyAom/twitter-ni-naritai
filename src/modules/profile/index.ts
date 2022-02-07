import type { FastifyPluginCallback } from 'fastify'

import {
    editProfile,
    followProfile,
    getFollowers,
    getFollowings,
    getProfile,
    unfollowProfile
} from './services'
import { editProfileSchema, followProfileSchema } from './models'

import type {
    EditProfileHandler,
    FollowProfileHandler,
    GetFollowHandler,
    GetProfileHandler
} from './types'
import { authGuardHook } from '@services'

const auth: FastifyPluginCallback = (app, _, done) => {
    app.get<GetProfileHandler>(
        '/:alias',
        async ({ params }) => await getProfile(params)
    )

    app.get<GetFollowHandler>(
        '/:alias/following/:batch',
        async ({ params }) => await getFollowings(params)
    )

    app.get<GetFollowHandler>(
        '/:alias/follower/:batch',
        async ({ params }) => await getFollowers(params)
    )

    app.post<FollowProfileHandler>(
        '/follow',
        { schema: followProfileSchema, preHandler: authGuardHook },
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
        { schema: followProfileSchema, preHandler: authGuardHook },
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

    app.patch<EditProfileHandler>(
        '/edit',
        { schema: editProfileSchema, preHandler: authGuardHook },
        async ({ body, userId }, res) => {
            const profile = await editProfile({ ...body, userId: userId! })
            if (profile instanceof Error)
                return res.status(401).send({
                    error: profile.message
                })

            return profile
        }
    )

    done()
}

export default auth
