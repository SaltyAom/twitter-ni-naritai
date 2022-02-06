import type { FastifySchema } from 'fastify'

import S from 'fluent-json-schema'

export const createTweetSchema: FastifySchema = {
    body: S.anyOf([
        S.object()
            .prop('content', S.string().required().minLength(1).maxLength(280))
            .prop('retweetId', S.number()),
        S.object()
            .prop('content', S.string().minLength(1).maxLength(280))
            .prop('retweetId', S.number().required())
    ])
}

export const favoriteTweetSchema: FastifySchema = {
    body: S.object().prop('id', S.number().required())
}
