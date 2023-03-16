import prisma from './prisma'

export default async () => {
  await prisma.$transaction([
    prisma.user.deleteMany() // Do this for each table
  ])
}
