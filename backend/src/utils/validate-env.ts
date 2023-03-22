/*************************************************

     _                 _      _
    | |_ __ __ __ ___ | | ___| |_  ___  _ _  ___
    | ' \\ V  V // -_)| |(_-<|  _|/ -_)| '_|(_-<
    |_||_|\_/\_/ \___||_|/__/ \__|\___||_|  /__/
                Sup dudes!

*************************************************/

import { cleanEnv, port, str } from 'envalid'

// **********************************************************
// Ensures that all required environment variables are present
// and adhere to required types
// **********************************************************
const validateEnv = (): void => {
  cleanEnv(process.env, {
    PORT: port(),
    POSTGRES_HOST: str(),
    POSTGRES_PORT: str(),
    POSTGRES_USER: str(),
    POSTGRES_PASSWORD: str(),
    POSTGRES_DB: str()
  })
}

export default validateEnv
