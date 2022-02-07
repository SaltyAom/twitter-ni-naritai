import type { FastifySchema } from 'fastify'

import S from 'fluent-json-schema'

export const followProfileSchema: FastifySchema = {
    body: S.object().prop('id', S.number().required())
}
