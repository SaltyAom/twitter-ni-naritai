import { prisma } from '@services'

import type {
    CreateTweetInput,
    FavoriteTweetInput,
    GetTweetInput
} from './types'

export const newTweet = async (data: CreateTweetInput) => {
    if (
        data.retweetId &&
        !(
            await prisma.tweet.findUnique({
                where: {
                    id: data.retweetId
                },
                select: {
                    _count: true
                }
            })
        )?._count
    )
        return new Error("Tweet doesn't exist")

    return await prisma.tweet.create({
        data
    })
}

export const getTweet = async (id: GetTweetInput) =>
    await prisma.tweet.findUnique({
        where: {
            id: +id
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
    })

export const favoriteTweet = async ({ id, userId }: FavoriteTweetInput) =>
    await prisma.tweet.update({
        where: {
            id: +id
        },
        data: {
            favoriteBy: {
                connect: {
                    id: userId
                }
            }
        }
    })
