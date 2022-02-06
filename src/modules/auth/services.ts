import { prisma, hash, verify } from '@services'

import type { SignUpInput } from './types'

export const signUp = async (data: SignUpInput) => {
    if (
        await prisma.user.count({
            where: {
                OR: [
                    {
                        username: data.username
                    },
                    {
                        profile: {
                            email: data.profile.email
                        }
                    },

                    {
                        profile: {
                            name: data.profile.name
                        }
                    }
                ]
            }
        })
    )
        return new Error('User already exists')

    return await prisma.user.create({
        data: {
            username: data.username,
            password: await hash(data.password, data.username),
            profile: {
                create: {
                    ...data.profile,
                    joinAt: undefined
                }
            }
        }
    })
}

export const signIn = async ({ username, password }: SignUpInput) => {
    const user = await prisma.user.findUnique({
        select: {
            id: true,
            username: true,
            password: true
        },
        where: {
            username
        }
    })

    if (!user) return new Error('User not found')

    const { password: userPassword, ...userData } = user
    if (!verify(userPassword, password, username))
        return new Error('Invalid password')

    return userData
}
