import type { RouteShorthandMethod } from 'fastify'
import type { User, Profile } from '@prisma/client'

export interface SignUpInput extends Pick<User, 'username' | 'password'> {
    profile: Omit<Profile, 'id' | 'joinAt'>
}

export interface SignUpHandler extends RouteShorthandMethod {
    Body: SignUpInput
}