/*************************************************

     _                 _      _
    | |_ __ __ __ ___ | | ___| |_  ___  _ _  ___
    | ' \\ V  V // -_)| |(_-<|  _|/ -_)| '_|(_-<
    |_||_|\_/\_/ \___||_|/__/ \__|\___||_|  /__/
                Sup dudes!

*************************************************/

import 'module-alias/register'

import express, { type Application, type Request, type Response } from 'express'
import cors from 'cors'
import morgan from 'morgan'
import dotenv from 'dotenv'

import validateEnv from '@root/utils/validate-env'

dotenv.config()
validateEnv()

const app: Application = express()
app.use(cors())
app.use(morgan('tiny'))

const onHealthCheck = (_: Request, response: Response): Response<any, Record<string, any>> => response.status(200).json('HEALTH CHECK :: Health checked! 💉')
app.get('/api', onHealthCheck)

export default app
