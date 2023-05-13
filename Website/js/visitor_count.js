

fetch('https://6revb97620.execute-api.ca-central-1.amazonaws.com/aws-Visitor-Count').then(reponse=>reponse.json()).then((data)=>{
    document.getElementById('visitor-count').innerText=data.count
})