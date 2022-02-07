import type { FastifySchema } from 'fastify'

import S from 'fluent-json-schema'

export const followProfileSchema: FastifySchema = {
    body: S.object().prop('alias', S.number().required())
}

export const editProfileSchema: FastifySchema = {
    body: S.object()
        .prop('alias', S.string().minLength(3).maxLength(15))
        .prop('name', S.string().maxLength(50))
        .prop('bio', S.string().maxLength(180))
}
