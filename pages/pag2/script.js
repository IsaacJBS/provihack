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

        mentor.recomendacoes.forEach(recomendacao => {
            criarCartaoRecomendacao(recomendacao);
        });
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

const containerRecomendacoes = document.querySelector(".recomendacoes");
const criarCartaoRecomendacao = (recomendacao) => {
    const cartaoRecomendacao = document.createElement("div");
    cartaoRecomendacao.classList.add("card__recomendacoes");
    containerRecomendacoes.appendChild(cartaoRecomendacao);

    const cartaoTitulo = document.createElement("h2");
    cartaoTitulo.classList.add("pink-title");
    cartaoTitulo.innerText = recomendacao.titulo;
    cartaoRecomendacao.appendChild(cartaoTitulo);

    const cartaoComentario = document.createElement("p");
    cartaoComentario.classList.add("comentario");
    cartaoComentario.innerText = recomendacao.comentario;
    cartaoRecomendacao.appendChild(cartaoComentario);

    const mentorNota = document.createElement("div");
    mentorNota.classList.add("mentor-card__nota");
    cartaoRecomendacao.appendChild(mentorNota);

    preencherNota(mentorNota);

    const cardPerfil = document.createElement("div");
    cardPerfil.classList.add("card__perfil");
    cartaoRecomendacao.appendChild(cardPerfil);

    const imgPerfil = document.createElement("div");
    imgPerfil.classList.add("img-card__perfil");
    cardPerfil.appendChild(imgPerfil);

    const img = document.createElement("img");
    img.src = formatarCaminhoAluno(recomendacao.autor);
    img.alt = `${recomendacao.autor}`;
    imgPerfil.appendChild(img);

    const infoPerfil = document.createElement("div");
    infoPerfil.classList.add("info-card__perfil");
    cardPerfil.appendChild(infoPerfil);

    const nome = document.createElement("span");
    nome.innerText = recomendacao.autor;
    infoPerfil.appendChild(nome);

    const cargo = document.createElement("p");
    cargo.innerText = recomendacao.cargo;
    infoPerfil.appendChild(cargo);
}

const preencherNota = (mentorNota) => {
    for (let i = 0; i < 5; i++) {
        const estrela = document.createElement("img");
        estrela.src = "../../assets/estrela.svg";
        mentorNota.appendChild(estrela);
    }
}

const formatarCaminhoAluno = (nome) => {
    const nomeSemAcentos = nome.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
    const primeiroNomeMinusculo = nomeSemAcentos.split(" ")[0].toLowerCase();
    return `../../assets/${primeiroNomeMinusculo}-perfil.png`;
}