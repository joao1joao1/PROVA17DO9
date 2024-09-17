DROP DATABASE IF EXISTS db_rh_exam;
CREATE DATABASE db_rh_exam;
use db_rh_exam;

CREATE TABLE departamentos (
    departamento_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    localizacao VARCHAR(100)
);

CREATE TABLE funcionarios (
    funcionario_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    cargo VARCHAR(100),
    salario DECIMAL(10, 2),
    data_admissao DATE,
    departamento_id INT,
    FOREIGN KEY (departamento_id) REFERENCES departamentos(departamento_id)
);

CREATE TABLE folha_pagamento (
    pagamento_id INT AUTO_INCREMENT PRIMARY KEY,
    funcionario_id INT NOT NULL,
    data_pagamento DATE,
    salario_bruto DECIMAL(10, 2),
    descontos DECIMAL(10, 2),
    salario_liquido DECIMAL(10, 2),
    FOREIGN KEY (funcionario_id) REFERENCES funcionarios(funcionario_id)
);

CREATE TABLE avaliacoes_desempenho (
    avaliacao_id INT AUTO_INCREMENT PRIMARY KEY,
    funcionario_id INT NOT NULL,
    data_avaliacao DATE,
    nota DECIMAL(4, 2),
    comentarios TEXT,
    FOREIGN KEY (funcionario_id) REFERENCES funcionarios(funcionario_id)
);

-- Inserindo departamentos
INSERT INTO departamentos (nome, localizacao) VALUES
('Vendas', 'São Paulo'),
('TI', 'Rio de Janeiro'),
('Recursos Humanos', 'Curitiba'),
('Marketing', 'São Paulo'),
('Financeiro', 'Rio de Janeiro');

-- Inserindo funcionários
INSERT INTO funcionarios (nome, data_nascimento, cargo, salario, data_admissao, departamento_id) VALUES
('Ana Lima', '1985-01-15', 'Gerente de Vendas', 8000.00, '2015-06-01', 1),
('Carlos Silva', '1990-03-22', 'Desenvolvedor', 5000.00, '2018-07-01', 2),
('Fernanda Souza', '1988-04-30', 'Analista de RH', 4500.00, '2017-08-01', 3),
('Bruno Martins', '1975-05-10', 'Analista de Marketing', 4000.00, '2020-05-15', 4),
('Juliana Oliveira', '1982-09-12', 'Contadora', 6000.00, '2016-09-20', 5),
('Pedro Costa', '1995-12-03', 'Auxiliar Administrativo', 2500.00, '2021-03-15', NULL),
('Mariana Ribeiro', '1991-11-25', 'Coordenadora de Vendas', 7000.00, '2014-12-10', 1),
('Tiago Pereira', '1994-06-17', 'Analista de Suporte', 3500.00, '2019-11-05', 2),
('Ricardo Mendes', '1980-02-01', 'Gerente de TI', 9000.00, '2012-01-01', 2),
('Laura Santos', '1987-07-07', 'Especialista em RH', 5500.00, '2018-10-30', 3);

-- Inserindo folha de pagamento
INSERT INTO folha_pagamento (funcionario_id, data_pagamento, salario_bruto, descontos, salario_liquido) VALUES
(1, '2023-08-31', 8000.00, 500.00, 7500.00),
(2, '2023-08-31', 5000.00, 300.00, 4700.00),
(3, '2023-08-31', 4500.00, 200.00, 4300.00),
(4, '2023-08-31', 4000.00, 250.00, 3750.00),
(5, '2023-08-31', 6000.00, 400.00, 5600.00),
(6, '2023-08-31', 2500.00, 100.00, 2400.00),
(7, '2023-08-31', 7000.00, 350.00, 6650.00),
(8, '2023-08-31', 3500.00, 150.00, 3350.00),
(9, '2023-08-31', 9000.00, 600.00, 8400.00),
(10, '2023-08-31', 5500.00, 300.00, 5200.00);

