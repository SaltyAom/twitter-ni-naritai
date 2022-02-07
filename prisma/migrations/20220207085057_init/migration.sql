/*
  Warnings:

  - The primary key for the `Profile` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `name` on the `Profile` table. The data in that column could be lost. The data in that column will be cast from `VarChar(128)` to `VarChar(64)`.
  - A unique constraint covering the columns `[alias]` on the table `Profile` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id]` on the table `Profile` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `alias` to the `Profile` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Profile" DROP CONSTRAINT "Profile_pkey",
ADD COLUMN     "alias" VARCHAR(15) NOT NULL,
ALTER COLUMN "name" SET DATA TYPE VARCHAR(64),
ADD CONSTRAINT "Profile_pkey" PRIMARY KEY ("id", "alias");

-- CreateIndex
CREATE UNIQUE INDEX "Profile_alias_key" ON "Profile"("alias");

-- CreateIndex
CREATE UNIQUE INDEX "Profile_id_key" ON "Profile"("id");
