PRAGMA	foreign_keys = ON;

-- VALUES for Restaurant
INSERT INTO Restaurant VALUES (1, 252768343, "Alegria", "Rua das Águas, 039, Porto");
INSERT INTO Restaurant VALUES (2, 252128563, "Luxúria", "Praça do Monte, 1724, Lisboa");
INSERT INTO Restaurant VALUES (3, 252937233, "Paixão", "Rua do Mar, 663, Albufeira");
INSERT INTO Restaurant VALUES (4, 252978789, "Epifania","Praça Cristiano Ronaldo, 274, Funchal");

-- Values for Client
insert into Client values (234862398, "Joaquim Augusto", 252312321);
insert into Client values (239767398, "Joana Carneiro", 252312323);
insert into Client values (823457823, "Empresa Martins", 252312325);
insert into Client values (325012412, "Renato André", 252312326);
insert into Client values (498984834, "Bernardo Rajão", 252312327);
insert into Client values (123487472, "Jorge Novo", 252312328);
insert into Client values (120080234, "João Moita Nogueira", 252312329);
insert into Client values (234810001, "Laura Seabra", 254094231);
insert into Client values (983248888, "Sara Campos", 254094232);
insert into Client values (823471623, "Deolinda Sampaio", 254094233);
insert into Client values (873246102, "André Vilas-Boas", 254094234);
insert into Client values (234763472, "Empresa Farmacet", 254094235);
insert into Client values (663246232, "Sociedade Horta", 254094236);
insert into Client values (234332421, "Maria Augusta", 254094237);
insert into Client values (234801012, "João Mota", 254094238);
insert into Client values (984358393, "Filipe Mendanha", 254094239);
insert into Client values (734734321, "André Morim", 254094210);
insert into Client values (923408990, "Luís José", 254094211);
insert into Client values (234234000, "José Faria", 254094291);
insert into Client values (112123112, "Sociedade Euro-Milhões", 254094271);
insert into Client values (119828341, "Andrew Scott", 254094131);
insert into Client values (123923402, "Mathew Jones", 254094531);

-- Values for Tables
insert into RTable values (1, 1); 
insert into RTable values (2, 1); 
insert into RTable values (3, 1); 
insert into RTable values (4, 1); 
insert into RTable values (5, 1); 
insert into RTable values (6, 3); 
insert into RTable values (7, 2); 
insert into RTable values (8, 2); 
insert into RTable values (9, 2); 
insert into RTable values (10, 4); 
insert into RTable values (11, 4); 
insert into RTable values (12, 4); 
insert into RTable values (13, 4); 
insert into RTable values (14, 4); 
insert into RTable values (15, 4); 
insert into RTable values (16, 4); 
insert into RTable values (17, 4); 


-- Values for Reservations
insert into Reservation values (1, '21:15', 4, 1, 234862398, '2017-04-01');
insert into Reservation values (2, '20:00', 1, 2, 234234000, '2017-04-01');
insert into Reservation values (3, '22:15', 2, 1, 983248888, '2017-04-01');
insert into Reservation values (4, '13:15', 10, 3, 663246232, '2017-04-01');
insert into Reservation values (5, '14:30', 2, 4, 734734321, '2017-04-01');
insert into Reservation values (6, '13:45', 4, 4, 325012412, '2017-04-01');
insert into Reservation values (7, '19:45', 4, 3, 325012412, '2017-04-01');
insert into Reservation values (8, '19:55', 3, 4, 984358393, '2017-04-01');
insert into Reservation values (9, '21:20', 4, 1, 234763472, '2017-04-01');
insert into Reservation values (10, '22:00', 5, 4, 734734321, '2017-04-01');
insert into Reservation values (11, '20:00', 6, 1, 234234000, '2017-04-01');
insert into Reservation values (12, '12:30', 8, 1, 119828341, '2017-04-01');
insert into Reservation values (13, '22:00', 1, 2, 234763472, '2017-04-01');
insert into Reservation values (14, '12:00', 1, 1, 325012412, '2017-04-01');
insert into Reservation values (15, '21:15', 18, 4, 112123112, '2017-04-01');
insert into Reservation values (16, '20:45', 4, 3, 234862398, '2017-04-01');
insert into Reservation values (17, '20:40', 4, 2, 873246102, '2017-04-01');
insert into Reservation values (18, '12:50', 3, 2, 123923402, '2017-04-01');
insert into Reservation values (19, '13:15', 3, 2, 234862398, '2017-04-01');
insert into Reservation values (20, '12:30', 10, 3, 123923402, '2017-04-01');

