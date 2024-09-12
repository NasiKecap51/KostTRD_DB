/*
  Warnings:

  - You are about to drop the column `role_admin` on the `admin` table. All the data in the column will be lost.
  - You are about to drop the column `role_user` on the `pengguna` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `admin` DROP COLUMN `role_admin`,
    ADD COLUMN `role` ENUM('BapakKost', 'AnakKost') NOT NULL DEFAULT 'BapakKost';

-- AlterTable
ALTER TABLE `pengguna` DROP COLUMN `role_user`,
    ADD COLUMN `role` ENUM('BapakKost', 'AnakKost') NOT NULL DEFAULT 'AnakKost';
