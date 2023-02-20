/*

     _                 _      _
    | |_ __ __ __ ___ | | ___| |_  ___  _ _  ___
    | ' \\ V  V // -_)| |(_-<|  _|/ -_)| '_|(_-<
    |_||_|\_/\_/ \___||_|/__/ \__|\___||_|  /__/
                Sup dudes!

*/

import request from 'supertest'
import app from '../src/app'

test('app.ts :: /api :: should return health check and status 200', async () => {
  await request(app)
    .get('/api')
    .then((response: any) => {
      expect(response.statusCode).toBe(200)
      expect(response.body).toContain('HEALTH CHECK')
    })
})
