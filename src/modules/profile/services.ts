import { prisma } from '@services'

import type { GetProfileInput, FollowProfileInput } from './types'

export const getProfile = async (where: GetProfileInput) =>
    await prisma.profile.findUnique({
        where,
        select: {
            id: true,
            name: true,
            bio: true,
            cover: true,
            email: true,
            image: true,
            joinAt: true,
            user: {
                select: {
                    _count: {
                        select: {
                            tweet: true,
                            followedBy: true,
                            following: true
                        }
                    },
                    tweet: {
                        take: 25,
                        select: {
                            id: true,
                            content: true,
                            createdAt: true,
                            images: true,
                            retweetFrom: {
                                include: {
                                    author: {
                                        select: {
                                            profile: {
                                                select: {
                                                    name: true,
                                                    image: true
                                                }
                                            }
                                        }
                                    }
                                }
                            },
                            favoriteBy: {
                                select: {
                                    _count: true
                                }
                            },
                            retweet: {
                                select: {
                                    _count: true
                                }
                            }
                        }
                    }
                }
            }
        }
    })

export const followProfile = async ({ id, userId }: FollowProfileInput) => {
    if (id === userId) return new Error("You can't follow yourself")

    const user = await prisma.profile.findUnique({
        where: {
            id
        },
        select: {
            id: true
        }
    })

    if (!user || !user.id) return new Error('User not found')

    return await prisma.user.update({
        where: {
            id: userId
        },
        data: {
            following: {
                connect: {
                    id: id
                }
            }
        }
    })
}

export const unfollowProfile = async ({ id, userId }: FollowProfileInput) => {
    if (id === userId) return new Error("You can't follow yourself")

    return await prisma.user.update({
        where: {
            id: userId
        },
        data: {
            following: {
                disconnect: {
                    id
                }
            }
        }
    })
}
