import { nanoid } from 'nanoid'
import { redis } from '~/services'

export const refreshToken = async ({
    id,
    previous: previousToken
}: {
    id: number
    previous: string
}) => {
    const key = `ac:${id}`

    const accessToken = nanoid()
    await redis.sadd(key, accessToken)

    if (previousToken) await redis.srem(key, 1, previousToken)

    return accessToken
}

export const verifyToken = async (accessToken: string) => {
    const [token, id] = accessToken.split(',')

    const exists = await redis.sismember(`ac:${id}`, token)

    return { id: +id, exists }
}
