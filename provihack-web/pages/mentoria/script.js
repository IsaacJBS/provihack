const mentoresDOM = document.querySelector(".mentor");

fetch("http://localhost:8000/mentores")
    .then(response => response.json())
    .then(mentores => {
        mentores.forEach(mentor => {
            const mentorCard = document.createElement("div");
            mentorCard.classList.add("mentor-card");
            mentoresDOM.appendChild(mentorCard);

            const mentorImg = document.createElement("img");
            mentorImg.classList.add("mentor-card__img-perfil");
            mentorImg.src = formatarCaminho(mentor.nome);
            mentorImg.alt = mentor.descricao;
            mentorCard.appendChild(mentorImg);

            const mentorNomeCargo = document.createElement("div");
            mentorNomeCargo.classList.add("mentor-card__nome-cargo");
            mentorCard.appendChild(mentorNomeCargo);

            const mentorNome = document.createElement("h1");
            mentorNome.classList.add("mentor-card__nome-cargo__nome");
            mentorNome.innerText = mentor.nome;
            mentorNomeCargo.appendChild(mentorNome);

            const mentorCargo = document.createElement("h2");
            mentorCargo.classList.add("mentor-card__nome-cargo__cargo");
            mentorCargo.innerText = mentor.cargo;
            mentorNomeCargo.appendChild(mentorCargo);

            const mentorAreasComunidades = document.createElement("div");
            mentorAreasComunidades.classList.add("mentor-card__areas-comunidades");
            mentorCard.appendChild(mentorAreasComunidades);

            const mentorAreas = document.createElement("div");
            mentorAreas.classList.add("mentor-card__areas-comunidades__areas");
            mentorAreasComunidades.appendChild(mentorAreas);

            const mentorAreasTitulo = document.createElement("h3");
            mentorAreasTitulo.classList.add("mentor-card__areas-comunidades__titulo");
            mentorAreasTitulo.innerText = "ATUA NAS ÁREAS";
            mentorAreas.appendChild(mentorAreasTitulo);

            const mentorAreasLista = document.createElement("ul");
            mentorAreasLista.classList.add("mentor-card__areas-comunidades__lista");
            mentorAreas.appendChild(mentorAreasLista);

            preencherLista(mentorAreasLista, mentor.areas);

            const mentorComunidades = document.createElement("div");
            mentorComunidades.classList.add("mentor-card__areas-comunidades__comunidades");
            mentorAreasComunidades.appendChild(mentorComunidades);

            const mentorComunidadesTitulo = document.createElement("h3");
            mentorComunidadesTitulo.classList.add("mentor-card__areas-comunidades__titulo");
            mentorComunidadesTitulo.innerText = "COMUNIDADES";
            mentorComunidades.appendChild(mentorComunidadesTitulo);

            const mentorComunidadesLista = document.createElement("ul");
            mentorComunidadesLista.classList.add("mentor-card__areas-comunidades__lista");
            mentorComunidadesLista.classList.add("comunidades-lista");
            mentorComunidades.appendChild(mentorComunidadesLista);

            preencherLista(mentorComunidadesLista, mentor.comunidades);

            const mentorNota = document.createElement("div");
            mentorNota.classList.add("mentor-card__nota");
            mentorCard.appendChild(mentorNota);

            preencherNota(mentorNota);

            const botaoVerPerfil = document.createElement("button");
            botaoVerPerfil.classList.add("mentor-card__mostrar-perfil");
            botaoVerPerfil.classList.add("btn--rosa");
            mentorCard.appendChild(botaoVerPerfil);

            const linkVerPerfil = document.createElement("a");
            linkVerPerfil.classList.add("mentor-card__mostrar-perfil__link");
            linkVerPerfil.href = `../pag2/index.html?id=${mentor.id}`;
            linkVerPerfil.innerText = "VER PERFIL";
            botaoVerPerfil.appendChild(linkVerPerfil);
        })
    });

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

const preencherNota = (mentorNota) => {
    for (let i = 0; i < 5; i++) {
        const estrela = document.createElement("img");
        estrela.src = "../../assets/estrela.svg";
        mentorNota.appendChild(estrela);
    }
}