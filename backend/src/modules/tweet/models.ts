import S, { ObjectSchema } from 'fluent-json-schema'

export const createTweetSchema = S.anyOf([
    S.object()
        .prop('content', S.string().required().minLength(1).maxLength(280))
        .prop('retweetId', S.number()),
    S.object()
        .prop('content', S.string().minLength(1).maxLength(280))
        .prop('retweetId', S.number().required())
]) as unknown as ObjectSchema

export const favoriteTweetSchema = S.object().prop('id', S.number().required())
