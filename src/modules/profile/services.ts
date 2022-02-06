import { prisma } from '~/services'

import type { GetProfileInput } from './types'

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
