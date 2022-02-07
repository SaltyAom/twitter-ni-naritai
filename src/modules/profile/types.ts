import { Profile } from '@prisma/client'
import type { RouteShorthandMethod } from 'fastify'

export type GetProfileInput = Pick<Profile, 'name'>

export interface GetProfileHandler extends RouteShorthandMethod {
    Params: GetProfileInput
}

export interface FollowProfileInput extends Pick<Profile, 'id'> {
    userId: number
}

export interface FollowProfileHandler extends RouteShorthandMethod {
    Body: Omit<FollowProfileInput, 'userId'>
}
