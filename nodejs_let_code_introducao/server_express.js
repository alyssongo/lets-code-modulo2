const express = require('express')
const path = require('path')

const app = express()

app.get('/', express.static('public'))


app.listen(5001, ()=>{
    console.log('servidor com express rodando na porta 5001')
})