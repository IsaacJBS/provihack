const queryString = window.location.search;
const urlParams = new URLSearchParams(queryString);
const id = urlParams.get('id');

const img = document.querySelector(".mentor-card__img-perfil");
const nome = document.querySelector(".mentor-card__nome-cargo__nome");
const cargo = document.querySelector(".mentor-card__nome-cargo__cargo");
const listaAreas = document.querySelector(".mentor-card__areas-comunidades__lista");
const listaComunidades = document.querySelector(".comunidade-lista");
const carreira = document.querySelector(".carreira");
const mentoria = document.querySelector(".mentoria");

fetch(`http://localhost:8000/mentores/${id}`)
    .then(response => response.json())
    .then(mentor => {
        img.src = formatarCaminho(mentor.nome);
        img.alt = mentor.descricao;
        nome.innerText = mentor.nome;
        cargo.innerText = mentor.cargo;
        preencherLista(listaAreas, mentor.areas);
        preencherLista(listaComunidades, mentor.comunidades);
        carreira.innerText = mentor.carreira;
        mentoria.innerText = mentor.mentoria;
    })
    .catch(error => console.log(error));

const formatarCaminho = (nome) => {
    const nomeSemAcentos = nome.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
    const primeiroNomeMinusculo = nomeSemAcentos.split(" ")[0].toLowerCase();
    return `../../assets/${primeiroNomeMinusculo}-monitoria.png`;
}

const preencherLista = (lista, stringItens) => {
    const arrayItens = stringItens.split(", ");
    for (const item of arrayItens) {
        const itemLista = document.createElement("li");
        itemLista.classList.add("mentor-card__areas-comunidades__lista__item");
        itemLista.innerText = item;
        lista.appendChild(itemLista);
    }
}