-- Values for ReservedTable
insert into ReservedTable values (1, 10, 4);
insert into ReservedTable values (3, 1, 1);
insert into ReservedTable values (2, 2, 1);
insert into ReservedTable values (6, 5, 1);
insert into ReservedTable values (7, 6, 3);
insert into ReservedTable values (8, 8, 2);
insert into ReservedTable values (10, 12, 4);
insert into ReservedTable values (15, 13, 4);
insert into ReservedTable values (15, 14, 4);
insert into ReservedTable values (15, 16, 4);
insert into ReservedTable values (17, 3, 1);
insert into ReservedTable values (18, 4, 1);
insert into ReservedTable values (19, 9, 2);

-- Values for Restaurant Transactions
insert into RTransaction values (1, 80.45, '2017-02-17', '20:03', 823471623);
insert into RTransaction values (2, 115.23, '2017-02-21', '13:44', 823471623);
insert into RTransaction values (3, 93.12, '2017-02-27', '14:23', 112123112);
insert into RTransaction values (4, 156.99, '2017-02-27', '21:01', 923408990);
insert into RTransaction values (5, 387.46, '2017-03-01', '20:56', 823457823);
insert into RTransaction values (6, 48.20, '2017-03-01', '22:13', 123923402);
insert into RTransaction values (7, 84.34, '2017-03-04', '22:34', 120080234);
insert into RTransaction values (8, 193.86, '2017-03-05', '20:59', 234332421);
insert into RTransaction values (9, 183.23, '2017-03-07', '21:08', 984358393);
insert into RTransaction values (10, 95.08, '2017-03-07', '19:57', 325012412);
insert into RTransaction values (11, 94.12, '2017-03-07', '20:32', 123487472);
insert into RTransaction values (12, 12.50, '2017-03-08', '13:29', 112123112);
insert into RTransaction values (13, 284.85, '2017-03-09', '12:41', 663246232);
insert into RTransaction values (14, 342.34, '2017-03-15', '13:23', 119828341);
insert into RTransaction values (15, 193.12, '2017-03-19', '14:45', 823457823);
insert into RTransaction values (16, 34.12, '2017-03-20', '15:10', 234763472);
insert into RTransaction values (17, 12.50, '2017-03-21', '13:30', 325012412);
insert into RTransaction values (18, 110.00, '2017-03-24', '20:17', 873246102);
insert into RTransaction values (19, 64.28, '2017-03-24', '21:49', 234763472);
insert into RTransaction values (20, 25.00, '2017-03-28', '13:17', 823457823);
insert into RTransaction values (21, 12.50, '2017-03-30', '12:38', 983248888);
insert into RTransaction values (22, 85.23, '2017-03-31', '20:51', 498984834);


