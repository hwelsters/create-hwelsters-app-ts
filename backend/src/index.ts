/*
     _                 _      _
    | |_ __ __ __ ___ | | ___| |_  ___  _ _  ___
    | ' \\ V  V // -_)| |(_-<|  _|/ -_)| '_|(_-<
    |_||_|\_/\_/ \___||_|/__/ \__|\___||_|  /__/
                Sup dudes!
*/

import app from './app'
const port = process.env.PORT ?? 4000

const onBackendLive = (): void => { console.log('LIVE :: Backend is up and running! 🎉') }
app.listen(port, onBackendLive)
