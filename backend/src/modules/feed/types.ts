import type { RouteShorthandMethod } from 'fastify'

export interface GetFeedInput {
    last: number
}

export interface GetFeedHandler extends RouteShorthandMethod {
    Body: GetFeedInput
}
