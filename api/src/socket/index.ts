import { Server } from 'socket.io'
import { env } from '../env'
import { createServer } from 'http'
import { app } from '../server'
import { prisma } from '../prisma'
import { AppointmentData } from '../@types/booking'
import { saveAppointment } from './appointments'

const server = createServer(app)
const port = env.SOCKET_PORT

const io = new Server(server, { 
    cors: {
        allowedHeaders: '*',
        origin: '*',
        methods: '*'
    }
})

io.on('connection', (socket) => {
    socket.on('booking', (data: AppointmentData) => saveAppointment(socket, data))  
})


server.listen(port, () => console.log('Socket online na porta ' + port))
