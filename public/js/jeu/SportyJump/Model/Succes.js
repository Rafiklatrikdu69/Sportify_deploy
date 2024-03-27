const succes = document.getElementById("circleSucces");
const cadre = document.getElementById("rectangleSucces");
const icone = document.querySelectorAll(".cadreSucces");

var visible = false;
var fixed = false;
var timer;

function start() {
    timer = setInterval(function () {
        cadre.style.visibility = "hidden";
        cadre.style.transition = "height 0.3s";
    }, 200);
}
function stop() {
    clearInterval(timer);
}

succes.addEventListener("click", function () {
    if (!fixed) {
        fixed = true;
        cadre.style.transition = "height 0.5s";
        cadre.style.height = "85%";
    } else {
        fixed = false;
        visible = false;
        cadre.style.height = "10%";
    }
});
succes.addEventListener("mouseover", function () {
    document.getElementById("circleSucces").style.backgroundColor = "#40A798";
    document.getElementById("trophée").src = "../../../images/succes/trophée2.png";
    stop();
    if (!fixed) {
        visible = true;
        cadre.style.display = "block";
        cadre.style.visibility = "visible";
        cadre.style.height = "10%";
    }
});
succes.addEventListener("mouseout", function () {
    document.getElementById("circleSucces").style.backgroundColor = "#000";
    document.getElementById("trophée").src = "../../../images/succes/trophée.png";
    stop();
    if (!fixed) {
        visible = false;
        cadre.style.height = "0%";
        start();
    }
});

const suce = document.querySelectorAll(".categorieSucces");
suce.forEach(function (categorie) {
    var cadre = categorie.querySelectorAll(".cadreSucces .descriptionSucces");
    var id = 1;
    cadre.forEach(function (s) {
        if (id % 5 == 2) {
            s.style.left = "25%";
            s.style.transform = "translateX(-25%)";
        } else if (id % 5 == 3) {
            s.style.left = "50%";
            s.style.transform = "translateX(-50%)";
        } else if (id % 5 == 4) {
            s.style.left = "75%";
            s.style.transform = "translateX(-75%)";
        } else if (id % 5 == 0) {
            s.style.left = "95%";
            s.style.transform = "translateX(-95%)";
        }
        id++;
    })
});


icone.forEach(function (e) {
    var desc = e.querySelector(".descriptionSucces2");
    var img = e.querySelector("img");

    img.addEventListener("mouseover", function () {
        img.style.height = 50 + "px";
        img.style.width = 50 + "px";
        desc.style.opacity = "1";
    });

    img.addEventListener("mouseout", function () {
        img.style.height = 60 + "px";
        img.style.width = 60 + "px";
        desc.style.opacity = "0";
    });
});


function setSucces() {
    fetch("/public/json-jeu-getAffichageSucces")
        .then(response => {
            if (!response.ok) {
                throw new Error('Erreur lors de la récupération des données');
            }
            return response.json();
        })
        .then(data => {
            console.log(data);
            changeOpacitySucces(data);
        })
        .catch(error => {
            console.error('Erreur lors de la récupération des données:', error);
            return null;
        });
}

function changeOpacitySucces(tab) {
    var img = document.querySelectorAll(".cadreSucces img");
    let indice = 0;
    img.forEach(function (e) {
        if (tab[indice][0] == "TRUE") {
            e.style.opacity = "100%";
        }
        indice++;
    })
}

function updateSuccesById(id) {
    function Score(score) {
        this.score = score;
    }
    e = new Score(id);
    fetch("/public/json-jeu-UpdateSucces", {
        "method": "POST",
        "headers": {
            "Content-Type": "application/json; charset=utf-8"
        },

        "body": JSON.stringify(e)
    })
        .then(response => response.text())
        .then(data => {
            console.log(data);
        })
}


var nbSautSucces = 0;

var nbTueMonstreSucces = 0;
var ballonTuerParMonstre = false;

var nbJetPackSucces = 0;
var nbRessortSucces = 0;

var nbTeleportationSucces = 0;

function setSuccesJump() {
    nbSautSucces++;
    if (nbSautSucces == 30) {                       //30
        updateSuccesById(4);
    } else if (nbSautSucces == 60) {                //60
        updateSuccesById(5);
    }
    console.log("nombre de Saut : " + nbSautSucces);
}

function setNbTueMonstreSucces() {
    nbTueMonstreSucces++;
    if (nbTueMonstreSucces == 2) {                  //2
        updateSuccesById(6);
    } else if (nbTueMonstreSucces == 10) {          //10
        updateSuccesById(7);
    }
    console.log("Nombre de monstres tués : " + nbTueMonstreSucces);
}
function setMonstreElimineBallonSucces() {
    ballonTuerParMonstre = true;
}

