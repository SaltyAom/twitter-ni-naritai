import { prisma } from '~/services'

import type { CreateTweetInput, GetTweetInput } from './types'

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
            favoriteBy: {
                select: {
                    _count: true
                }
            },
            retweet: {
                select: {
                    _count: true
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
