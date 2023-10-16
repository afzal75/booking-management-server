/*
  Warnings:

  - You are about to drop the column `createdAt` on the `bookings` table. All the data in the column will be lost.
  - You are about to drop the column `date` on the `bookings` table. All the data in the column will be lost.
  - You are about to drop the column `endTime` on the `bookings` table. All the data in the column will be lost.
  - You are about to drop the column `serviceId` on the `bookings` table. All the data in the column will be lost.
  - You are about to drop the column `startTime` on the `bookings` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `bookings` table. All the data in the column will be lost.
  - The `status` column on the `bookings` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - You are about to drop the column `answer` on the `faqs` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `faqs` table. All the data in the column will be lost.
  - You are about to drop the column `question` on the `faqs` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `faqs` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `reviews` table. All the data in the column will be lost.
  - You are about to drop the column `rating` on the `reviews` table. All the data in the column will be lost.
  - You are about to drop the column `review` on the `reviews` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `reviews` table. All the data in the column will be lost.
  - You are about to drop the column `categoryId` on the `services` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `services` table. All the data in the column will be lost.
  - You are about to drop the column `imageLink` on the `services` table. All the data in the column will be lost.
  - You are about to drop the column `tax` on the `services` table. All the data in the column will be lost.
  - You are about to drop the column `title` on the `services` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `services` table. All the data in the column will be lost.
  - You are about to drop the column `address` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `contactNumber` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `profileImg` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `users` table. All the data in the column will be lost.
  - The `role` column on the `users` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - You are about to drop the `blog` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `categories` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `feedback` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `address` to the `bookings` table without a default value. This is not possible if the table is not empty.
  - Added the required column `district` to the `bookings` table without a default value. This is not possible if the table is not empty.
  - Added the required column `email` to the `bookings` table without a default value. This is not possible if the table is not empty.
  - Added the required column `name` to the `bookings` table without a default value. This is not possible if the table is not empty.
  - Added the required column `package` to the `bookings` table without a default value. This is not possible if the table is not empty.
  - Added the required column `phoneNumber` to the `bookings` table without a default value. This is not possible if the table is not empty.
  - Added the required column `thana` to the `bookings` table without a default value. This is not possible if the table is not empty.
  - Added the required column `description` to the `faqs` table without a default value. This is not possible if the table is not empty.
  - Added the required column `title` to the `faqs` table without a default value. This is not possible if the table is not empty.
  - Added the required column `email` to the `reviews` table without a default value. This is not possible if the table is not empty.
  - Added the required column `name` to the `reviews` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userReview` to the `reviews` table without a default value. This is not possible if the table is not empty.
  - Added the required column `category` to the `services` table without a default value. This is not possible if the table is not empty.
  - Added the required column `channel` to the `services` table without a default value. This is not possible if the table is not empty.
  - Added the required column `connectionCost` to the `services` table without a default value. This is not possible if the table is not empty.
  - Added the required column `hdChannel` to the `services` table without a default value. This is not possible if the table is not empty.
  - Added the required column `images` to the `services` table without a default value. This is not possible if the table is not empty.
  - Added the required column `name` to the `services` table without a default value. This is not possible if the table is not empty.
  - Added the required column `status` to the `services` table without a default value. This is not possible if the table is not empty.
  - Changed the type of `price` on the `services` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `location` on the `services` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- CreateEnum
CREATE TYPE "Package" AS ENUM ('wifiInternet', 'mobileConnection', 'tvBox', 'smartHome', 'satelliteTv', 'internet', 'broadband', 'business');

-- DropForeignKey
ALTER TABLE "bookings" DROP CONSTRAINT "bookings_serviceId_fkey";

-- DropForeignKey
ALTER TABLE "services" DROP CONSTRAINT "services_categoryId_fkey";

-- AlterTable
ALTER TABLE "bookings" DROP COLUMN "createdAt",
DROP COLUMN "date",
DROP COLUMN "endTime",
DROP COLUMN "serviceId",
DROP COLUMN "startTime",
DROP COLUMN "updatedAt",
ADD COLUMN     "address" TEXT NOT NULL,
ADD COLUMN     "district" TEXT NOT NULL,
ADD COLUMN     "email" TEXT NOT NULL,
ADD COLUMN     "name" TEXT NOT NULL,
ADD COLUMN     "package" "Package" NOT NULL,
ADD COLUMN     "phoneNumber" TEXT NOT NULL,
ADD COLUMN     "thana" TEXT NOT NULL,
DROP COLUMN "status",
ADD COLUMN     "status" TEXT NOT NULL DEFAULT 'pending';

-- AlterTable
ALTER TABLE "faqs" DROP COLUMN "answer",
DROP COLUMN "createdAt",
DROP COLUMN "question",
DROP COLUMN "updatedAt",
ADD COLUMN     "description" TEXT NOT NULL,
ADD COLUMN     "title" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "reviews" DROP COLUMN "createdAt",
DROP COLUMN "rating",
DROP COLUMN "review",
DROP COLUMN "updatedAt",
ADD COLUMN     "email" TEXT NOT NULL,
ADD COLUMN     "name" TEXT NOT NULL,
ADD COLUMN     "userReview" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "services" DROP COLUMN "categoryId",
DROP COLUMN "createdAt",
DROP COLUMN "imageLink",
DROP COLUMN "tax",
DROP COLUMN "title",
DROP COLUMN "updatedAt",
ADD COLUMN     "category" TEXT NOT NULL,
ADD COLUMN     "channel" TEXT NOT NULL,
ADD COLUMN     "connectionCost" INTEGER NOT NULL,
ADD COLUMN     "hdChannel" TEXT NOT NULL,
ADD COLUMN     "images" TEXT NOT NULL,
ADD COLUMN     "name" TEXT NOT NULL,
ADD COLUMN     "status" TEXT NOT NULL,
DROP COLUMN "price",
ADD COLUMN     "price" INTEGER NOT NULL,
DROP COLUMN "location",
ADD COLUMN     "location" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "users" DROP COLUMN "address",
DROP COLUMN "contactNumber",
DROP COLUMN "createdAt",
DROP COLUMN "profileImg",
DROP COLUMN "updatedAt",
ADD COLUMN     "phoneNumber" TEXT NOT NULL DEFAULT '',
ADD COLUMN     "profileImage" TEXT NOT NULL DEFAULT '',
ALTER COLUMN "name" SET DEFAULT '',
DROP COLUMN "role",
ADD COLUMN     "role" TEXT NOT NULL DEFAULT 'user';

-- DropTable
DROP TABLE "blog";

-- DropTable
DROP TABLE "categories";

-- DropTable
DROP TABLE "feedback";

-- DropEnum
DROP TYPE "BookingStatus";

-- DropEnum
DROP TYPE "Location";

-- DropEnum
DROP TYPE "Role";

-- CreateTable
CREATE TABLE "feedbacks" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "comments" TEXT NOT NULL,

    CONSTRAINT "feedbacks_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "blogs" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "images" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "blogs_pkey" PRIMARY KEY ("id")
);