-- Inserindo avaliações de desempenho
INSERT INTO avaliacoes_desempenho (funcionario_id, data_avaliacao, nota, comentarios) VALUES
(1, '2023-06-15', 4.5, 'Ótimo desempenho nas vendas do trimestre'),
(2, '2023-06-15', 3.8, 'Desempenho regular, precisa melhorar na comunicação'),
(3, '2023-06-15', 4.2, 'Desempenho acima da média, excelente trabalho em equipe'),
(4, '2023-06-15', 4.0, 'Bom trabalho em campanhas de marketing'),
(5, '2023-06-15', 3.9, 'Cumpriu as metas financeiras do trimestre'),
(6, '2023-06-15', 4.1, 'Desempenho adequado nas tarefas administrativas'),
(7, '2023-06-15', 4.6, 'Alto desempenho nas metas de vendas'),
(8, '2023-06-15', 3.7, 'Desempenho satisfatório no suporte técnico'),
(9, '2023-06-15', 4.8, 'Líder eficiente na área de TI'),
(10, '2023-06-15', 4.3, 'Ótimo desempenho no desenvolvimento de projetos de RH');


DROP DATABASE IF EXISTS db_mkt_exam;
CREATE DATABASE db_mkt_exam;
USE db_mkt_exam;
CREATE TABLE campanhas_marketing (
    campanha_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_inicio DATE,
    data_fim DATE,
    orcamento DECIMAL(10, 2)
);