-- VALUES for Orders
INSERT INTO ROrder VALUES (1, '2017-03-01', '20:05', 1, 1, 234862398, 1);
INSERT INTO ROrder VALUES (2, '2017-03-02', '20:05', 1, 1, 234763472, 1);
INSERT INTO ROrder VALUES (3, '2017-03-03', '20:00', 1, 1, 923408990, 2);
INSERT INTO ROrder VALUES (4, '2017-03-04', '20:10', 1, 1, 234862398, 3);
INSERT INTO ROrder VALUES (5, '2017-03-10', '20:05', 2, 1, 234763472, 8);
INSERT INTO ROrder VALUES (6, '2017-03-11', '20:05', 1, 1, 234763472, 4);
INSERT INTO ROrder VALUES (7, '2017-03-12', '20:05', 2, 1, 923408990, 5);
INSERT INTO ROrder VALUES (8, '2017-03-12', '20:05', 3, 1, 234862398, 6);
INSERT INTO ROrder VALUES (9, '2017-03-12', '20:00', 4, 1, 923408990, 7);
INSERT INTO ROrder VALUES (10, '2017-03-12', '19:05', 5, 1, 234763472, 9);
INSERT INTO ROrder VALUES (11, '2017-03-12', '21:05', 7, 2, 234862398, 10);
INSERT INTO ROrder VALUES (12, '2017-03-26', '20:05', 8, 2, 234862398, 11);
INSERT INTO ROrder VALUES (13, '2017-03-27', '20:15', 9, 2, 923408990, 12);
INSERT INTO ROrder VALUES (14, '2017-04-01', '20:05', 13, 4, 234862398, 13);
INSERT INTO ROrder VALUES (15, '2017-04-01', '20:20', 12, 4, 234862398, 14);
INSERT INTO ROrder VALUES (16, '2017-04-01', '20:30', 15, 4, 234763472, 15);
INSERT INTO ROrder VALUES (17, '2017-04-01', '20:05', 14, 4, 923408990, 16);
INSERT INTO ROrder VALUES (18, '2017-04-02', '20:05', 16, 4, 234763472, 17);
INSERT INTO ROrder VALUES (19, '2017-04-02', '20:05', 15, 4, 234862398, 18);
INSERT INTO ROrder VALUES (20, '2017-04-02', '21:05', 13, 4, 234862398, 19);
INSERT INTO ROrder VALUES (21, '2017-04-04', '20:05', 13, 4, 234862398, 20);
INSERT INTO ROrder VALUES (22, '2017-04-04', '21:00', 13, 4, 234862398, 21);


-- Values for Staff
insert into Staff values (923482438, "Luna Amorim", 700, 938734274, 4);
insert into Staff values (872437823, "Pathrick Goyle", 550, 912382323, 2);
insert into Staff values (807238721, "Maria Coutinho", 800, 969347343, 4);
insert into Staff values (324231333, "Vinicius Nascimento", 500, 912377474, 4);
insert into Staff values (243419123, "José João", 250, 961238937, 1);
insert into Staff values (239824893, "Joana Lopes", 550, 938746912, 1);
insert into Staff values (544235355, "António Godinho", 550, 920034756, 4);
insert into Staff values (593772344, "Bran Sanderson", 600, 910234466, 3);
insert into Staff values (876236246, "Laura Semedo", 700, 924734437, 4);
insert into Staff values (626393332, "Ivan Popov", 700, 965734998, 1);
insert into Staff values (112324744, "Alyssa Ponte", 600, 912003234, 3);
insert into Staff values (193473647, "Jéssica Rosa", 800, 911137237, 2);
insert into Staff values (238924873, "Afonso João", 950, 966874656, 3);
insert into Staff values (443409892, "Ricardo Sobral", 500, 924747347, 2);
insert into Staff values (449398233, "Mário Xavier", 300, 939923666, 2);
insert into Staff values (404039081, "Arlindo Daniel", 600, 926343341, 1);
insert into Staff values (563657335, "Fernanda Lisa", 900, 912372312, 2);
insert into Staff values (628382377, "Roberto Maia", 600, 912838237, 4);
insert into Staff values (982374277, "Jacky Mao", 500, 920034839, 3);
insert into Staff values (716263623, "Wilson Born", 550, 968734734, 1);
insert into Staff values (130023818, "Maria Caiado", 600, 966126122, 2);
insert into Staff values (762461372, "Alexandra Gaio", 550, 930832981, 3);
insert into Staff values (720190488, "Antonia Westfallen", 800, 927823713, 3);
insert into Staff values (348237723, "Annelie Coco", 250, 938237128, 2);
insert into Staff values (238283843, "Susana Marques", 600, 968137112, 1);
insert into Staff values (329034834, "João Azevedo", 1200, 910028381, 1);

