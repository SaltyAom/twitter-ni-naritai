import type { FastifySchema } from 'fastify'

import S from 'fluent-json-schema'

export const signUpSchema: FastifySchema = {
    body: S.object()
        .prop('username', S.string().required().minLength(3).maxLength(25))
        .prop('password', S.string().required().minLength(8).maxLength(64))
        .prop(
            'profile',
            S.object()
                .required()
                .prop('email', S.string().required().format('email'))
                .prop('name', S.string().required().minLength(3).maxLength(128))
                .prop('bio', S.string().maxLength(256))
        )
}

export const signInSchema: FastifySchema = {
    body: S.object()
        .prop('username', S.string().required().minLength(3).maxLength(25))
        .prop('password', S.string().required().minLength(8).maxLength(64))
}
