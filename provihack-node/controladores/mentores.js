const conexao = require("../conexao");

const listarMentores = async (req, res) => {
    try {
        const query = 'select * from mentores order by id';
        const mentores = await conexao.query(query);
        if (mentores.rowCount === 0) {
            return res.status(404).json({ "error": "Nenhum mentor encontrado" });
        }
        res.header("Access-Control-Allow-Origin", null);
        res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
        return res.status(200).json(mentores.rows);
    } catch (error) {
        return res.status(400).json({ 'error': error.message });
    }
}

const obterMentor = async (req, res) => {
    const { id } = req.params;
    try {
        const query = `select m.nome, m.cargo, m.areas, m.comunidades, m.descricao,
        b.carreira, b.mentoria from mentores m
        join mentores_bio b on m.id = b.mentor_id
        where m.id = $1`;
        const mentor = await conexao.query(query, [id]);
        if (mentor.rowCount === 0) {
            return res.status(404).json("Não foi encontrado um mentor com essa id");
        }
        const query2 = 'select titulo, comentario, autor, cargo from mentores_recomendacoes where mentor_id = $1';
        const { rows: recomendacoes } = await conexao.query(query2, [id]);
        const mentorComRecomendacoes = { ...mentor.rows[0], recomendacoes };
        res.header("Access-Control-Allow-Origin", null);
        res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
        return res.status(200).json(mentorComRecomendacoes);
    } catch (error) {
        return res.status(400).json({ 'error': error.message });
    }
}

module.exports = {
    listarMentores,
    obterMentor
}