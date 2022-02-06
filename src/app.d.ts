/* eslint-disable @typescript-eslint/no-unused-vars */
import type fastify, { FastifyRequest } from 'fastify'

import type { Redis } from 'ioredis'

declare module 'fastify' {
    interface FastifyRequest {
        auth: boolean
        userId: number | null
    }
}
