const express = require('express');
const mentores = require("./controladores/mentores");

const rotas = express();

rotas.get("/mentores", mentores.listarMentores);
rotas.get("/mentores/:id", mentores.obterMentor);

module.exports = rotas;