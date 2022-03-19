/*
  Warnings:

  - You are about to drop the `Post` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Post" DROP CONSTRAINT "Post_authorId_fkey";

-- DropForeignKey
ALTER TABLE "Post" DROP CONSTRAINT "Post_retweetId_fkey";

-- DropForeignKey
ALTER TABLE "_favorite" DROP CONSTRAINT "_favorite_A_fkey";

-- AlterTable
ALTER TABLE "Profile" ALTER COLUMN "bio" SET DEFAULT E'';

-- DropTable
DROP TABLE "Post";

-- CreateTable
CREATE TABLE "Tweet" (
    "id" SERIAL NOT NULL,
    "content" VARCHAR(255),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "authorId" INTEGER NOT NULL,
    "images" TEXT[],
    "retweetId" INTEGER,

    CONSTRAINT "Tweet_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Tweet_retweetId_key" ON "Tweet"("retweetId");

-- AddForeignKey
ALTER TABLE "Tweet" ADD CONSTRAINT "Tweet_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tweet" ADD CONSTRAINT "Tweet_retweetId_fkey" FOREIGN KEY ("retweetId") REFERENCES "Tweet"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_favorite" ADD FOREIGN KEY ("A") REFERENCES "Tweet"("id") ON DELETE CASCADE ON UPDATE CASCADE;
