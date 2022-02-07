import S from 'fluent-json-schema'

export const followProfileSchema = S.object().prop(
    'alias',
    S.number().required()
)

export const editProfileSchema = S.object()
    .prop('alias', S.string().minLength(3).maxLength(15))
    .prop('name', S.string().maxLength(50))
    .prop('bio', S.string().maxLength(180))
