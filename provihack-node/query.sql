create database empuxo;

drop table if exists mentores;

create table mentores (
	id serial primary key,
  	nome text not null,
  	cargo text not null,
  	areas text not null,
  	comunidades text not null,
  	descricao text not null
);

insert into mentores (nome, cargo, areas, comunidades, descricao) values 
('Júlia Carmo', 'Dev Sr', 'Programação, Inovação, Agile', 'Pessoa Preta, PcD', 'Mulher preta de cabelo marrom, ondulado e tamanho curto,  sorrindo, usando blazer listrado preto e branco,  colar dourado e blusa na cor preta'),
('Dani Silva', 'Tech Lead', 'Programação, Carreira, Design', 'Pessoa Preta, LGBTQIA+', ' Mulher preta  com cabelo preto , crespo e tamanho curto preso com uma faixa nas cores preto e branco no cabelo, usando um brinco e colar dourados, com 
uma camisa branca de manga longa com costura de flores pretas'),
('Jota dos Santos', 'UX Writer Sr', 'UX Writing, Design, Agile', 'Pessoa Preta', 'homem preto de cabelo preto crespo e curto, faznedo uma expressão com uma sombracelha mais alta e a outra mais baixa, com colar
prata e camisa listrada rosa e azul'),
('Paulo Viana', 'Líder de Projetos', 'Projetos, Carreira, Inovação', 'Pessoa Preta, LGBTQIA+', ' Homem preto, de cabelo preto, crespo de tamanho curto, aparado nas laterais  com barba curta/rala com camiseta na cor cinza escuro'),
('Adriele Tomé', 'UX/UI Designer Sr', 'Design, Inovação, Agile', 'Pessoa Preta', 'Mulher preta com cabelo liso amarrado, usando blusa preta'),
('Brenda de Souza', 'Líder de Growth', 'Growth, Marketing, Carreira', 'LGBTQIA+', 'Mulher branca  com óculos de sol, com sorriso aberto, cabelo marrom e preso, usando brincos argola dourados, óculos escuro blusa de manga curta
transparente com top roxo, fazendo sinal com as mãos de paz e amor'),
('Josi Almeida', 'Analista de Marketing Sr', 'Marketing, Inovação, Growth', 'Surda', 'Mulher preta de cabelo preto, curto, encaracolado, está sorrindo e usando blazer amarelo com camisa branca ejeans, e segurando um tablet em uma mão'),
('Marcus Dionísio', 'Líder de design', 'Design, Acessib., Scrum', 'PcD', 'Homem branco de cabelo curto  e barba marrom, está sorrindo, usando  boné branco e verde e casaco cinza'),
('Jasmine Cintra', 'Dev Plena', 'Programação, Scrum, Carreira', 'LGBTQIA+', 'Mulher preta de cabelo marrom encaracolado até os ombros , usando um vestido verde');

drop table if exists mentores_bio;

create table mentores_bio (
	id serial primary key,
  	mentor_id smallint references mentores(id) unique not null,
  	carreira text not null,
  	mentoria text not null
);

insert into mentores_bio (mentor_id, carreira, mentoria) values
(1, 'Iniciou na carreira de tecnologia aos 30 anos, quando finalmente conseguiu sua primeira oportunidade como júnior. Viu sua primeira promoção chegar quando era o único a dominar a linguagem que seria adotada na empresa. Quer apadrinhar um Dev Júnior e se for PcD poderá ajudar mais.', 'Gostaria de manter conversas quinzenais com a pessoa mentorada, observando resultados e metas, além de compartilhar dos desafios que pessoas PCD enfrentam.'),
(2, 'Começou a se interessar por tecnologia quando fez um curso de informática gratuito na comunidade onde morava, e após isso consegui um estágio em uma empresa de tecnologia, onde com 
pequenos passos e muito estudo chegou no cargo de tech led.', 'Tem vontade de realizar conexões, passando para seus mentorados todo o conhecimento que adquiriu até aqui, e dando força e estímulo para que as pessoas não  desistam e consigam atingir seus objetivos, compartilhando dificuldades que pessoas pretas e LGBTQIA+ podem ter que enfrentar.'),
(3, 'Já teve blog, já escreveu copy e hoje é UX Writer de sucesso. Já são 10 anos de carreira e, desde então, viu muita coisa mudar. Acredita que UX Writing tem muito mais de pesquisa do que de talento com as palavras. Ele acredita que ser preto e da periferia o fez entender o uso da língua muito além do que os livros de gramática ensinam.', 'Já treinou várias pessoas e atuou em cursos de UX Writing e de escrita. Acredita que o papel do mentor é metade emocional e metade técnico. Ao mentorar pessoas do mesmo background, acha que pode ajudar muito mais.'),
(4, 'Antes de ser lider de projetos, Paulo começou como gargon de um restaurante, onde nas horas vagas conseguiu ter tempo para se dedicar a um curso onde conseguiu ampliar seus conhecimentos. E economizando todo mês e com a ajuda de amigos realizou o sonho de criar em uma startup, onde hoje em dia é muito bem sucecida.', 'Com sua experiência em liderar projetos quer passar seu conhecimento e toda a experiência que teve para que seus mentorados acreditem que consigam chegar mais longe. E acredita que o conhecimento é muito importante, mas acreditar em si mesmo é mais.'),
(5, 'Adriele já transitou por várias áreas do design. Hoje, como Designer de UX e UI, adora projetor produtos que ajudam pessoas. Como mentora, quer ajudar designer pretos a avaliarem cada passo de sua trajetória e traçar uma rota de sucesso.', 'Pensa que uma sessão por semana é o ideal. Quer conversar sobre questões técnicas, emocionais, pessoais e tudo o que fizer sentido.'),
(6, 'Como pessoa trans, já passou por muitas situações ruins até chegar onde chegou. Muita estudiosa e antenada, está sempre pronta para as mudanças mais disruptivas. Ela acredita que essa seja uma das chaves para o seu sucesso. A outra é saber passar pelas barreiras se alimentar delas.', 'Hoje como líder de growth direciona dezenas de pessoas todos os dias. Ela sonha em poder ver mais colegas líderes trans. Para isso quer apadrinhar algum profissional de growth trans e ter conversas quinzenais.'),
(7, 'O mercado de marketing muda o tempo todo e estar atualizada é um diferencial. Josi já fez de tudo um pouco nessa área e sabe a importância de pensar em diversidade no marketing e na comunicação das empresas. Ela quer ajudar outras pessoas surdas a ocuparem espaço de destaque no mercado de trabalho.', 'Josi sabe os desafios que a pessoas surdas enfrentam desde a alfabetização até a entrada no mercado de trabalho. Ela quer ajudar outras pessoas surdas a passarem desse estágio e a serem líderes também. Quer conversar com a pessoa mentorada pelo menos quinzenalmente.'),
(8, 'Começou a estudar acessibilidade conforme foi perdendo os movimentos dos membros inferiores. Começou a realizar projetos para sua cidade e hoje quer fazer da internet um mundo mais acessível também. Passou por diversas empresas e inaugurou equipes de acessibilidade em algumas delas. Deixou essee termo em evidência e dessa forma vem ajudando a fazer um mundo mais igual. Agora quer fazer isso impulsionando outras pessoas com deficiência.', 'Quer ver mais pessoas com deficiência em posições de liderança. Para isso, gostaria de mentorar profissionais PcD iniciantes para ajudá-los a crescer e serem promovidos.'),
(9, 'Já programou em mais 35 linguagens e escrever códios faz parte de sua vida desde os 12 anos. Já trabalhou em diversas startups e hoje atua em projetos com fins sociais.', 'Quer espalhar suas histórias e sua esperiência para mais pessoas lgbtqia+ e ver suas pessoas mentoradas evoluírem. Acredita no poder da colaboração e da troca.');

drop table if exists mentores_recomendacoes;

create table mentores_recomendacoes (
	id serial primary key,
  	mentor_id smallint references mentores(id) not null,
  	titulo text not null,
  	comentario text not null,
  	autor text not null,
  	cargo text not null
);

insert into mentores_recomendacoes (mentor_id, titulo, comentario, autor, cargo) values 
(1, 'Ótima mentora!', 'Abriu o meu olho para o que eu precisava, meu conselhos e me fez tomar a iniciativa que precisava para quem enxergassem meu valor.', 'Letícia Müller', 'Product Designer'),
(1, 'Mentora incrível!', 'Me fez entender que para ser promovido eu precisava olhar para além das habilidades técnicas.', 'Rafa Oliveira', 'Dev Ops'),
(1, 'Os melhores conselhos', 'Me ouviu quando eu precisava desabafar e me mostrou como superou uma situação parecida. Poder contar com quem já estsve no seu lugar não tem preço.', 'Renata da Silva', 'Assistente de RH'),
(2, 'Adorei a mentoria!', 'Me ajudou muito, não só no  que eu queria, mas no que eu precisava, dando incentivo para correr atrás dos meus objetivos e sonhos.', 'Joana Prado', 'Designer'),
(2, 'Melhor mentora', 'Depois da mentoria com ela, eu percebi o quanto posso ser capaz de chegar longe com a minha capacidade.', 'Carla Fernandes', 'Assistente de Marketing'),
(2, 'Me ajudou muito!', 'Eu não acreditei quando consegui ser promovida após  3 anos no mesmo emprego. Me fez acreditar em mim mesma e ampliou meus conhecimentos.', 'Roberta da Silva', 'Tech Recruiter'),
(3, 'Virou amigo', 'Contar com alguém que realmente te entende é outra coisa. Me deu dicas realmente práticas que ele mesmo usou. Nota 1000!', 'Wesley Martins', 'UX Writer'),
(3, 'Sabe muito', 'Aprendi com ele mais do que aprendi em vários cursos.', 'Paula Maria', 'UX Writer'),
(3, 'Me ajudou a reagir', 'Eu passei por episódios traumáticos logo quando comecei as mentorias com ele. A forma como ele me acolheu, me fez epnsar e me ajudou a reagir foi perfeita.', 'Jéssica Matos', 'UX Writer'),
(4, 'Grande ajuda!', 'Paulo me ajudou muito a confiar mais em mim e conseguir ser promovido na minha empresa!', 'José Lucas Silva', 'Product Manager'),
(4, 'Ele é incrível!', 'Seguir com essa mentoria foi a melhor decisão que eu tive e mudou a minha vida! Só tenho a agradecer o Paulo e dizer para todos: façam!', 'Marcos Daniel', 'Product owner'),
(4, 'Me ajudou muito!', 'Eu não acreditei quando consegui ser promovida após  3 anos no mesmo emprego. Me fez acreditar em mim mesma e ampliou meus conhecimentos.', 'Rodrigo Lombardi', 'Assistente de RH'),
(5, 'Perfeita.', 'Me passou tudo que eu precisava. Hoje sou UX Designer plena graças a ela.', 'Enzo Lucas Silva', 'UX Designer  pleno'),
(5, 'Um exemplo', 'Desde que começamos a metoria meu sonho é trabalhar com ela. Nunca erou.', 'Eloá Pimentel', 'Product owner'),
(5, 'Me entende e me ensina', 'Eu não acreditei quando consegui ser promovida após  3 anos no mesmo emprego. Me fez acreditar em mim mesma e ampliou meus conhecimentos.', 'Aurora Terra', 'Assistente de RH'),
(6, 'Perfeita!', 'Me ajuda em absolutamente tudo. É um exemplo para mim.', 'Clara Wiemes', 'Growth'),
(6, 'Inspiração', 'Não tem outra palavra. Ela é inspiração. Ver seu sucesso e o modo como supera barreiras é inacreditável. Melhor, me faz acreditar que posso também.', 'Rogério Daniel', 'Growth'),
(6, 'As melhores conversas', 'Cada conversa é uma aula: de técnica e de vida. Quero ser o orgulho dela daqui a algum tempo quando for promovida.', 'Mariana Vands', 'Assistente de Marketing'),
(7, 'Meu exemplo', 'Ver alguém como eu na posição que ela ocupa é uma inspiração. Quero aprender ainda mais com elas.', 'Maicon Caio', 'Assistente de Marketing'),
(7, 'Ela é íncrivel!', 'Bendito momento que agendei minha primeira mentoria com ela. Recebi duas propostas de emprego depois de começar as sessões com ela.', 'Marlon Abreu', 'Social media'),
(7, 'Inspiradora', 'Mudei de mentalidade depois de conhecê-la e isso já me trouxe frutos positiovos. Quero para sempre.', 'Gilberto Lombardi', 'Analista de ações online'),
(8, 'Experiência sem fim.', 'Parece que tem o dobro de idade pela experiência que tem. Cada encontro é uma aula e uma conversa entre amigos ao mesmo tempo.', 'Samuel Carlos', 'Product designer'),
(8, 'Ele é demais!', 'Depois de iniciar as mentorias com ele, me sinto mais confiante e mais capaz. Já assumi projetos que não faria sem ele por perto.', 'Daniela Santos', 'UI/UX Design jr'),
(8, 'Uma ajuda impagável', 'Nunca tinha feito uma mentoria antes e ele me fez perceber o quanto estava perdendo. Obrigado, Marcus.', 'Janaina Rocha', 'UX Research'),
(9, 'Inspiração', 'Jasmine é um profissional incrível e eu nem acredito que converso com ela toda semana. Cada frase dela é um ensinamento.', 'Maria José Leal', 'Dev iOS Jr'),
(9, 'Ela é sem igual', 'A Jasmine é uma profissional e uma pessoa que inspira e ensina. Cada mentoria ela prepara uma atividade de autodesenvolvimento.', 'Marina Monteiro', 'Dev front end Jr'),
(9, 'A melhor mentora', 'Saber o quanto inspira e influencia a faz ser ainda mais perfeita. Todas as seções de mentoria são momentos que levo para a vida.', 'Talita Medeiros', 'Dev back end Jr');
