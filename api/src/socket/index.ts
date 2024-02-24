import { Server } from 'socket.io'
import { env } from '../env'
import { createServer } from 'http'
import { app } from '../server'
import { prisma } from '../prisma'

const server = createServer(app)
const port = env.SOCKET_PORT

const io = new Server(server, { 
    cors: {
        allowedHeaders: '*',
        origin: '*',
        methods: '*'
    }
})

type BookingData = {
    user: string,
    barber: string,
    date: Date,
    service: number
}

io.on('connection', (socket) => {
    socket.on('booking', ({ user, barber,date, service }: BookingData) => {
        prisma.appointments.create({
            data: {
                userId: user,
                barberId: barber,
                date,
                serviceId: service
            }
        })

        socket.emit(`${socket.id}-booking`, 'Marcação feita com sucesso.') 
    })  
})


server.listen(port, () => console.log('Socket online na porta ' + port))
