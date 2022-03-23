import S from 'fluent-json-schema'

export const getFeedModel = S.object().prop(
    'last',
    S.number().required()
)
