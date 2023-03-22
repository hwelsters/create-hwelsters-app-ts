/*************************************************

     _                 _      _
    | |_ __ __ __ ___ | | ___| |_  ___  _ _  ___
    | ' \\ V  V // -_)| |(_-<|  _|/ -_)| '_|(_-<
    |_||_|\_/\_/ \___||_|/__/ \__|\___||_|  /__/
                Sup dudes!

*************************************************/

import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()

const usersData = [ // we only have on user here
  {
    email: 'email@domain.com',
    name: 'name'
  }
]

const main = async () => {
  console.log('start seeding …')
  for (const _user of usersData) {
    const user = await prisma.user.create({
      data: _user
    })
    console.log(`Created user with id: ${user.id}`)
  }
  console.log('seeding done')
}

main()
  .catch(e => {
    console.error('foo', e)
    process.exit(1)
  })
  .finally(async () => {
    await prisma.$disconnect()
  })
