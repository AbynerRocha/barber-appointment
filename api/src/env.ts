import { z } from "zod";

const envSchema = z.object({
    HTTP_PORT: z.coerce.number(),
    SOCKET_PORT: z.coerce.number(),
})

export const env = envSchema.parse(process.env)