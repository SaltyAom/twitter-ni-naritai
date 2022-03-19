/*
  Warnings:

  - The primary key for the `Profile` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- DropIndex
DROP INDEX "Profile_alias_key";

-- AlterTable
ALTER TABLE "Profile" DROP CONSTRAINT "Profile_pkey",
ALTER COLUMN "name" SET DATA TYPE VARCHAR(128),
ALTER COLUMN "alias" SET DATA TYPE TEXT,
ADD CONSTRAINT "Profile_pkey" PRIMARY KEY ("alias");
