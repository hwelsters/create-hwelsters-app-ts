/*************************************************

     _                 _      _
    | |_ __ __ __ ___ | | ___| |_  ___  _ _  ___
    | ' \\ V  V // -_)| |(_-<|  _|/ -_)| '_|(_-<
    |_||_|\_/\_/ \___||_|/__/ \__|\___||_|  /__/
                Sup dudes!

*************************************************/

import prisma from './prisma'

export default async (): Promise<void> => {
  await prisma.$transaction([
    prisma.user.deleteMany() // Do this for each table
  ])
}
