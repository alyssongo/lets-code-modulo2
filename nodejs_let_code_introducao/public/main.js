const btn_start = document.querySelector('#btn_start')
const btn_pause = document.querySelector('#btn_pause')
const btn_reset = document.querySelector('#btn_reset')

let lbl_cents = document.querySelector('#cents')
let lbl_seconds = document.querySelector('#seconds')
let lbl_minutes = document.querySelector('#minutes')
let intervalo
let cents = 0
let seconds = 0
let minutes = 0

console.log(btn_start);
console.log(btn_pause);
console.log(btn_reset);


btn_start.addEventListener('click', (event)=>{
    event.preventDefault();

    if (minutes < 59){
        intervalo = setInterval(start_cronometro, 10)
    }else{
        alert("Capacidade máxima de contagem de tempo atingida! Por favor resete o cronômetro")
    }

})


function start_cronometro_alternative() {
    if (cents < 99) {
        cents++;
        if (cents < 10) 
            { cents = "0"+cents }
        lbl_cents.textContent = cents;
    
    }
    if (cents == 99) {
        cents =-1;
    }
    if (cents == 0) {
        seconds++;
        if (seconds < 10) { seconds = "0"+seconds }
        lbl_seconds.textContent = seconds;
    }
    
    //Completar com o código para minutos
    
}

function start_cronometro() {
    cents++    
    if (cents <= 9) {
        lbl_cents.textContent = "0" + cents
        
    }else if (cents > 9 && cents <= 99){
        lbl_cents.textContent = cents
    }
    
    if (cents > 99){
        cents = 0
        lbl_cents.textContent = "0" + cents
        incrementa_segundo()
        
    }
    
}


function incrementa_segundo() {
    seconds++ //60
    if (seconds <= 9) {
        lbl_seconds.textContent = "0" + seconds
    } else if (seconds > 9 && seconds <= 59 ) {
        lbl_seconds.textContent = seconds
    }

    if (seconds > 59){
        seconds = 0
        lbl_seconds.textContent = "0" + seconds
        incrementa_minuto()
        
    }

}

function incrementa_minuto(){
    minutes++
    if (minutes <= 9) {
        lbl_minutes.textContent = "0" + minutes
    } else if (minutes > 9 && minutes <= 59 ) {
        lbl_minutes.textContent = minutes
    }

    if (minutes > 59) {
        clearInterval(intervalo)
        alert("Capacidade máxima de contagem de tempo atingida!")
    }

}



btn_pause.addEventListener('click', (event)=>{
    event.preventDefault();
    clearInterval(intervalo)

})


btn_reset.addEventListener('click', (event) =>{
    event.preventDefault()
    clearInterval(intervalo)

    cents = 0
    seconds = 0
    minutes = 0

    lbl_cents.textContent = "00"
    lbl_seconds.textContent = "00"
    lbl_minutes.textContent = "00"

})