-- Values for Server
insert into Server values (872437823, 20);
insert into Server values (324231333, 5);
insert into Server values (243419123, 12);
insert into Server values (239824893, 24);
insert into Server values (544235355, 20);
insert into Server values (112324744, 20);
insert into Server values (443409892, 8);
insert into Server values (449398233, 18);
insert into Server values (982374277, 23);
insert into Server values (716263623, 2);
insert into Server values (762461372, 30);

-- Values for Chef
insert into Chef values (807238721, 0);
insert into Chef values (193473647, 0);
insert into Chef values (238924873, 1);
insert into Chef values (563657335, 1);
insert into Chef values (720190488, 0);
insert into Chef values (329034834, 2);

-- Values for Cook
insert into Cook values (923482438, 807238721);
insert into Cook values (593772344, 193473647);
insert into Cook values (876236246, 238924873);
insert into Cook values (404039081, 563657335);
insert into Cook values (628382377, 720190488);
insert into Cook values (130023818, 329034834);
insert into Cook values (238283843, 563657335);


-- Values for Beverage
insert into Beverage values (1, "Vinho Branco, Colheita 2007, Quinta Cerejeira", 14.00);
insert into Beverage values (2, "Vinho Tinto, Colheita 2000, Quinta Cerejeira", 36.00);
insert into Beverage values (3, "Vinho Rosê, Colheita 2012, Quinta Cerejeira", 8.50);
insert into Beverage values (4, "Vinho Branco, Colheita 1998, Quinta dos Lobos", 40.90);
insert into Beverage values (5, "Vinho Tinto, Colheita 20015, Quinta dos Lobos", 3.50);
insert into Beverage values (6, "Vinho Rosê, Colheita 2005, Quinta dos Lobos", 20.99);
insert into Beverage values (7, "Espumante, Colheita 2002, Quinta dos Lobos", 32.49);
insert into Beverage values (8, "Vinho do Porto, Colheita 2000, Quinta do Douro", 40.00);
insert into Beverage values (9, "Vinho do Porto, Colheita 2010, Quinta do Douro", 26.00);
insert into Beverage values (10, "Vinho do Porto, Colheita 2016, Quinta do Douro", 12.90);
insert into Beverage values (11, "Espumante, Colheita 2014, Quinta Alentejana", 15.99);
insert into Beverage values (12, "Sangria de Espumante", 18.00);
insert into Beverage values (13, "Licor Beirão, Ano 2010", 8.00);
insert into Beverage values (14, "Whiskey, Colheita 2008, James Bond", 8.00);
insert into Beverage values (15, "Whiskey, Colheita 1990, Jameson", 50.00);
insert into Beverage values (16, "Água das Pedras", 1.60);
insert into Beverage values (17, "SevenUp", 1.60);
insert into Beverage values (18, "Cerveja Artesanal", 2.50);
insert into Beverage values (19, "Água 1,5L", 1.30);
insert into Beverage values (20, "Ice Tea Limão", 1.80);
insert into Beverage values (21, "Coca-Cola", 1.80);

-- Values for Category
insert into Category values (1, "Pratos Quentes");
insert into Category values (2, "Pratos Frios");
insert into Category values (3, "Sobremesas");
insert into Category values (4, "Entradas");

