-- SCRIPT SQL DI CREAZIONE DEL DATABASE DI ESEMPIO 
create table utenti(
	idUtente INT not null PRIMARY KEY,
	cognome VARCHAR(255),
	nome VARCHAR(255),
	codiceFiscale VARCHAR(32),
	partitaIva VARCHAR(32), 
	mail VARCHAR(128),
	indirizzo VARCHAR(128),
	cap VARCHAR(16),
	citta VARCHAR(256),
	provincia VARCHAR(2),
	nazione VARCHAR(64),
	telefono VARCHAR(32),
	username VARCHAR(64) not null,
	userPass VARCHAR(64) not null,
	privacy int not null default 0
);
create table indirizzi(
	idIndirizzo INT not null PRIMARY KEY,
	idUtente INT not null,
	cognome VARCHAR(255),
	nome VARCHAR(255),
	tipo INT not null default 0,
	indirizzo VARCHAR(128),
	cap VARCHAR(16),
	citta VARCHAR(256),
	provincia VARCHAR(2),
	nazione VARCHAR(64),
	telefono VARCHAR(32)
);
create table prodotti(
	idProdotto INT not null PRIMARY KEY,
	titolo VARCHAR(1024),
	sottotitolo VARCHAR(1024),
	descrizione text,
	prezzo numeric(15,2) not null default 0.0,
	aliquota numeric (10,2) not null default 0.0,
	nomeFile VARCHAR(255)
);
create table carrelli(
	idCarrello INT not null PRIMARY KEY,
	idUtente INT not null default 0,
	created date,
	status int not null default 0
);
create table carrelloDettagli(
	idCarrelloDettagli INT not null PRIMARY KEY,
	idCarrello INT not null,
	idProdotto INT not null,
	quantita numeric (10,2) not null,
	prezzo numeric(15,2) not null default 0.0,
	aliquota numeric(10,2) not null default 0.0
);
create table ordini(
	idOrdine INT not null PRIMARY KEY,
	idUtente INT not null,
	dataOrdine date,
	statoOrdine INT not null default 0,
	idIndirizzoFatturazione INT not null default 0,
	idIndirizzoSpedizione INT not null default 0,
	dataSpedizione date
);
create table ordiniDettagli(
	idDettaglio INT not null PRIMARY KEY,
	idOrdine INT not null,
	idProdotto INT not null,
	quantita numeric (10,2) not null,
	prezzo numeric(15,2) not null default 0.0,
	aliquota numeric(10,2) not null default 0.0
);

