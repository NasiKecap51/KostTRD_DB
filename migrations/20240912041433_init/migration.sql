/*
  Warnings:

  - The values [Menunggu,SudahDibayar,BelumDibayar] on the enum `Kamar_status` will be removed. If these variants are still used in the database, this will fail.
  - The values [Tersedia,TidakTersedia] on the enum `Pembayaran_status_pembayaran` will be removed. If these variants are still used in the database, this will fail.
  - The values [Tersedia,TidakTersedia] on the enum `Pembayaran_status_pembayaran` will be removed. If these variants are still used in the database, this will fail.

*/
-- AlterTable
ALTER TABLE `kamar` MODIFY `status` ENUM('Tersedia', 'TidakTersedia') NOT NULL DEFAULT 'Tersedia';

-- AlterTable
ALTER TABLE `pembayaran` MODIFY `status_pembayaran` ENUM('Menunggu', 'SudahDibayar', 'BelumDibayar') NOT NULL DEFAULT 'SudahDibayar';

-- AlterTable
ALTER TABLE `pemesanan` MODIFY `status_booking` ENUM('Menunggu', 'SudahDibayar', 'BelumDibayar') NOT NULL DEFAULT 'Menunggu';
