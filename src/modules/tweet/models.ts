import type { FastifySchema } from 'fastify'
import type { ObjectSchema } from 'fast-json-stringify'

export const createTweetSchema: FastifySchema = {
    body: {
        type: 'object',
        required: ['content'],
        properties: {
            authorId: { type: 'number' },
            content: { type: 'string' },
            retweetId: { type: 'number' }
        }
    } as ObjectSchema
}
