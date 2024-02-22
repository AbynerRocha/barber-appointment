import express from 'express'
import { env } from './env'
import cors from 'cors'

export const app = express()

app.use(express.json())
app.use(cors)

app.listen(env.HTTP_PORT, () => console.log('Server online'))