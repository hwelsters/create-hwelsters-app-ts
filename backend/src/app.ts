import express, { type Request, type Response } from 'express'
import cors from 'cors'
import morgan from 'morgan'

import dotenv from 'dotenv'

import validateEnv from './utils/validate_env'
dotenv.config()
validateEnv()

const app = express()
app.use(cors())
app.use(morgan('tiny'))

const onHealthCheck = (_: Request, response: Response): Response<any, Record<string, any>> => response.status(200).json('HEALTH CHECK :: Health checked! 💉')
app.get('/api', onHealthCheck)

export default app