function setGetandLoseSucces() {
    if (score >= 20000 && nbPiece == 0) {                   //20000
        updateSuccesById(14);
    } else if (score >= 60000 && nbPiece == 0) {            //60000
        updateSuccesById(15);
    } else if (score >= 50000 && nbPiece == 0 && nbTueMonstreSucces == 0) {     //50000
        updateSuccesById(24);
    } else if (score >= 20000) {
        updateSuccesById(11);
    } else if (score >= 100000) {
        updateSuccesById(12);
    }
}

function setNbPieceSucces() {
    if (nbPiece >= 5) {
        updateSuccesById(16);
    } else if (nbPiece >= 20) {         //20
        updateSuccesById(17);
    }
}

function setNbJetPackSucces() {
    nbJetPackSucces++;
    if (nbJetPackSucces >= 3) {         //3
        updateSuccesById(19);
    }
    console.log("Nombre de jetpack utilisé : " + nbJetPackSucces);
}

function setNbRessortSucces() {
    nbRessortSucces++;
    if (nbRessortSucces >= 10) {        //10
        updateSuccesById(21);
    }
    console.log("Nombre de ressort touché : " + nbRessortSucces);
}

function setSucceTimerMenu() {
    setTimeout(function () {
        updateSuccesById(25)
    }, 180000)                      //180000
}

function setNbTeleportationSucces() {
    nbTeleportationSucces++;
    if (nbTeleportationSucces >= 20) {      //20
        updateSuccesById(27);
    }
}

function updateJeuUserSucces() {

    var isbekill = 0;
    if (ballonTuerParMonstre) {
        isbekill = 1;
    }
    var tab = [0, 0, 0, 0, 0, 0];
    switch (type) {
        case 2: tab[1] = 1;
            break;
        case 3: tab[2] = 1;
            break;
        case 4: tab[3] = 1;
            break;
        case 5: tab[4] = 1;
            break;
        case 6: tab[5] = 1;
            break;
        default: tab[0] = 1;
            break;
    }
    var dataToSend = {
        lose: 1,
        kill: nbTueMonstreSucces,
        bekill: isbekill,
        score: score,
        jet: nbJetPackSucces,
        piece: nbPiece,
        foot: tab[0],
        basket: tab[1],
        tennis: tab[2],
        baseball: tab[3],
        rugby: tab[4],
        bowling: tab[5]
    };

    fetch("/public/json-jeu-UpdateJeuUser", {
        "method": "POST",
        "headers": {
            "Content-Type": "application/json; charset=utf-8"
        },

        "body": JSON.stringify(dataToSend)
    })
        .then(response => response.text())
        .then(data => {
            console.log(data);
        })
}




///MISE A JOUR DES SUCCES RESTANTS
// => NB_LOSE, NB_KILL, NB_BEKILL, NB_PIECE, NB_JET


const resteSucces = document.querySelectorAll("#resteSucces");

function soustractionSucces(a, b) {
    var rest = a - b;
    console.log(a)
    console.log(b)
    if (rest < 0) {
        return "0";
    } else {
        return rest;
    }
}

function setResteInfoSucce(tab) {
    var i = 0;
    resteSucces.forEach(function (reste) {
        switch (i) {
            case 0: reste.innerHTML = "Perdre au moins 10 parties \n Reste: " + soustractionSucces(10, tab[0][0]);
                break;
            case 1: reste.innerHTML = "Perdre au moins 15 parties \n Reste: " + soustractionSucces(15, tab[0][0]);
                break;
            case 2: reste.innerHTML = "Perdre au moins 30 parties \n Reste: " + soustractionSucces(30, tab[0][0]);
                break;
            case 3: reste.innerHTML = "Tuer 40 monstres au total \n Reste: " + soustractionSucces(40, tab[0][1]);
                break;
            case 4: reste.innerHTML = "Mourir 5 fois par un monstre \n Reste: " + soustractionSucces(5, tab[0][2]);
                break;
            case 5: reste.innerHTML = "Mourir 15 fois par un monstre \n Reste: " + soustractionSucces(15, tab[0][2]);
                break;
            case 6: reste.innerHTML = "Obtenir 300 pièces \n Reste: " + soustractionSucces(300, tab[0][4]);
                break;
            case 7: reste.innerHTML = "Utiliser 20 JetPack au total \n Reste: " + soustractionSucces(20, tab[0][3]);
                break;
        }
        i++;
    })
}

fetch("/public/json-jeu-getInfoSuccesRestant")
    .then(response => {
        if (!response.ok) {
            throw new Error('Erreur lors de la récupération des données');
        }
        return response.json();
    })
    .then(data => {
        console.log(data);
        setResteInfoSucce(data)
    })
    .catch(error => {
        console.error('Erreur lors de la récupération des données:', error);
        return null;
    });