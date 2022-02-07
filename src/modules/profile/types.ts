import { Profile } from '@prisma/client'
import type { RouteShorthandMethod } from 'fastify'

export type GetProfileInput = Pick<Profile, 'alias'>

export interface GetProfileHandler extends RouteShorthandMethod {
    Params: GetProfileInput
}

export interface GetFollowInput extends Pick<Profile, 'alias'> {
    batch: string | number
}

export interface GetFollowHandler extends RouteShorthandMethod {
    Params: GetFollowInput
}

export interface FollowProfileInput extends Pick<Profile, 'id'> {
    userId: number
}

export interface FollowProfileHandler extends RouteShorthandMethod {
    Body: Omit<FollowProfileInput, 'userId'>
}

export interface EditProfileInput extends Omit<Profile, 'id' | 'joinAt' | 'email'> {
    userId: number
}

export interface EditProfileHandler extends RouteShorthandMethod {
    Body: Omit<EditProfileInput, 'user' | 'userId'>
}