-- Values for Dishes
insert into Dish values (1, "Medalhões de Pescada com Puré", "Medalhões de Pescada no forno, com cenourinhas e feijão verde", 18, 1, 807238721);
insert into Dish values (2, "Bacalhau com Natas", "Bacalhau com Natas feito no forno com puré batata e esparregado de espinafres", 24, 1, 329034834);
insert into Dish values (3, "Lombo Assado", "Lombo Assado com batata assada e legumes", 16.90, 1, 238924873);
insert into Dish values (4, "Vitela Assada", "Vitela com batata assada e arroz", 16.90, 1, 193473647);
insert into Dish values (5, "Bife do Vazio em Molho Pimenta", "Bife do Vazio marinado em molho pimenta, com batata frita e arroz", 22.50, 1, 193473647);
insert into Dish values (6, "Espetadas de Polvo", "Espetadas de polvo com batata murro e molho verde", 25.00, 2, 807238721);
insert into Dish values (7, "Folhado de Sapateira", "Sapateira envolta em massa folhada", 8.00, 4, 720190488);
insert into Dish values (8, "Folhado de Carne", "Folhado de Carne Mista com Batata frita e salada de couve roxa", 20.00, 1, 329034834);
insert into Dish values (9, "Maça Assada Moderna", "Maça Assada com Natas de Café", 7.50, 3, 807238721);
insert into Dish values (10, "Mousse de Chocolate Vermelha", "Mouse de Chocolate com Morangos Laminados", 6.50, 3, 563657335);
insert into Dish values (11, "Morcela de Tomate", "Salsicha de Morcela crocante com molho de tomate", 8.00, 4, 238924873);
insert into Dish values (12, "Pudim de Coco", "Pudim de Coco com molho de caramelo", 7.00, 3, 720190488);
insert into Dish values (13, "Medalhões de Porco", "Medalhões de Porco com molho de cebola e gratinado de batata", 21.00, 1, 563657335);
insert into Dish values (14, "Entrecosta Argentino", "Entrecosto de bife argentino com feijão preto e puré de maça", 30.00, 1, 238924873);
insert into Dish values (15, "Lombinho Doce", "Batatas com salsa criolla e alcaparras", 18.50, 1, 720190488);
insert into Dish values (16, "Entrecosta Argentino", "Lombinho de Porco assado lentamente com mel, acompanhado com puré de pêra", 30.00, 1, 329034834);
insert into Dish values (17, "Salada Rosada", "Salada de vagem com tartare de tomate", 8.50, 4, 563657335);
insert into Dish values (18, "Risoto de Cogumelos", "Risoto de Cogumelos assados com salsa e arroz", 19.00, 2, 193473647);

-- Values for Ingredients
insert into Ingredient values (1, "Pescada");
insert into Ingredient values (2, "Bacalhau");
insert into Ingredient values (3, "Lombo");
insert into Ingredient values (4, "Vitela");
insert into Ingredient values (5, "Pimenta");
insert into Ingredient values (6, "Bife do Vazio");
insert into Ingredient values (7, "Espinafres");
insert into Ingredient values (8, "Feijão Verde");
insert into Ingredient values (9, "Arroz");
insert into Ingredient values (10, "Batatas");
insert into Ingredient values (11, "Polvo");
insert into Ingredient values (12, "Salsa");
insert into Ingredient values (13, "Morcela");
insert into Ingredient values (14, "Coco");
insert into Ingredient values (15, "Caramelo");
insert into Ingredient values (16, "Ovo");
insert into Ingredient values (17, "Morangos");
insert into Ingredient values (18, "Cacau");
insert into Ingredient values (19, "Maça");
insert into Ingredient values (20, "Feijão Preto");
insert into Ingredient values (21, "alcaparras");
insert into Ingredient values (22, "mel");
insert into Ingredient values (23, "Pêra");
insert into Ingredient values (24, "Tomate");
insert into Ingredient values (25, "Cogumelos");
insert into Ingredient values (26, "Vagens");

