import S from 'fluent-json-schema'

export const signUpSchema = S.object()
    .prop('username', S.string().required().minLength(3).maxLength(25))
    .prop('password', S.string().required().minLength(8).maxLength(96))
    .prop(
        'profile',
        S.object()
            .required()
            .prop('alias', S.string().minLength(3).maxLength(15))
            .prop('email', S.string().required().format('email').maxLength(128))
            .prop('name', S.string().required().minLength(3).maxLength(50))
            .prop('bio', S.string().maxLength(180))
    )

export const signInSchema = S.object()
    .prop('username', S.string().required().minLength(3).maxLength(25))
    .prop('password', S.string().required().minLength(8).maxLength(96))

export const changePasswordSchema = S.object()
    .prop('password', S.string().required().minLength(8).maxLength(96))
    .prop('newPassword', S.string().required().minLength(8).maxLength(96))
