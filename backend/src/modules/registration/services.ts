import { prisma } from '@services'

import type { AuthInput, EmailInput, ProfileInput } from './types'

export const findUser = async ({ username }: AuthInput) => {
    const user = await prisma.user.findUnique({
        select: {
            username: true
        },
        where: {
            username
        }
    })

    return !!user
}

export const findEmail = async ({ email }: EmailInput) => {
    const data = await prisma.profile.findUnique({
        select: {
            email: true
        },
        where: {
            email
        }
    })

    return !!data
}


export const findProfile = async ({ alias }: ProfileInput) => {
    const profile = await prisma.profile.findUnique({
        select: {
            alias: true
        },
        where: {
            alias
        }
    })

    return !!profile
}
