import { prisma } from '@services'

import type { GetFeedInput } from './types'

export const getFeed = async (uid: number, { last }: GetFeedInput) => {
    try {
        const tweets = await prisma.user.findMany({
            take: 25,
            where: {
                id: uid
            },
            select: {
                following: {
                    select: {
                        tweet: {
                            where: {
                                id: {
                                    gt: last
                                }
                            },
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
                                _count: {
                                    select: {
                                        favoriteBy: true,
                                        retweet: true
                                    }
                                },
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
                        }
                    }
                }
            }
        })

        return tweets.flatMap(({ following }) =>
            following.map(({ tweet }) => tweet)
        )
    } catch (error) {
        return []
    }
}