CREATE TABLE canais_marketing (
    canal_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE campanhas_canais (
    campanha_canal_id INT AUTO_INCREMENT PRIMARY KEY,
    campanha_id INT NOT NULL,
    canal_id INT NOT NULL,
    gastos DECIMAL(10, 2),
    FOREIGN KEY (campanha_id) REFERENCES campanhas_marketing(campanha_id),
    FOREIGN KEY (canal_id) REFERENCES canais_marketing(canal_id)
);

CREATE TABLE interacoes_marketing (
    interacao_id INT AUTO_INCREMENT PRIMARY KEY,
    campanha_id INT NOT NULL,
    data_interacao DATE,
    tipo VARCHAR(50),
    metrica VARCHAR(100),
    valor INT,
    FOREIGN KEY (campanha_id) REFERENCES campanhas_marketing(campanha_id)
);

-- Inserindo campanhas de marketing
INSERT INTO campanhas_marketing (nome, data_inicio, data_fim, orcamento) VALUES
('Campanha Verão', '2024-01-01', '2024-03-31', 10000.00),
('Campanha Inverno', '2024-06-01', '2024-08-31', 8000.00),
('Campanha Black Friday', '2024-11-01', '2024-11-30', 15000.00),
('Campanha Natal', '2024-12-01', '2024-12-31', 12000.00),
('Campanha Dia das Mães', '2024-05-01', '2024-05-31', 7000.00),
('Campanha Dia dos Pais', '2024-08-01', '2024-08-31', 7000.00),
('Campanha Páscoa', '2024-04-01', '2024-04-30', 5000.00),
('Campanha Halloween', '2024-10-01', '2024-10-31', 9000.00),
('Campanha Aniversário', '2024-09-01', '2024-09-30', 6000.00),
('Campanha de Lançamento', '2024-02-01', '2024-02-28', 11000.00);

-- Inserindo canais de marketing
INSERT INTO canais_marketing (nome) VALUES
('Facebook'),
('Instagram'),
('Google Ads'),
('LinkedIn'),
('Twitter'),
('YouTube'),
('TikTok'),
('Pinterest'),
('Email Marketing'),
('Display Ads');

-- Inserindo campanhas e canais
INSERT INTO campanhas_canais (campanha_id, canal_id, gastos) VALUES
(1, 1, 3000.00),
(1, 2, 2000.00),
(1, 3, 5000.00),
(2, 1, 1500.00),
(2, 4, 2500.00),
(2, 5, 4000.00),
(3, 2, 7000.00),
(3, 3, 8000.00),
(4, 6, 5000.00),
(4, 7, 7000.00);

-- Inserindo interações de marketing
INSERT INTO interacoes_marketing (campanha_id, data_interacao, tipo, metrica, valor) VALUES
(1, '2024-01-15', 'Impressão', 'Visualizações', 10000),
(1, '2024-02-01', 'Clique', 'Cliques', 500),
(1, '2024-02-15', 'Conversão', 'Vendas', 50),
(2, '2024-06-05', 'Impressão', 'Visualizações', 8000),
(2, '2024-06-10', 'Clique', 'Cliques', 400),
(2, '2024-06-25', 'Conversão', 'Vendas', 35),
(3, '2024-11-01', 'Impressão', 'Visualizações', 20000),
(3, '2024-11-10', 'Clique', 'Cliques', 1000),
(3, '2024-11-20', 'Conversão', 'Vendas', 150),
(4, '2024-12-01', 'Impressão', 'Visualizações', 12000);

DROP DATABASE IF EXISTS db_acad_exam;
CREATE DATABASE db_acad_exam;
USE db_acad_exam;
CREATE TABLE cursos (
    curso_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    duracao INT
);

CREATE TABLE estudantes (
    estudante_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    matricula VARCHAR(20) UNIQUE,
    curso_id INT,
    FOREIGN KEY (curso_id) REFERENCES cursos(curso_id)
);

CREATE TABLE professores (
    professor_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    departamento VARCHAR(100)
);

CREATE TABLE disciplinas (
    disciplina_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    curso_id INT,
    professor_id INT,
    FOREIGN KEY (curso_id) REFERENCES cursos(curso_id),
    FOREIGN KEY (professor_id) REFERENCES professores(professor_id)
);

CREATE TABLE matriculas (
    matricula_id INT AUTO_INCREMENT PRIMARY KEY,
    estudante_id INT NOT NULL,
    disciplina_id INT NOT NULL,
    data_matricula DATE,
    FOREIGN KEY (estudante_id) REFERENCES estudantes(estudante_id),
    FOREIGN KEY (disciplina_id) REFERENCES disciplinas(disciplina_id)
);

-- Inserindo cursos
INSERT INTO cursos (nome, descricao, duracao) VALUES
('Engenharia de Software', 'Curso de Engenharia de Software com foco em desenvolvimento de sistemas', 8),
('Administração', 'Curso de Administração voltado para gestão empresarial', 8),
('Direito', 'Curso de Direito com ênfase em direito civil e penal', 10),
('Medicina', 'Curso de Medicina com foco em práticas clínicas e cirúrgicas', 12),
('Ciências Contábeis', 'Curso de Ciências Contábeis com foco em contabilidade financeira e auditoria', 8);

-- Inserindo professores
INSERT INTO professores (nome, departamento) VALUES
('Dr. João Silva', 'Engenharia de Software'),
('Dr. Maria Oliveira', 'Administração'),
('Dr. Carlos Souza', 'Direito'),
('Dra. Ana Mendes', 'Medicina'),
('Dr. Ricardo Lima', 'Ciências Contábeis');

-- Inserindo disciplinas
INSERT INTO disciplinas (nome, curso_id, professor_id) VALUES
('Programação Web', 1, 1),
('Algoritmos e Estruturas de Dados', 1, 1),
('Gestão de Empresas', 2, 2),
('Direito Civil', 3, 3),
('Procedimentos Cirúrgicos', 4, 4),
('Contabilidade Financeira', 5, 5),
('Banco de Dados', 1, 1),
('Gestão Financeira', 2, 2),
('Direito Penal', 3, 3),
('Terapias Intensivas', 4, 4);

-- Inserindo estudantes
INSERT INTO estudantes (nome, data_nascimento, matricula, curso_id) VALUES
('Lucas Andrade', '1995-03-10', '2024001', 1),
('Fernanda Costa', '1997-05-21', '2024002', 2),
('João Pereira', '1996-07-12', '2024003', 3),
('Mariana Alves', '1994-09-15', '2024004', 4),
('Ricardo Santos', '1993-11-30', '2024005', 5),
('Ana Beatriz', '1998-01-02', '2024006', 1),
('Bruno Rocha', '1995-02-18', '2024007', 2),
('Sofia Menezes', '1997-06-11', '2024008', 3),
('Gustavo Martins', '1994-08-25', '2024009', 4),
('Laura Rodrigues', '1996-04-05', '2024010', 5);

-- Inserindo matrículas
INSERT INTO matriculas (estudante_id, disciplina_id, data_matricula) VALUES
(1, 1, '2024-02-01'),
(1, 2, '2024-02-01'),
(2, 3, '2024-02-01'),
(3, 4, '2024-02-01'),
(4, 5, '2024-02-01'),
(5, 6, '2024-02-01'),
(6, 7, '2024-02-01'),
(7, 8, '2024-02-01'),
(8, 9, '2024-02-01'),
(9, 10, '2024-02-01');


DROP DATABASE IF EXISTS db_proj_exam;
CREATE DATABASE db_proj_exam;
USE db_proj_exam;

CREATE TABLE funcionarios (
    funcionario_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    cargo VARCHAR(100),
    salario DECIMAL(10, 2),
    data_admissao DATE
);

CREATE TABLE projetos (
    projeto_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    data_inicio DATE,
    data_fim DATE,
    orcamento DECIMAL(10, 2)
);

CREATE TABLE tarefas (
    tarefa_id INT AUTO_INCREMENT PRIMARY KEY,
    projeto_id INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    responsavel_id INT,
    data_inicio DATE,
    data_fim DATE,
    status VARCHAR(50),
    FOREIGN KEY (projeto_id) REFERENCES projetos(projeto_id),
    FOREIGN KEY (responsavel_id) REFERENCES funcionarios(funcionario_id)
);

CREATE TABLE alocacoes_recursos (
    alocacao_id INT AUTO_INCREMENT PRIMARY KEY,
    projeto_id INT NOT NULL,
    funcionario_id INT NOT NULL,
    horas_trabalhadas DECIMAL(5, 2),
    FOREIGN KEY (projeto_id) REFERENCES projetos(projeto_id),
    FOREIGN KEY (funcionario_id) REFERENCES funcionarios(funcionario_id)
);

-- Inserindo funcionários (necessário para as chaves estrangeiras em tarefas e alocacoes_recursos)
INSERT INTO funcionarios (nome, data_nascimento, cargo, salario, data_admissao) VALUES
('Ana Lima', '1985-01-15', 'Gerente de Projetos', 8500.00, '2015-06-01'),
('Carlos Silva', '1990-03-22', 'Desenvolvedor', 5000.00, '2018-07-01'),
('Fernanda Souza', '1988-04-30', 'Analista de Sistemas', 4500.00, '2017-08-01'),
('Bruno Martins', '1975-05-10', 'Analista de Marketing', 4000.00, '2020-05-15'),
('Juliana Oliveira', '1982-09-12', 'Especialista em Infraestrutura', 6000.00, '2016-09-20'),
('Pedro Costa', '1995-12-03', 'Analista de Negócios', 5500.00, '2021-03-15');

-- Inserindo projetos
INSERT INTO projetos (nome, descricao, data_inicio, data_fim, orcamento) VALUES
('Desenvolvimento de Software', 'Projeto de desenvolvimento de sistema web', '2024-01-01', '2024-06-30', 50000.00),
('Implementação de ERP', 'Projeto de implementação de sistema ERP', '2024-02-01', '2024-07-31', 75000.00),
('Campanha de Marketing', 'Projeto de campanha de marketing digital', '2024-03-01', '2024-08-31', 30000.00),
('Reestruturação de TI', 'Projeto de reestruturação de infraestrutura de TI', '2024-04-01', '2024-09-30', 60000.00),
('Expansão de Negócios', 'Projeto de expansão de mercado', '2024-05-01', '2024-10-31', 90000.00);

-- Inserindo tarefas
INSERT INTO tarefas (projeto_id, nome, descricao, responsavel_id, data_inicio, data_fim, status) VALUES
(1, 'Desenvolver Front-End', 'Criação da interface do sistema', 2, '2024-01-05', '2024-02-20', 'Em andamento'),
(1, 'Desenvolver Back-End', 'Desenvolvimento da API do sistema', 2, '2024-02-21', '2024-03-15', 'Aguardando'),
(2, 'Configurar Servidor', 'Configuração do servidor de ERP', 5, '2024-02-05', '2024-02-20', 'Concluída'),
(3, 'Elaborar Estratégia', 'Criação da estratégia de marketing', 4, '2024-03-05', '2024-03-25', 'Em andamento'),
(4, 'Comprar Equipamentos', 'Compra de novos servidores e roteadores', 5, '2024-04-05', '2024-04-30', 'Concluída'),
(5, 'Analisar Mercado', 'Análise de novos mercados potenciais', 6, '2024-05-05', '2024-06-15', 'Aguardando'),
(1, 'Testar Sistema', 'Testes funcionais e de integração', 2, '2024-03-16', '2024-04-30', 'Aguardando'),
(2, 'Treinar Usuários', 'Treinamento de equipe no ERP', 3, '2024-07-01', '2024-07-15', 'Aguardando'),
(3, 'Implementar Campanha', 'Execução da campanha de marketing', 4, '2024-04-01', '2024-06-30', 'Aguardando'),
(4, 'Configurar Rede', 'Instalação de novos equipamentos de rede', 5, '2024-05-01', '2024-05-20', 'Concluída');

-- Inserindo alocações de recursos
INSERT INTO alocacoes_recursos (projeto_id, funcionario_id, horas_trabalhadas) VALUES
(1, 2, 40.5),
(1, 2, 35.0),
(2, 5, 50.0),
(3, 4, 20.0),
(4, 5, 60.0),
(5, 6, 45.0),
(1, 2, 25.0),
(2, 3, 30.0),
(3, 4, 40.0),
(4, 5, 50.0);
