import app from './app'
const port = process.env.PORT ?? 4000

const onBackendLive = (): void => { console.log('LIVE :: Backend is up and running! 🎉') }
app.listen(port, onBackendLive)
