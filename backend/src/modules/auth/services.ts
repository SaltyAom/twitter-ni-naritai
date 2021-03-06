import { prisma, hash, verify } from '@services'

import type { ChangePasswordInput, SignUpInput } from './types'

export const signUp = async (data: SignUpInput) => {
    try {
        return await prisma.user.create({
            data: {
                username: data.username,
                password: await hash(data.password, data.username),
                profile: {
                    create: {
                        ...data.profile,
                        alias: data.profile.name
                    }
                }
            }
        })
    } catch (err) {
        return new Error('Something went wrong')
    }
}

export const signIn = async ({ username, password }: SignUpInput) => {
    const user = await prisma.user.findUnique({
        select: {
            id: true,
            username: true,
            password: true,
            profile: {
                select: {
                    alias: true,
                    name: true,
                    image: true
                }
            }
        },
        where: {
            username
        }
    })

    if (!user || !user.profile) return new Error('User not found')

    const {
        id,
        password: userPassword,
        profile: { alias, name, image }
    } = user
    if (!(await verify(userPassword, password, username)))
        return new Error('Invalid password')

    return {
        id,
        username,
        alias,
        name,
        image: image ?? ''
    }
}

export const changePassword = async ({
    userId,
    password,
    newPassword
}: ChangePasswordInput) => {
    const user = await prisma.user.findUnique({
        select: {
            username: true,
            password: true
        },
        where: {
            id: userId
        }
    })
    if (!user) return new Error('User not found')

    const { username, password: currentPassword } = user

    if (!(await verify(currentPassword, password, username)))
        return new Error('Invalid password')

    await prisma.user.update({
        where: {
            id: userId
        },
        data: {
            password: await hash(newPassword, username)
        }
    })

    return { username }
}
