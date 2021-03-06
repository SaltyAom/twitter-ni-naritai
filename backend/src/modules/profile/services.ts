import { batch, prisma } from '@services'

import type {
    GetProfileInput,
    FollowProfileInput,
    GetFollowInput,
    EditProfileInput
} from './types'

export const getProfile = async (where: GetProfileInput) =>
    await prisma.profile.findUnique({
        where,
        select: {
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
                                                    alias: true,
                                                    name: true,
                                                    image: true
                                                }
                                            }
                                        }
                                    }
                                }
                            },
                            _count: {
                                select: {
                                    favoriteBy: true,
                                    retweet: true
                                }
                            }
                        }
                    }
                }
            }
        }
    })

export const getFollowers = async ({ alias, batch: index }: GetFollowInput) => {
    const { from } = batch(+index)

    return await prisma.profile.findUnique({
        where: {
            alias
        },
        select: {
            id: true,
            user: {
                select: {
                    followedBy: {
                        skip: from,
                        take: 25,
                        select: {
                            profile: {
                                select: {
                                    id: true,
                                    name: true,
                                    cover: true,
                                    bio: true
                                }
                            }
                        }
                    }
                }
            }
        }
    })
}

export const getFollowings = async ({
    alias,
    batch: index
}: GetFollowInput) => {
    const { from } = batch(+index)

    return await prisma.profile.findUnique({
        where: {
            alias
        },
        select: {
            id: true,
            user: {
                select: {
                    following: {
                        skip: from,
                        take: 25,
                        select: {
                            profile: {
                                select: {
                                    id: true,
                                    name: true,
                                    cover: true,
                                    bio: true
                                }
                            }
                        }
                    }
                }
            }
        }
    })
}

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

export const editProfile = async ({ userId, ...data }: EditProfileInput) => {
    try {
        return await prisma.profile.update({
            where: {
                id: userId
            },
            data
        })
    } catch (err) {
        return new Error('Unable to edit profile')
    }
}
