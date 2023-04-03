/*************************************************

     _                 _      _
    | |_ __ __ __ ___ | | ___| |_  ___  _ _  ___
    | ' \\ V  V // -_)| |(_-<|  _|/ -_)| '_|(_-<
    |_||_|\_/\_/ \___||_|/__/ \__|\___||_|  /__/
                Sup dudes!

*************************************************/

import resetDB from './reset-db'

// TODO: Seems fairly slow and computationally expensive.
// Might consider optimizations in the future as I
// start to add more tests. Works ok for now

// **********************************************************
//  Clear database before each test
// **********************************************************
beforeEach(async () => {
  await resetDB()
})
