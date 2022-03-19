/*
  Warnings:

  - The primary key for the `Profile` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `email` on the `Profile` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(128)`.
  - You are about to alter the column `name` on the `Profile` table. The data in that column could be lost. The data in that column will be cast from `VarChar(128)` to `VarChar(50)`.
  - You are about to alter the column `bio` on the `Profile` table. The data in that column could be lost. The data in that column will be cast from `VarChar(256)` to `VarChar(180)`.
  - You are about to alter the column `alias` on the `Profile` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(36)`.

*/
-- DropIndex
DROP INDEX "Profile_name_key";

-- AlterTable
ALTER TABLE "Profile" DROP CONSTRAINT "Profile_pkey",
ALTER COLUMN "email" SET DATA TYPE VARCHAR(128),
ALTER COLUMN "name" SET DATA TYPE VARCHAR(50),
ALTER COLUMN "bio" SET DATA TYPE VARCHAR(180),
ALTER COLUMN "alias" SET DATA TYPE VARCHAR(36),
ADD CONSTRAINT "Profile_pkey" PRIMARY KEY ("alias");
