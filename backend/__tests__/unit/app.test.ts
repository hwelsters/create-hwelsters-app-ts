/*

     _                 _      _
    | |_ __ __ __ ___ | | ___| |_  ___  _ _  ___
    | ' \\ V  V // -_)| |(_-<|  _|/ -_)| '_|(_-<
    |_||_|\_/\_/ \___||_|/__/ \__|\___||_|  /__/
                Sup dudes!

*/

import request from 'supertest'
import app from '../../src/app'

// **********************************************************
// Tests that /api returns 200 code and that the response 
// body contains the text 'HEALTH CHECK'
// **********************************************************
test('app.ts :: /api :: should return status 200 and contain the text \'HEALTH CHECK\' in response', async () => {
  await request(app)
    .get('/api')
    .then((response: any) => {
      expect(response.statusCode).toBe(200)
      expect(response.body).toContain('HEALTH CHECK')
    })
})