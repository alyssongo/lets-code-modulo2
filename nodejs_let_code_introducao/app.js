const os = require('os')
const events = require('events');


setInterval(() => status_men(), 1000)

function status_men(){
    console.clear();
    let stats ={
        menTotal: `${os.totalmem() / 1024 / 1024 /1024} GB`,
        menFree: `${os.freemem() / 1024 / 1024 / 1024} GB`,
        menUsage: `${os.freemem()*100 /os.totalmem()} %`
    }
    console.table(stats)
}

const entrosado = new events.EventEmitter()

entrosado.on('Olá', ()=>{console.log('Oi'); 
                        entrosado.emit('Oi')})
entrosado.on('Oi', ()=>{console.log('como vai você?'); 
                        entrosado.emit('como vai você?')})
entrosado.on('como vai você?', ()=>{console.log('Vou bem e você?'); 
                                entrosado.emit('Vou bem e você?')})
entrosado.on('Vou bem e você?', ()=>{console.log('Estou mavilhosamente bem.')})


entrosado.emit('Olá')










