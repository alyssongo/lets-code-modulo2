const os = require('os')
const events = require('events');


setInterval(() => status_men(), 1000);

function status_men() {
    console.clear();
    let stats = {
        menTotal: `${os.totalmem() / 1024/1024/1024} GB`,
        menFree: `${os.freemem() / 1024/1024/1024} GB`,
        menUsage: os.freemem() * 100 / os.totalmem()
    }
    console.table(stats);

    // console.log(`${os.totalmem() / 1024/1024/1024} GB`);
    // console.log(`${os.freemem() / 1024/1024/1024} GB`);
    // console.log(os.freemem() * 100 / os.totalmem());
}

const entrosado = new EventEmitter()

entrosado.on('Olá', ()=>{console.log('Oi'); 
                    entrosado.emit('Oi')})
entrosado.on('Oi', ()=>{console.log('Como vai você?'); 
                    entrosado.emit('Como vai você?')})
entrosado.on('Como vai você?', ()=>{console.log('Vou bem e vc?'); 
                    entrosado.emit('Vou bem e vc?')})
entrosado.on('Vou bem e vc?', ()=>{console.log('Estou maravilhosamente bem.')})


entrosado.emit('Olá')