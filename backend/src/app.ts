//  _                 _      _
// | |_ __ __ __ ___ | | ___| |_  ___  _ _  ___
// | ' \\ V  V // -_)| |(_-<|  _|/ -_)| '_|(_-<
// |_||_|\_/\_/ \___||_|/__/ \__|\___||_|  /__/
//                Sup dudes!

import express, { type Request, type Response } from 'express'
import dotenv from 'dotenv'
import cors from 'cors'

dotenv.config()

const app = express()
app.use(express.json())
app.use(cors())

const onHealthCheck = (_: Request, response: Response): Response<any, Record<string, any>> => response.status(200).json('HEALTH CHECK :: Health checked! 💉')
app.get('/api', onHealthCheck)

export default app
