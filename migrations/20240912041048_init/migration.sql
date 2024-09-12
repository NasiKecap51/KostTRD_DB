/*
  Warnings:

  - You are about to drop the `menu` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `order` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `order_list` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `user` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `order` DROP FOREIGN KEY `Order_idUser_fkey`;

-- DropForeignKey
ALTER TABLE `order_list` DROP FOREIGN KEY `Order_List_idMenu_fkey`;

-- DropForeignKey
ALTER TABLE `order_list` DROP FOREIGN KEY `Order_List_idOrder_fkey`;

-- DropTable
DROP TABLE `menu`;

-- DropTable
DROP TABLE `order`;

-- DropTable
DROP TABLE `order_list`;

-- DropTable
DROP TABLE `user`;

-- CreateTable
CREATE TABLE `Pengguna` (
    `user_id` INTEGER NOT NULL AUTO_INCREMENT,
    `nama_user` VARCHAR(10) NOT NULL,
    `email_user` VARCHAR(100) NOT NULL,
    `password_user` VARCHAR(100) NOT NULL,
    `nomortlp_user` VARCHAR(12) NOT NULL,
    `role_user` ENUM('BapakKost', 'AnakKost') NOT NULL DEFAULT 'AnakKost',

    PRIMARY KEY (`user_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Admin` (
    `id_Admin` INTEGER NOT NULL AUTO_INCREMENT,
    `nama_Admin` VARCHAR(50) NOT NULL,
    `email_Admin` VARCHAR(225) NOT NULL,
    `password_Admin` VARCHAR(100) NOT NULL,
    `nomortlp_Admin` VARCHAR(12) NOT NULL,
    `role_admin` ENUM('BapakKost', 'AnakKost') NOT NULL DEFAULT 'BapakKost',

    PRIMARY KEY (`id_Admin`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Kamar` (
    `id_kamar` INTEGER NOT NULL AUTO_INCREMENT,
    `nomor_kamar` INTEGER NOT NULL,
    `harga_kamar` INTEGER NOT NULL,
    `kapasitas` INTEGER NOT NULL,
    `category` ENUM('KamarKost') NOT NULL DEFAULT 'KamarKost',
    `status` ENUM('Tersedia', 'TidakTersedia', 'Menunggu', 'SudahDibayar', 'BelumDibayar') NOT NULL DEFAULT 'Tersedia',

    PRIMARY KEY (`id_kamar`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Pemesanan` (
    `id_pemesanan` INTEGER NOT NULL AUTO_INCREMENT,
    `id_user` INTEGER NOT NULL,
    `id_kamar` INTEGER NOT NULL,
    `tanggal_mulai` DATETIME(3) NOT NULL,
    `tanggal_akhir` DATETIME(3) NOT NULL,
    `status_booking` ENUM('Tersedia', 'TidakTersedia', 'Menunggu', 'SudahDibayar', 'BelumDibayar') NOT NULL DEFAULT 'Menunggu',

    PRIMARY KEY (`id_pemesanan`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Pembayaran` (
    `id_pemesanan` INTEGER NOT NULL AUTO_INCREMENT,
    `id_user` INTEGER NOT NULL,
    `tanggal_pembayaran` DATETIME(3) NOT NULL,
    `metode_pembayaran` ENUM('Transfer', 'Qris', 'Ewallet') NOT NULL,
    `status_pembayaran` ENUM('Tersedia', 'TidakTersedia', 'Menunggu', 'SudahDibayar', 'BelumDibayar') NOT NULL DEFAULT 'SudahDibayar',

    PRIMARY KEY (`id_pemesanan`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
