/*
  Warnings:

  - You are about to drop the column `service` on the `tb_appointments` table. All the data in the column will be lost.
  - Added the required column `serviceId` to the `tb_appointments` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "tb_appointments" DROP COLUMN "service",
ADD COLUMN     "serviceId" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "tb_appointments" ADD CONSTRAINT "tb_appointments_serviceId_fkey" FOREIGN KEY ("serviceId") REFERENCES "tb_services"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
