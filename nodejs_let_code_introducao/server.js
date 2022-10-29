const http = require('http')
const fs = require('fs')
const path = require('path')

http.createServer((req, res)=>{

    
    if(req.url === '/'){
       file = path.join(__dirname, 'public', 'index.html')
    }else{
        file = path.join(__dirname, 'public', req.url)
    }

   console.log(`Url requerida: ${req.url}`);

   fs.readFile( file, (err, data) =>{
    if (err) throw err
    res.end(data)
    return
    })
   
    
   
  
   
    return


}).listen(4000, ()=>{
    console.log('Server run on port 4000');
})





// if(req.url === '/create'){
//     res.end(JSON.stringify({
//         message: "Voce Esta na pagina CREATE"
//     }))
//     return
//    }if(req.url === '/update'){
//     res.end(JSON.stringify({
//         message: "Voce Esta na pagina UPDATE"
//     }))
//     return
//    }