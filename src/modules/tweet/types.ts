import type { RouteShorthandMethod } from 'fastify'
import type { Tweet } from '@prisma/client'

export type CreateTweetInput = Omit<Tweet, 'id' | 'createdAt'>

export interface CreateTweetHandler extends RouteShorthandMethod {
    Body: Omit<CreateTweetInput, 'authorId'>
}

export type GetTweetInput = string

export interface GetTweetHandler extends RouteShorthandMethod {
    Params: {
        id: GetTweetInput
    }
}
