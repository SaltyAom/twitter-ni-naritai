import S from 'fluent-json-schema'

export const authSchema = S.object().prop(
    'username',
    S.string().required().minLength(5).maxLength(25)
)

export const profileSchema = S.object().prop(
    'alias',
    S.string().minLength(3).maxLength(36)
)

export const emailSchema = S.object().prop(
    'email',
    S.string().required().format('email').maxLength(128)
)
