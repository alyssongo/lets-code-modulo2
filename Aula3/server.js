const http = require('http')
const fs = require('fs')
const path = require('path')

http.createServer((req, res)=>{
    if (req.url === '/') {
        file = path.join(__dirname, 'public', 'index.html');
    }else{
        file = path.join(__dirname, 'public', req.url);
    }

    console.log('URL requerida: ${req.url}');


    fs.readFile(path.join(__dirname, 'public'), (err, data) => {
        if (err) throw err
        res.end(data)
    })
    return
    if () {
        
    }

}).listen(4000, ()=>{
    console.log('Server run on port 4000');
}) 