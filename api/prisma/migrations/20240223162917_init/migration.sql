-- CreateTable
CREATE TABLE "tb_users" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "type" INTEGER NOT NULL DEFAULT 1,

    CONSTRAINT "tb_users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tb_barbers" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "photo" TEXT,

    CONSTRAINT "tb_barbers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tb_services" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "price" INTEGER NOT NULL,

    CONSTRAINT "tb_services_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tb_appointments" (
    "id" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "service" INTEGER NOT NULL,
    "userId" TEXT NOT NULL,
    "barberId" TEXT NOT NULL,

    CONSTRAINT "tb_appointments_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "tb_users_email_key" ON "tb_users"("email");

-- AddForeignKey
ALTER TABLE "tb_appointments" ADD CONSTRAINT "tb_appointments_userId_fkey" FOREIGN KEY ("userId") REFERENCES "tb_users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tb_appointments" ADD CONSTRAINT "tb_appointments_barberId_fkey" FOREIGN KEY ("barberId") REFERENCES "tb_barbers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