-- Values for Contains
insert into Contains values (1, 3);
insert into Contains values (1, 16);
insert into Contains values (1, 24);
insert into Contains values (1, 25);
insert into Contains values (1, 9);
insert into Contains values (2, 2);
insert into Contains values (3, 3);
insert into Contains values (4, 4);
insert into Contains values (5, 6);
insert into Contains values (7, 7);
insert into Contains values (7, 8);
insert into Contains values (8, 9);
insert into Contains values (8, 23);
insert into Contains values (8, 26);
insert into Contains values (8, 4);
insert into Contains values (6, 4);
insert into Contains values (6, 5);
insert into Contains values (9, 4);
insert into Contains values (9, 23);
insert into Contains values (10, 24);
insert into Contains values (11, 14);
insert into Contains values (12, 14);
insert into Contains values (13, 25);
insert into Contains values (14, 6);
insert into Contains values (15, 16);
insert into Contains values (16, 13);
insert into Contains values (17, 13);
insert into Contains values (18, 12);
insert into Contains values (18, 15);
insert into Contains values (17, 2);


-- Values for Responsible
insert into Responsible values (1, 1, 872437823);
insert into Responsible values (2, 1, 872437823);
insert into Responsible values (3, 1, 872437823);
insert into Responsible values (4, 1, 716263623);
insert into Responsible values (5, 1, 716263623);
insert into Responsible values (6, 3, 762461372);
insert into Responsible values (7, 2, 762461372);
insert into Responsible values (8, 2, 762461372);
insert into Responsible values (9, 2, 243419123);
insert into Responsible values (10, 4, 243419123);
insert into Responsible values (11, 4, 243419123);


-- Values for OrderBeverage
insert into OrderBeverage values (1, 1);
insert into OrderBeverage values (4, 1);
insert into OrderBeverage values (3, 2);
insert into OrderBeverage values (3, 1);
insert into OrderBeverage values (3, 4);
insert into OrderBeverage values (5, 6);
insert into OrderBeverage values (4, 2);
insert into OrderBeverage values (10, 10);
insert into OrderBeverage values (11, 11);
insert into OrderBeverage values (14, 12);
insert into OrderBeverage values (15, 8);
insert into OrderBeverage values (20, 20);
insert into OrderBeverage values (19, 15);
insert into OrderBeverage values (18, 16);
insert into OrderBeverage values (17, 17);
insert into OrderBeverage values (16, 18);
insert into OrderBeverage values (15, 19);
insert into OrderBeverage values (14, 14);
insert into OrderBeverage values (13, 13);


-- Values for OrderDish
insert into OrderDish values (1, 1);
insert into OrderDish values (4, 1);
insert into OrderDish values (3, 2);
insert into OrderDish values (3, 1);
insert into OrderDish values (3, 4);
insert into OrderDish values (5, 6);
insert into OrderDish values (4, 2);
insert into OrderDish values (10, 10);
insert into OrderDish values (11, 11);
insert into OrderDish values (14, 12);
insert into OrderDish values (15, 8);
insert into OrderDish values (20, 18);
insert into OrderDish values (19, 15);
insert into OrderDish values (18, 16);
insert into OrderDish values (17, 17);
insert into OrderDish values (16, 18);
insert into OrderDish values (15, 1);
insert into OrderDish values (14, 14);
insert into OrderDish values (13, 13);

-- Values for Allergy
insert into Allergy values (234801012, 11);
insert into Allergy values (234801012, 12);
insert into Allergy values (234801012, 13);
insert into Allergy values (234801012, 14);
insert into Allergy values (234801012, 15);
insert into Allergy values (119828341, 12);
insert into Allergy values (734734321, 12);
insert into Allergy values (498984834, 12);
insert into Allergy values (498984834, 17);

-- Values for Specialty
insert into Specialty values (923482438, 1);
insert into Specialty values (923482438, 2);
insert into Specialty values (593772344, 3);
insert into Specialty values (876236246, 4);
insert into Specialty values (404039081, 1);
insert into Specialty values (628382377, 2);
insert into Specialty values (130023818, 3);
insert into Specialty values (628382377, 4);
insert into Specialty values (130023818, 1);
insert into Specialty values (238283843, 2);
insert into Specialty values (238283843, 3);