import type { RouteShorthandMethod } from 'fastify'
import type { User, Profile } from '@prisma/client'

export interface SignUpInput extends Pick<User, 'username' | 'password'> {
    profile: Omit<Profile, 'id' | 'joinAt'>
}

export interface SignUpHandler extends RouteShorthandMethod {
    Body: SignUpInput
}

export interface ChangePasswordInput extends Pick<User, 'password'> {
    userId: number
    newPassword: string
}

export interface ChangePasswordHandler extends RouteShorthandMethod {
    Body: Omit<ChangePasswordInput, 'userId'>
}
