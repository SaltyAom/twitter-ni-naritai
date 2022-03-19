import type { RouteShorthandMethod } from 'fastify'
import type { User, Profile } from '@prisma/client'

export type AuthInput = Pick<User, 'username'>

export interface AuthHandler extends RouteShorthandMethod {
    Body: AuthInput
}

export type ProfileInput = Pick<Profile, 'alias'>

export interface ProfileHandler extends RouteShorthandMethod {
    Body: ProfileInput
}

export type EmailInput = Pick<Profile, 'email'>

export interface EmailHandler extends RouteShorthandMethod {
    Body: EmailInput
}
