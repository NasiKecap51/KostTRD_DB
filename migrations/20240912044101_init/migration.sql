/*
  Warnings:

  - You are about to drop the column `role` on the `admin` table. All the data in the column will be lost.
  - The primary key for the `pembayaran` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `status_pembayaran` on the `pemesanan` table. All the data in the column will be lost.
  - You are about to drop the column `role` on the `pengguna` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[id_Admin]` on the table `Admin` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id_kamar]` on the table `Kamar` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[user_id]` on the table `Pembayaran` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[user_id]` on the table `Pemesanan` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id_kamar]` on the table `Pemesanan` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[user_id]` on the table `Pengguna` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `id_pembayaran` to the `Pembayaran` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `admin` DROP COLUMN `role`,
    ADD COLUMN `role_admin` ENUM('BapakKost', 'AnakKost') NOT NULL DEFAULT 'BapakKost';

-- AlterTable
ALTER TABLE `pembayaran` DROP PRIMARY KEY,
    ADD COLUMN `id_pembayaran` INTEGER NOT NULL AUTO_INCREMENT,
    MODIFY `id_pemesanan` INTEGER NOT NULL,
    ALTER COLUMN `metode_pembayaran` DROP DEFAULT,
    ADD PRIMARY KEY (`id_pembayaran`);

-- AlterTable
ALTER TABLE `pemesanan` DROP COLUMN `status_pembayaran`,
    ADD COLUMN `pembayaran` ENUM('Transfer', 'Qris', 'Ewallet') NULL,
    ADD COLUMN `status_booking` ENUM('Menunggu', 'SudahDibayar', 'BelumDibayar') NOT NULL DEFAULT 'Menunggu';

-- AlterTable
ALTER TABLE `pengguna` DROP COLUMN `role`,
    ADD COLUMN `role_user` ENUM('BapakKost', 'AnakKost') NOT NULL DEFAULT 'AnakKost';

-- CreateIndex
CREATE UNIQUE INDEX `Admin_id_Admin_key` ON `Admin`(`id_Admin`);

-- CreateIndex
CREATE UNIQUE INDEX `Kamar_id_kamar_key` ON `Kamar`(`id_kamar`);

-- CreateIndex
CREATE UNIQUE INDEX `Pembayaran_user_id_key` ON `Pembayaran`(`user_id`);

-- CreateIndex
CREATE UNIQUE INDEX `Pemesanan_user_id_key` ON `Pemesanan`(`user_id`);

-- CreateIndex
CREATE UNIQUE INDEX `Pemesanan_id_kamar_key` ON `Pemesanan`(`id_kamar`);

-- CreateIndex
CREATE UNIQUE INDEX `Pengguna_user_id_key` ON `Pengguna`(`user_id`);

-- AddForeignKey
ALTER TABLE `Pemesanan` ADD CONSTRAINT `Pemesanan_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `Pengguna`(`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Pemesanan` ADD CONSTRAINT `Pemesanan_id_kamar_fkey` FOREIGN KEY (`id_kamar`) REFERENCES `Kamar`(`id_kamar`) ON DELETE RESTRICT ON UPDATE CASCADE;
