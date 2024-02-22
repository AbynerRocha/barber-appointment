import { Server } from 'socket.io'
import { env } from '../env'
import { createServer } from 'http'
import { app } from '../server'

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
    socket.on('teste', (data: string) => {
        console.log(data)

        socket.emit('message', 'Voltando...')
    })

    console.log(socket.id)    
})


server.listen(port, () => console.log('Socket online na porta ' + port))
