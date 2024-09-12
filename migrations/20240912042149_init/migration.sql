/*
  Warnings:

  - You are about to drop the column `id_user` on the `pembayaran` table. All the data in the column will be lost.
  - You are about to drop the column `id_user` on the `pemesanan` table. All the data in the column will be lost.
  - You are about to drop the column `status_booking` on the `pemesanan` table. All the data in the column will be lost.
  - Added the required column `user_id` to the `Pembayaran` table without a default value. This is not possible if the table is not empty.
  - Added the required column `user_id` to the `Pemesanan` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `pembayaran` DROP COLUMN `id_user`,
    ADD COLUMN `user_id` INTEGER NOT NULL,
    MODIFY `metode_pembayaran` ENUM('Transfer', 'Qris', 'Ewallet') NOT NULL DEFAULT 'Transfer';

-- AlterTable
ALTER TABLE `pemesanan` DROP COLUMN `id_user`,
    DROP COLUMN `status_booking`,
    ADD COLUMN `status_pembayaran` ENUM('Menunggu', 'SudahDibayar', 'BelumDibayar') NOT NULL DEFAULT 'Menunggu',
    ADD COLUMN `user_id` INTEGER NOT NULL;