-- PRODOTTI
insert into prodotti(idprodotto, titolo, descrizione, prezzo, aliquota, sottotitolo,nomeFile) VALUES (8006,'Architecting Modern Java EE Applications','Sebastian Daschner is a Java freelancer working as a consultant and trainer and is enthusiastic about programming and Java (EE). He participates in the JCP, helping to form future Java EE standards, serving in the JSR 370 and 374 Expert Groups, and collaborating on various open source projects. For his contributions to the Java community and ecosystem, he was recognized with the titles Java Champion and Oracle Developer Champion.\r\n\r\nSebastian is a regular speaker at international IT conferences, such as JavaLand, JavaOne, and Jfokus. He won the JavaOne Rockstar award at JavaOne 2016. Together with Java community manager, Steve Chin, he has traveled to dozens of conferences and Java User Groups on motorbike. Steve and Sebastian have launched JOnsen, a Java unconference held at a hot spring in the countryside of Japan.',49.50,10.00,'Designing lightweight, business-oriented enterprise applications in the age of cloud, containers, and Java EE 8','prod006.png');
insert into prodotti(idprodotto, titolo, descrizione, prezzo, aliquota, sottotitolo,nomeFile) VALUES (8003,'Thinking in Java.','',35.00,10.00,'Fondamenti','prod003.png');
insert into prodotti(idprodotto, titolo, descrizione, prezzo, aliquota, sottotitolo,nomeFile) VALUES (8004,'Introducing Jakarta EE CDI','Discover the Jakarta EE Contexts and Dependency Injection (CDI 2.0) framework which helps you write better code through the use of well-defined enterprise Java-based components and beans (EJBs). If you have ever wanted to write clean Java EE code, this short book is your best guide for doing so: you will pick up valuable tips along the way from your author''s years of experience teaching and coding. Introducing Jakarta EE CDI covers CDI 2.0 in detail and equips you with the theoretical underpinnings of Java EE, now Jakarta EE.\r\n\r\nThis book is packed with so much that by the end of it, you will feel confident to use your new-found knowledge to help you write better, readable, maintainable, and long-lived mission-critical software.\r\nWhat You Will Learn\r\n\r\nWrite better code with the Jakarta EE Contexts and Dependency Injection (CDI) framework\r\nWork with the powerful, extensible, and well-defined contextual life cycle for components\r\nUse CDI''s mechanism for decoupling application components through a typesafe event API\r\nBuild typesafe interceptors for altering the behaviour of components at runtime\r\nHarness the well-defined qualifier system for easy isolation of beans\r\nConvert almost any valid Java type to a CDI managed bean with CDI''s producer mechanism\r\nWho This Book Is For\r\n\r\nExperienced enterprise Java, Java EE, or J2EE developers who may be new to CDI or dependency injection',29.00,10.00,'Contexts and Dependency Injection for Enterprise Java Development','prod004.png');
insert into prodotti(idprodotto, titolo, descrizione, prezzo, aliquota, sottotitolo,nomeFile) VALUES (8005,'Practical Domain-Driven Design in Enterprise Java','Practical Domain-Driven Design in Enterprise Java starts by building out the Cargo Tracker reference application as a monolithic application using the Jakarta EE platform. By doing so, you will map concepts of DDD (bounded contexts, language, and aggregates) to the corresponding available tools (CDI, JAX-RS, and JPA) within the Jakarta EE platform. \r\n\r\nOnce you have completed the monolithic application, you will walk through the complete conversion of the monolith to a microservices-based architecture, again mapping the concepts of DDD and the corresponding available tools within the MicroProfile platform (config, discovery, and fault tolerance). To finish this section, you will examine the same microservices architecture on the Spring Boot platform. \r\n\r\nThe final set of chapters looks at what the application would be like if you used the CQRS and event sourcing patterns. Here you''ll use the Axon framework as the base framework.',30.50,10.00,'Using Jakarta EE, Eclipse MicroProfile, Spring Boot, and the Axon Framework','prod005.png');
insert into prodotti(idprodotto, titolo, descrizione, prezzo, aliquota, sottotitolo,nomeFile) VALUES (8001,'Beginning Jakarta EE Web Development', 'Comprehensive and example-driven, this book is all you need to develop dynamic Java-based web applications using JSP, connect to databases with JSF, and put them into action using the popular open source Java web server, Apache Tomcat.\r\nBeginning Jakarta EE Web Development is a comprehensive introduction to building Java-based web applications using JSP, JSF, MySQL, and the Apache Tomcat web application server. Other APIs including JSON, JSTL, and XML parser are covered along the way.\r\nKey concepts are made easy to grasp with numerous working examples and a walk-through of the development of a complete ecommerce project. This book is written for professionals by practicing Java web application professionals and experts.\r\nWhat You Will Learn\r\n- Build Java-based web applications using JSP and JSF with Eclipse Jakarta EE\r\n- Configure your database with MySQL\r\n- Define XML documents for your applications\r\n- Use the Apache MyFaces APIs to create JSF applications\r\n- Integrate and implement JSF and JSP together\r\n- Build an online ecommerce web application',39.50,10.00,'Using JSP, JSF, MySQL, and Apache Tomcat for Building Java Web Applications','prod001.png');
insert into prodotti(idprodotto, titolo, descrizione, prezzo, aliquota, sottotitolo,nomeFile) VALUES (8002,'Hands-On Cloud-Native Microservices with Jakarta EE','Luigi Fugaro''s first encounter with computers was in the early 80s when he was a kid. He started with a Commodore Vic-20, passing through a Sinclair, a Commodore 64, and an Atari ST 1040, where he spent days and nights giving breath mints to Otis. In 1998, he started his career as a webmaster doing HTML, JavaScript, Applets, and some graphics with Paint Shop Pro. He then switched to Delphi, Visual Basic, and then started working on Java projects. He has been developing all kinds of web applications, dealing with backend and frontend frameworks. In 2012, he started working for Red Hat and is now an architect in the EMEA Middleware team.\r\n\r\nHe has authored WildFly Cookbook and Mastering JBoss Enterprise Application Platform 7 by Packt Publishing.\r\n\r\nMauro Vocale was born on March 25, 1980 in Venaria Reale, Italy. He started to work in Java and Linux OS in 2001. He is a passionate open source developer, and he is excited to be working for a company like Red Hat as a middleware consultant since November 2015. He is a Certified Oracle Master Java SE 6 Developer, Oracle EJB, and Web Component Developer for JEE 6 and JBoss EAP 7 administration.\r\n\r\nAs a consultant, he has the opportunity to implement enterprise applications in many different scenarios and, like many IT people, he takes big enterprise companies through the journey of digital transformation and microservices adoption.He was the official reviewer of Mastering JBoss Enterprise Application Platform 7, published by Packt Publishing.',41.50,10.00,'Build scalable and reactive microservices with Docker, Kubernetes, and OpenShift','prod002.png');

