import type { FastifySchema } from 'fastify'
import type { ObjectSchema } from 'fast-json-stringify'

export const signUpSchema: FastifySchema = {
    body: {
        type: 'object',
        required: ['username', 'password', 'profile.email', 'profile.name'],
        properties: {
            username: { type: 'string' },
            password: { type: 'string' },
            profile: {
                type: 'object',
                email: { type: 'string' },
                name: { type: 'string' },
                bio: { type: 'string' }
            }
        }
    } as ObjectSchema
}

export const signInSchema: FastifySchema = {
    body: {
        type: 'object',
        required: ['username', 'password'],
        properties: {
            username: { type: 'string' },
            password: { type: 'string' }
        }
    } as ObjectSchema
}
