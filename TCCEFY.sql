USE [master]
GO
/****** Object:  Database [TCCEFYT]    Script Date: 24.11.2014 12:03:44 ******/
CREATE DATABASE [TCCEFYT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TCCEFYT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TCCEFYT.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TCCEFYT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TCCEFYT_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TCCEFYT] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TCCEFYT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TCCEFYT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TCCEFYT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TCCEFYT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TCCEFYT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TCCEFYT] SET ARITHABORT OFF 
GO
ALTER DATABASE [TCCEFYT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TCCEFYT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TCCEFYT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TCCEFYT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TCCEFYT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TCCEFYT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TCCEFYT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TCCEFYT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TCCEFYT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TCCEFYT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TCCEFYT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TCCEFYT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TCCEFYT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TCCEFYT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TCCEFYT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TCCEFYT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TCCEFYT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TCCEFYT] SET RECOVERY FULL 
GO
ALTER DATABASE [TCCEFYT] SET  MULTI_USER 
GO
ALTER DATABASE [TCCEFYT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TCCEFYT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TCCEFYT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TCCEFYT] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TCCEFYT] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TCCEFYT', N'ON'
GO
USE [TCCEFYT]
GO
/****** Object:  Table [dbo].[booking]    Script Date: 24.11.2014 12:03:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[booking](
	[id_booking] [int] IDENTITY(1,1) NOT NULL,
	[date_time] [datetime] NOT NULL,
	[fk_court] [int] NOT NULL,
	[fk_person_booker] [int] NOT NULL,
	[fk_person_invited] [int] NOT NULL,
	[guest] [nvarchar](50) NULL,
 CONSTRAINT [PK_booking] PRIMARY KEY CLUSTERED 
(
	[id_booking] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[court]    Script Date: 24.11.2014 12:03:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[court](
	[id_court] [int] IDENTITY(1,1) NOT NULL,
	[number] [int] NOT NULL,
 CONSTRAINT [PK_court] PRIMARY KEY CLUSTERED 
(
	[id_court] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[group]    Script Date: 24.11.2014 12:03:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[group](
	[id_group] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_group] PRIMARY KEY CLUSTERED 
(
	[id_group] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[group_has_person]    Script Date: 24.11.2014 12:03:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[group_has_person](
	[fk_person] [int] NOT NULL,
	[fk_group] [int] NOT NULL,
 CONSTRAINT [PK_group_has_person] PRIMARY KEY CLUSTERED 
(
	[fk_person] ASC,
	[fk_group] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[person]    Script Date: 24.11.2014 12:03:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[person](
	[id_person] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [nvarchar](50) NOT NULL,
	[lastname] [nvarchar](50) NOT NULL,
	[username] [nvarchar](50) NULL,
	[password] [nchar](128) NULL,
	[email] [nvarchar](150) NOT NULL,
	[date_of_birth] [datetime2](7) NULL,
 CONSTRAINT [PK_person] PRIMARY KEY CLUSTERED 
(
	[id_person] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[booking]  WITH CHECK ADD  CONSTRAINT [FK_booking_court] FOREIGN KEY([fk_court])
REFERENCES [dbo].[court] ([id_court])
GO
ALTER TABLE [dbo].[booking] CHECK CONSTRAINT [FK_booking_court]
GO
ALTER TABLE [dbo].[booking]  WITH CHECK ADD  CONSTRAINT [FK_booking_person] FOREIGN KEY([fk_person_booker])
REFERENCES [dbo].[person] ([id_person])
GO
ALTER TABLE [dbo].[booking] CHECK CONSTRAINT [FK_booking_person]
GO
ALTER TABLE [dbo].[booking]  WITH CHECK ADD  CONSTRAINT [FK_booking_person1] FOREIGN KEY([fk_person_invited])
REFERENCES [dbo].[person] ([id_person])
GO
ALTER TABLE [dbo].[booking] CHECK CONSTRAINT [FK_booking_person1]
GO
ALTER TABLE [dbo].[group_has_person]  WITH CHECK ADD  CONSTRAINT [FK_group_has_person_group] FOREIGN KEY([fk_group])
REFERENCES [dbo].[group] ([id_group])
GO
ALTER TABLE [dbo].[group_has_person] CHECK CONSTRAINT [FK_group_has_person_group]
GO
ALTER TABLE [dbo].[group_has_person]  WITH CHECK ADD  CONSTRAINT [FK_group_has_person_person] FOREIGN KEY([fk_person])
REFERENCES [dbo].[person] ([id_person])
GO
ALTER TABLE [dbo].[group_has_person] CHECK CONSTRAINT [FK_group_has_person_person]
GO

USE [TCCEFYT]


---------------------------------------
--   FILLING TABLE 'person'
---------------------------------------
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Cheryl', 'Fowler', 'cfowler0', '1MRPWU24QjNVNPUT8x3bpWo23dYKkjfexb', 'cfowler0@timesonline.co.uk', '1986-12-19 01:05:44');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Emily', 'Hamilton', 'ehamilton1', '16wYceifBGzyjTUaxREZbMBcw3ASQYVMEp', 'ehamilton1@guardian.co.uk', '1982-01-12 20:33:06');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Sharon', 'Harris', 'sharris2', '1GX7jGnK43njbDsokRDNDzHU9UWcYq82Cn', 'sharris2@un.org', '1985-10-29 20:27:23');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Sarah', 'Henry', 'shenry3', '1BhTbvRpzWnVeJAuj9hWggrDuiKK5T3NRY', 'shenry3@china.com.cn', '1979-10-11 01:58:42');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Rose', 'Taylor', 'rtaylor4', '1FCCNMRqZz4XfR932ovdc8pQxA4veWRtH9', 'rtaylor4@wiley.com', '1981-08-18 06:48:35');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Christine', 'Patterson', 'cpatterson5', '1GQy5uCKAeGGUPXUKGM2tP4PoGUVqzLSFC', 'cpatterson5@altervista.org', '1977-11-15 12:40:45');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Kathy', 'Hansen', 'khansen6', '13xyRZ1Q56nHeCcEmhr25kMYg6b4h6hsg1', 'khansen6@dagondesign.com', '1988-09-17 00:26:54');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Joan', 'Reid', 'jreid7', '1RX1A5mgDCqtnerqrCaw4afYK58MJ6ZPL', 'jreid7@surveymonkey.com', '1999-05-16 00:10:12');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Lisa', 'Carpenter', 'lcarpenter8', '1LFLUW3yw4AWj1x54jpJYuBsgmNVS1bGzC', 'lcarpenter8@google.es', '1988-07-19 18:22:17');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Louise', 'Harper', 'lharper9', '1AEmRiVu6RGR6eBHFpcNZKUeRkQ49wfwK6', 'lharper9@illinois.edu', '1974-05-07 01:44:10');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Rose', 'Alvarez', 'ralvareza', '1GJ6xgWXgd4o1tiNaijfVPPyTxZ6aeDfiS', 'ralvareza@linkedin.com', '1980-10-03 05:01:03');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Marie', 'Adams', 'madamsb', '1KPwXtomhp4BRS7uTA2rQd9QJg9kwY7MWJ', 'madamsb@amazon.co.uk', '1991-09-25 04:27:17');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Gloria', 'Garza', 'ggarzac', '1CdARXcxhyFBVEyD6ojcHEHyMJsAQyuPkv', 'ggarzac@eventbrite.com', '1981-03-14 17:25:22');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Melissa', 'Elliott', 'melliottd', '1LMn9fno5Wjds3AfdjKSWzFquR8S8BMmSq', 'melliottd@buzzfeed.com', '1997-09-04 22:30:10');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Betty', 'Lewis', 'blewise', '1ATsEARq47Et4wToD6yEEyesSDLevY2p4w', 'blewise@guardian.co.uk', '1994-03-19 05:31:28');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Heather', 'Greene', 'hgreenef', '1BJGXZxwWBarWhGZMsFHoSoz5XciRksrVs', 'hgreenef@istockphoto.com', '1991-04-28 15:56:42');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Diana', 'Gonzalez', 'dgonzalezg', '1BKeCzsEJJcjpgoZvwLBaRw9FwZmtQqEGV', 'dgonzalezg@miibeian.gov.cn', '1995-12-26 12:55:15');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Julia', 'Ortiz', 'jortizh', '1Hv7KodjEegDUmDrSJWd88zTF1JVkTXMkd', 'jortizh@dagondesign.com', '1990-03-03 09:24:29');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Judy', 'Ross', 'jrossi', '16ujP71g4CPomVxB8D3YkWK8qpdKcyp1qE', 'jrossi@blinklist.com', '1978-03-20 00:36:27');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Debra', 'Walker', 'dwalkerj', '1BFiCRr1p3DwSjmqFbzE6HjJBeXxNsgqtY', 'dwalkerj@yahoo.com', '1986-05-30 01:44:56');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Bonnie', 'Fowler', 'bfowlerk', '13P9LDTREUPxxoLoYKBLnQSjiLMsA7UCB5', 'bfowlerk@bloglines.com', '1987-09-05 20:48:35');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Joyce', 'Kennedy', 'jkennedyl', '1JozkfsoPSyVqN7XK49t7A8tHpi5AkdLiN', 'jkennedyl@t.co', '1983-11-03 00:44:33');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Diane', 'Mason', 'dmasonm', '1Dw9HC3uK1AWUu9mx1zX7W4z6vxkrX9zet', 'dmasonm@dagondesign.com', '1998-02-10 01:36:38');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Mildred', 'Ray', 'mrayn', '1PN8i7e4zYjjdRrkkPFdjeQKyWDJY77vK1', 'mrayn@google.de', '1995-10-09 09:51:49');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Beverly', 'Kelly', 'bkellyo', '1LEmFQ7btTeZiSfC49MWbcb1w2xQKwDZMQ', 'bkellyo@hao123.com', '1992-03-03 17:41:56');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Christina', 'Hawkins', 'chawkinsp', '1CwJL16UQ1ghczZDSc67z1uhzpNyHfgsou', 'chawkinsp@lycos.com', '1974-10-12 03:28:13');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Michelle', 'Owens', 'mowensq', '1227Qz8dXwMozj23LZxNxW1mVJvARCqcd9', 'mowensq@marriott.com', '1995-02-06 19:50:05');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Carol', 'Chavez', 'cchavezr', '14TdbJ4pFLjj4RB26YqB4bY4uLGxwzNvQT', 'cchavezr@4shared.com', '1995-05-29 07:16:28');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Sarah', 'Hart', 'sharts', '16W64xuDMreD7UPhXJ5G4Yb2QHr9F8W7Cb', 'sharts@smugmug.com', '1996-04-19 21:46:04');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Andrea', 'Hart', 'ahartt', '1Kg3QEHXnZCk4MZamfHzAcereppFj1rLUy', 'ahartt@i2i.jp', '1974-12-12 06:17:17');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Donna', 'Lewis', 'dlewisu', '1CaSGZzTAKDVh1dszLeQ2pV9ykWj3DBUkr', 'dlewisu@mozilla.com', '1977-09-21 13:52:50');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Denise', 'Bowman', 'dbowmanv', '18Kg78b4LibA5UkeUeVinvcdjdMKjhiPuK', 'dbowmanv@360.cn', '1979-06-28 19:45:34');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Jacqueline', 'Larson', 'jlarsonw', '1Q4P5FUnhp5vp9P4VbDmiRL21fGBp1T83j', 'jlarsonw@paypal.com', '1972-10-28 10:17:54');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Robin', 'Matthews', 'rmatthewsx', '1Lcbyp7yG1c4nfnhwuu636rT1imYdo7jZp', 'rmatthewsx@seattletimes.com', '1997-01-30 09:38:23');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Patricia', 'Gordon', 'pgordony', '1AGPjGxiak4EDVj7djy6ZPAnacTc5STnd8', 'pgordony@angelfire.com', '1975-09-26 21:10:00');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Angela', 'Gibson', 'agibsonz', '1F1DeygLKG6Pdo1pShLK7FTYWuCKW5BhWd', 'agibsonz@virginia.edu', '1991-04-06 07:45:19');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Deborah', 'Reyes', 'dreyes10', '1LscCAQdKXJ38NHrJmKcXtX2FkMByz7hJf', 'dreyes10@wikispaces.com', '1977-10-08 23:57:31');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Anne', 'Lawrence', 'alawrence11', '1Co8arC1M4AsokM3z2dSbE7H31fvoKar9c', 'alawrence11@google.de', '1985-12-22 23:27:24');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Janice', 'Meyer', 'jmeyer12', '1uJatfguNFEDCEbVQ1huDHrUNiZ9ScMHn', 'jmeyer12@noaa.gov', '1998-12-03 10:02:39');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Jacqueline', 'Jones', 'jjones13', '16593AZwRVCDzK9nYQh7UEVwdFFWR9NgFq', 'jjones13@google.de', '1984-02-22 07:02:45');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Barbara', 'West', 'bwest14', '1EUSyhrKZHFHSUgf1QysWjx5TRxN5jiA5M', 'bwest14@tuttocitta.it', '1998-09-22 13:25:17');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Bonnie', 'Pierce', 'bpierce15', '18rFWKMFptiSPESF4iv3LZZGUm1KgD3LKf', 'bpierce15@ehow.com', '1980-09-22 10:53:09');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Michelle', 'Scott', 'mscott16', '1K3o3gJnhJcBa7X8sUyPpBpF2MYwU5tegs', 'mscott16@unesco.org', '1995-03-14 22:57:13');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Tammy', 'Ford', 'tford17', '1Jkkc1MYdEoWg854NmLFMdcjm2jxTtMgnm', 'tford17@google.com.hk', '1992-07-18 06:25:02');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Catherine', 'Perry', 'cperry18', '1GdJqGS9ww64bKXP2hkua788ZH5xAuj2Jv', 'cperry18@yellowbook.com', '1998-10-06 08:41:23');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Lillian', 'Morgan', 'lmorgan19', '1D8XkG3wLQ7MXwSEtBKGUKAM2YH9kmVm99', 'lmorgan19@barnesandnoble.com', '1981-01-01 18:19:00');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Anna', 'Flores', 'aflores1a', '12QTEjt9K3bbLCbDs7Q5Ujc9gTJEvryYMk', 'aflores1a@bloomberg.com', '1978-06-15 20:35:48');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Katherine', 'Peters', 'kpeters1b', '17muw8eiijYLaahJME2GgCTQXNtXC6NCgt', 'kpeters1b@vkontakte.ru', '1975-11-16 17:15:54');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Janice', 'Hart', 'jhart1c', '1M3CPvjXrYKpLdrWgnQ2XMvLjgTJ5r2Loc', 'jhart1c@addthis.com', '1985-02-17 13:53:40');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Carol', 'Webb', 'cwebb1d', '19fLgKnyGKb6ZJ4Mpm1jyaJXjh2hkZti6L', 'cwebb1d@mapy.cz', '1982-07-01 14:11:06');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Julie', 'Long', 'jlong1e', '14onk1BfA5pNifdP4CTfJjG7qLvfChNQdv', 'jlong1e@jugem.jp', '1983-04-17 22:47:04');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Anna', 'Moore', 'amoore1f', '1Q9AVzchq1ahKGU49G5GMQnn6Ct2j4PhgQ', 'amoore1f@techcrunch.com', '1996-06-07 15:39:09');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Judith', 'Hawkins', 'jhawkins1g', '1KmcT6CnBKHXi3F7pMmWT8aMamWvvgSxbN', 'jhawkins1g@wordpress.com', '1974-04-10 10:29:26');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Dorothy', 'Rodriguez', 'drodriguez1h', '172pZ15tSirx9Qdin5HkDnjvCMjPUeK7PQ', 'drodriguez1h@dailymail.co.uk', '1997-08-08 10:09:38');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Christine', 'Lee', 'clee1i', '1Mcxs182osiCVz4zMv9St4eBfWn43pPait', 'clee1i@wunderground.com', '1995-03-06 21:35:48');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Deborah', 'Weaver', 'dweaver1j', '1B31uSyKzSctNvRk5k7iHX3zx3F1DbcKku', 'dweaver1j@sun.com', '1993-12-29 00:15:53');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Brenda', 'Jacobs', 'bjacobs1k', '1846bERrZ2DotcJHZWhf7a3fCeQn6ZnQKJ', 'bjacobs1k@odnoklassniki.ru', '1997-08-17 20:02:21');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Deborah', 'Jenkins', 'djenkins1l', '14Mp3kJmtGmD6rP6RePbErT1Em7djj3yTg', 'djenkins1l@si.edu', '1973-01-19 06:54:15');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Nancy', 'Hunter', 'nhunter1m', '1HoiX4tpwvfbbtpfJGpnjxfB7Hs2rzMtzn', 'nhunter1m@fema.gov', '1984-06-15 08:47:48');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Ruth', 'Robertson', 'rrobertson1n', '15s8pAuiM3roNZK7arPVSxzkYui1GfEkm3', 'rrobertson1n@epa.gov', '1997-03-06 11:22:46');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Robin', 'Stewart', 'rstewart1o', '17iQUd8fygYUTxHoyhZP1ikxjRxtCdnUAZ', 'rstewart1o@npr.org', '1996-12-09 02:03:58');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Elizabeth', 'Perry', 'eperry1p', '1FTGbuJAJeMfF1UL3qBUngJJ7iZ8kwcysM', 'eperry1p@nhs.uk', '1984-12-22 19:27:29');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Lois', 'Snyder', 'lsnyder1q', '1Jm3CRYaSeruahmCfJcCCE6bS7cqrX5r5N', 'lsnyder1q@deviantart.com', '1999-03-20 06:38:12');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Pamela', 'Ortiz', 'portiz1r', '1JnvYyaVE392o4TKqcLTyuCYVSmAP35dwK', 'portiz1r@ftc.gov', '1978-01-16 10:09:28');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Kimberly', 'Armstrong', 'karmstrong1s', '1JEvaYL99DND64izfibZWuEhy1vYRX4yrz', 'karmstrong1s@ebay.com', '1974-07-20 15:44:34');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Lois', 'Mitchell', 'lmitchell1t', '1AfF4b4LFJT7qHso7qLe5NyXQu8tzJ4Dgx', 'lmitchell1t@si.edu', '1971-12-26 06:55:54');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Julia', 'Stone', 'jstone1u', '1KK29NTj354CtwJCDJRwUQfnvLZLqsguy7', 'jstone1u@ebay.com', '1998-07-14 00:20:57');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Linda', 'Webb', 'lwebb1v', '1FNkBxw59FDJkmwABMk2BsFWCuQmJo4tpP', 'lwebb1v@dyndns.org', '1984-01-14 20:07:37');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Catherine', 'Long', 'clong1w', '1NxjQeLQ8So1Umkq584E1AJHzfkmhFFHNr', 'clong1w@who.int', '1985-07-06 11:35:29');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Linda', 'Ryan', 'lryan1x', '1J63iEk67MLCgKL8Xsq3Yx2d23chf8TVpd', 'lryan1x@wikia.com', '1988-11-15 13:39:24');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Paula', 'Hughes', 'phughes1y', '1EuH9uFeZpVSKWyEzEFacVaT1coFdaArQY', 'phughes1y@wikipedia.org', '1987-03-10 11:10:44');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Anna', 'Jones', 'ajones1z', '1Aj78M6swDsX7dDu52SVshNE43t9uJGDN9', 'ajones1z@eepurl.com', '1981-07-15 22:28:28');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Cheryl', 'Perez', 'cperez20', '1uxuVLfKq9Sbo1SzSQFufdPJ749KmVXkT', 'cperez20@jugem.jp', '1996-10-22 08:59:39');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Elizabeth', 'Lane', 'elane21', '1CNQT7PAMuomM1Wn1ysJwVM85Qt3hqrvsV', 'elane21@bigcartel.com', '1978-12-12 04:43:22');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Mary', 'Henderson', 'mhenderson22', '1EnhkwXQLoiVz8d6A6mhXXbWx1PoA828gy', 'mhenderson22@mediafire.com', '1996-08-26 03:33:45');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Louise', 'James', 'ljames23', '163XfQvi3Lh5BB5HFiXvWMHENreTqfXUvT', 'ljames23@ovh.net', '1985-11-21 08:40:47');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Wanda', 'Wagner', 'wwagner24', '145pNBYW7haBB3cYVoEUn13uh8byvVN2hS', 'wwagner24@facebook.com', '1993-10-06 01:26:51');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Janet', 'Arnold', 'jarnold25', '1MQvZyFyv1ch3i25NRFn3J8kaZ6vQWDsqb', 'jarnold25@europa.eu', '1975-03-20 09:35:55');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Rebecca', 'Black', 'rblack26', '18nzqBSUCEhm9Xk1CQ5jhpdUPfj3o5RpMM', 'rblack26@cbc.ca', '1997-04-03 22:21:28');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Elizabeth', 'Jackson', 'ejackson27', '1NVWyXCtCTtBH2m4LUkhJL2ktkPN9CAoAS', 'ejackson27@bbb.org', '1988-11-09 04:16:39');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Evelyn', 'Ryan', 'eryan28', '1PVP6DrwcLNHUeV3c1dWGgHiJE4ftNCkzp', 'eryan28@cbc.ca', '1988-08-16 17:31:10');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Paula', 'Phillips', 'pphillips29', '1E6y7WSvVLQgZVedXbDx4o383zMV4FK1bR', 'pphillips29@blogs.com', '1982-05-02 19:29:30');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Martha', 'Mills', 'mmills2a', '12Tq9mVfT4RPJijbQ6BqxVnBqKiUuEqqBx', 'mmills2a@arizona.edu', '1973-10-18 13:33:50');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Paula', 'Sanders', 'psanders2b', '1DsBsTMAqLncRrpC5PLgS8kis89ucWDDDF', 'psanders2b@geocities.com', '1982-02-22 13:27:33');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Theresa', 'Warren', 'twarren2c', '1K15bNxoafYEAtmGxVDB7YhToZiTeQFKMW', 'twarren2c@salon.com', '1993-09-01 06:30:35');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Kelly', 'Russell', 'krussell2d', '14ntLsx59bguHM8sKWaUGS7KJ5A1m1C2eQ', 'krussell2d@reference.com', '1982-09-16 00:31:01');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Katherine', 'Lawson', 'klawson2e', '1Ew1tfi412ysnxJiYTF5JLJ97HYbaefuC9', 'klawson2e@ebay.com', '1973-01-20 06:53:37');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Jessica', 'Crawford', 'jcrawford2f', '1GSonGYqonMwxMkUzV9RW2zG9tHn98kBx9', 'jcrawford2f@canalblog.com', '1993-11-21 17:24:26');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Marilyn', 'Green', 'mgreen2g', '1KKgXUP1fNcxbWdY5eM3vVZ6wkWGkC4JfN', 'mgreen2g@nationalgeographic.com', '1975-09-18 01:56:23');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Marie', 'Garcia', 'mgarcia2h', '1ENLJDuZd1wiJRY9HFmrPndSmotrpezUPR', 'mgarcia2h@hexun.com', '1998-09-08 13:04:57');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Carol', 'Garcia', 'cgarcia2i', '138sxyDdWdHJppT5HXumSsabBQiLZ7JE2u', 'cgarcia2i@slideshare.net', '1988-05-03 22:32:30');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Lillian', 'Schmidt', 'lschmidt2j', '1PtxtS9K9CRyuytKvc34YkxiFf7xN83SP4', 'lschmidt2j@elegantthemes.com', '1982-08-04 23:38:00');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Christina', 'Fisher', 'cfisher2k', '1EmBXpm5gMJLhpYAoTHRvAMD73isLcGSLY', 'cfisher2k@smugmug.com', '1974-12-21 21:29:30');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Carol', 'Baker', 'cbaker2l', '1DrJSMLDdAw6VsC4MXBZzD48gAmiqzfAPe', 'cbaker2l@abc.net.au', '1977-04-08 03:29:14');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Carol', 'Lewis', 'clewis2m', '16HzsdPtvmMpRWJVUbXJkHdYU4Q6f72RC6', 'clewis2m@dion.ne.jp', '1982-07-07 13:08:38');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Sarah', 'Welch', 'swelch2n', '18VCpF1uwv4ECwsoGxvQSnRkj5diBHRdrJ', 'swelch2n@merriam-webster.com', '1983-01-28 03:03:05');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Denise', 'Harper', 'dharper2o', '1HS3VD8iMhug2yE14ovr5U2qpSKLNsqUdf', 'dharper2o@nymag.com', '1985-11-23 13:24:51');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Nicole', 'Phillips', 'nphillips2p', '17rCyaYXApasuEo6J59eQ3XXf3Fx1Mvzrg', 'nphillips2p@nationalgeographic.com', '1977-07-07 18:18:34');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Dorothy', 'Sims', 'dsims2q', '13et7y7jgVqfjGNYVRzEJV9PmQdV9fqFGM', 'dsims2q@house.gov', '1978-06-03 04:33:01');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Brenda', 'Woods', 'bwoods2r', '1PWefW3Ldhk933WqHNyVkUJeYz2c6rD51Z', 'bwoods2r@scientificamerican.com', '1986-05-25 20:51:13');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Kathryn', 'Burton', 'kburton2s', '1KDJA67P9dbc6EVNqxdW21HwdJj9S1MUyS', 'kburton2s@google.ca', '1976-03-25 05:51:16');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Gloria', 'Garcia', 'ggarcia2t', '13UrV9y7yHxH1cdXVHqDRHDcZxsHTZ2s9z', 'ggarcia2t@prlog.org', '1995-09-16 12:17:35');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Carolyn', 'George', 'cgeorge2u', '1M95uw5AJ21ycGrhHWj6yBRmhnmaxNwHJX', 'cgeorge2u@google.com.hk', '1972-07-06 22:23:37');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Margaret', 'Sanchez', 'msanchez2v', '124nmZGpsRv2FNrXftAzq7YoyQGVYxvv9F', 'msanchez2v@umich.edu', '1989-02-20 05:14:10');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Barbara', 'Fields', 'bfields2w', '1G9jrfhuvZCxKpv6XajCn4P6RsTuL3AUcK', 'bfields2w@t-online.de', '1973-03-08 08:29:56');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Lois', 'Hernandez', 'lhernandez2x', '1B8pjC9tzK8eaHQMZuVB2k5CkomhjgjmG4', 'lhernandez2x@skyrock.com', '1973-10-29 15:49:30');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Nancy', 'Moreno', 'nmoreno2y', '18C2a7uFMiW4g8ZZzhNJVAySdocfy8GPw2', 'nmoreno2y@fema.gov', '1971-04-06 22:14:21');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Brenda', 'Fuller', 'bfuller2z', '1FNMfPEfjr4oSNEikjFX63YMPXnQvnrZpj', 'bfuller2z@elegantthemes.com', '1987-05-07 04:51:45');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Marilyn', 'Ortiz', 'mortiz30', '18tMZczEGzuaCodpXd4d8dESYCLp3VgZC8', 'mortiz30@hugedomains.com', '1973-01-21 18:49:28');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Christina', 'Day', 'cday31', '1KNkGVEVfEvaJWLtP6aDwAMx62JvUBn3Ns', 'cday31@ifeng.com', '1976-08-02 22:04:40');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Betty', 'Romero', 'bromero32', '1E2i7EQNR2N1QJjqcfRhNt3QMtZaguDbix', 'bromero32@opera.com', '1992-12-05 23:34:46');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Marie', 'Cole', 'mcole33', '19YMaHekDwGEXpUvWmHsjcyAXL7sJBZejz', 'mcole33@umn.edu', '1982-02-16 01:38:38');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Virginia', 'Hall', 'vhall34', '1CoibVPk2qs9JymZWSVV5RM2APE3XkBt7Q', 'vhall34@slashdot.org', '1973-11-24 13:07:45');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Doris', 'Snyder', 'dsnyder35', '1EKnghk55X2vJnS1XRi49DGWFLfv1uFViy', 'dsnyder35@nature.com', '1971-02-14 15:35:50');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Kimberly', 'Hernandez', 'khernandez36', '19wYzuLCrQxLRAdmk39UcdyXjGrTq5NEhq', 'khernandez36@vimeo.com', '1976-12-12 23:27:20');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Cheryl', 'Martin', 'cmartin37', '1FaFmghHRedPtR2VUWbo3Mf2ERRBKAkcec', 'cmartin37@soundcloud.com', '1987-03-30 05:48:44');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Deborah', 'Smith', 'dsmith38', '1Hi2rhByrPrar5p3Lkwvtgy3GDhPDPeAhg', 'dsmith38@cdbaby.com', '1979-12-15 23:35:25');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Sarah', 'White', 'swhite39', '18VSZW6gZovFbyfDpmW2QH38jmvLoyax6D', 'swhite39@wordpress.com', '1973-01-08 01:32:36');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Kelly', 'Wood', 'kwood3a', '1Nm97wuExxoLkcnJneuVuzpsoCkqY5tusf', 'kwood3a@tripadvisor.com', '1974-10-15 20:10:30');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Anne', 'Black', 'ablack3b', '1YdQuBcGHosB9S4t7f2jAPE3qMQ9zZgUy', 'ablack3b@behance.net', '1978-01-17 07:45:03');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Barbara', 'Lewis', 'blewis3c', '1DUjDRTy1txUE1xJi8FcrobXUqtb2S4N2g', 'blewis3c@odnoklassniki.ru', '1996-12-27 10:37:36');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Robin', 'Henderson', 'rhenderson3d', '15D2BQ5Jmhr9yP4X9cGq4zgHZmyxUXMDuA', 'rhenderson3d@yale.edu', '1995-01-24 00:26:29');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Diane', 'Wallace', 'dwallace3e', '1CuMcc151JgEMUxMfYfXjoGDG93fPJMgot', 'dwallace3e@meetup.com', '1972-04-16 03:50:28');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Sandra', 'Rogers', 'srogers3f', '1Dp39SbgEpFLwpmaNhnNnja43V7AiLj5ZJ', 'srogers3f@telegraph.co.uk', '1973-01-04 10:35:46');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Julia', 'Garza', 'jgarza3g', '13yZXCC7WLTDj3mrT9ze9eXW8hfAZaM4Xc', 'jgarza3g@ucsd.edu', '1973-09-07 09:23:53');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Kimberly', 'Armstrong', 'karmstrong3h', '1BXZ6RnVU5QQReNGJh3qLpKBf7tb5Uj649', 'karmstrong3h@eventbrite.com', '1971-12-30 13:08:31');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Pamela', 'Gardner', 'pgardner3i', '1CKgMsiixtSqvb7JQ9tNeCqm6rmvG7g3WW', 'pgardner3i@sina.com.cn', '1987-03-27 05:43:46');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Diane', 'Gordon', 'dgordon3j', '18G8AYrxJVXizoPt1CzvsgVX2vLq7ZpuoW', 'dgordon3j@amazon.com', '1994-04-04 04:25:56');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Louise', 'Lawson', 'llawson3k', '15yx21A8QiGLwvmzkW113zQipRMhkmqpdv', 'llawson3k@scientificamerican.com', '1976-05-07 07:35:43');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Andrea', 'Patterson', 'apatterson3l', '1EpQ9y9YJXxYKw9J6ps7dSy6FBB17k2KVb', 'apatterson3l@hc360.com', '1971-02-01 09:18:26');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Kathleen', 'Sanders', 'ksanders3m', '1LtaMVJ3XtnDGeWazwFC3WZJAuGSNGtV5W', 'ksanders3m@live.com', '1988-10-26 04:51:16');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Diana', 'Reid', 'dreid3n', '1CA2sMp8DaN2CdJdadqw1aWGU24f6D5tFJ', 'dreid3n@cmu.edu', '1995-02-18 16:10:16');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Kathy', 'Garrett', 'kgarrett3o', '1KxR29WYLiLcraYMFcvSAJe6fTQdFqFrDJ', 'kgarrett3o@si.edu', '1980-10-24 09:32:06');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Shirley', 'Wagner', 'swagner3p', '1ArWjmHm7Pm227VfyGhZbzNJCQPy3WEVdX', 'swagner3p@aboutads.info', '1979-04-27 12:10:44');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Judy', 'Ross', 'jross3q', '1EwanmJHnah857DcWDkKrRUVDgZqjcrkgq', 'jross3q@vinaora.com', '1984-09-17 21:22:17');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Nancy', 'Medina', 'nmedina3r', '1bgE9ME4sZDR4NsLFm9CkV7sdrWBxBwJE', 'nmedina3r@goodreads.com', '1980-07-27 23:18:13');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Jean', 'Riley', 'jriley3s', '1ANzpFyBKNgnoSakEZwVgtFPXfQxPxoCUL', 'jriley3s@upenn.edu', '1980-11-07 11:06:03');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Anna', 'Perkins', 'aperkins3t', '1DhwxxLsdkSwXeJzaGsYXEhjZtYWHfRPBT', 'aperkins3t@pbs.org', '1994-03-01 03:44:58');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Norma', 'Hayes', 'nhayes3u', '1JRyjC2zP2vmNEApkmYF5DhhsjbLa8D765', 'nhayes3u@exblog.jp', '1991-03-19 04:24:33');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Rebecca', 'Castillo', 'rcastillo3v', '1NubXzSSsqSC5JqLXvPjatoKBp4NLMoWXv', 'rcastillo3v@scribd.com', '1984-01-10 18:03:20');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Janet', 'Ferguson', 'jferguson3w', '18qRc5YyJJdxx3Rrq5hy29b3eVqxhqZE2b', 'jferguson3w@ucoz.com', '1980-03-21 04:53:23');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Tina', 'Phillips', 'tphillips3x', '1Q53xyHTkwDDyWKPQaCYZvZYDV79BBDsYC', 'tphillips3x@redcross.org', '1983-04-09 05:47:11');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Norma', 'Carpenter', 'ncarpenter3y', '12PHSgp2A7tBRqU8FDwajMQNLorCdByBAz', 'ncarpenter3y@theatlantic.com', '1993-11-08 01:01:54');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Laura', 'Brooks', 'lbrooks3z', '145tNuVWJQqKHTmFdtra1zXJWAvXVQu5Ei', 'lbrooks3z@state.gov', '1986-05-18 15:22:22');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Alice', 'Hall', 'ahall40', '1FbRYJ5WqrZEgF5SKV8kdgLtQjz58cYjim', 'ahall40@twitpic.com', '1988-09-12 13:49:26');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Phyllis', 'Scott', 'pscott41', '15YRpYq5xYcGDjDPeiQxYbEPAgpzMtWSbf', 'pscott41@cmu.edu', '1987-12-11 10:38:04');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Ashley', 'Carpenter', 'acarpenter42', '1Ejc5wPRRbSDWAoKjvvXUgmMsScr9nk9Ea', 'acarpenter42@ft.com', '1999-10-25 21:00:04');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Kelly', 'Sanchez', 'ksanchez43', '15w7UwsKzkbRnJQ4g8Z12uUHGURrk3zpuq', 'ksanchez43@google.com.hk', '1973-06-25 04:12:25');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Shirley', 'Turner', 'sturner44', '186T1mLXqtmUwM6fy51bD67eNEmkjCP52d', 'sturner44@google.com.br', '1971-02-17 19:08:24');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Cheryl', 'Hayes', 'chayes45', '1LzMdFGCL9Wdrz44RAAiBsbQgZHQHxX8VF', 'chayes45@admin.ch', '1983-10-06 02:28:28');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Joan', 'Lane', 'jlane46', '15cCWjUtVtV5qYAJkM3wDi46ZKiWRkcYot', 'jlane46@seattletimes.com', '1984-10-12 23:43:02');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Cheryl', 'Jacobs', 'cjacobs47', '1CSgnvyrGPzqapUgA7nSJutmLTehLEDvVm', 'cjacobs47@examiner.com', '1983-04-16 14:41:52');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Maria', 'Cunningham', 'mcunningham48', '18bGaEnd14sn5JT2RsUMGp1MFQTAi2hbgx', 'mcunningham48@cargocollective.com', '1994-07-20 00:16:20');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Maria', 'Hamilton', 'mhamilton49', '1MoiUAKwQSSjzWYSHbxy4L6nhLf6X1s3yV', 'mhamilton49@theatlantic.com', '1971-10-19 14:46:58');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Amanda', 'Marshall', 'amarshall4a', '1528S2U5HwkQDqVvLduBDeUcuDiPFc9mE7', 'amarshall4a@globo.com', '1994-07-05 02:51:15');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Michelle', 'Cook', 'mcook4b', '12LBixhku7w6wd85DXDfFgE1PTck2jpXZT', 'mcook4b@mail.ru', '1993-08-16 00:41:05');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Marie', 'Stanley', 'mstanley4c', '17bVWJGWEyHTBw2sAiMVte6XYdjaG9iCoE', 'mstanley4c@wufoo.com', '1991-11-02 09:19:58');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Laura', 'Wood', 'lwood4d', '1Q2ZvycsMsisrzEcqX6U17vnmKXwoA2UKq', 'lwood4d@biglobe.ne.jp', '1972-03-29 17:37:16');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Andrea', 'Berry', 'aberry4e', '1H6wVpPEuG4pjHkcwTtAJtRQ1zS7EPeBhC', 'aberry4e@example.com', '1979-08-13 18:13:59');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Alice', 'Collins', 'acollins4f', '14HxeEc6HAVikiJimHxcrSRTD4yfwiJMtE', 'acollins4f@umich.edu', '1995-12-26 22:27:31');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Jennifer', 'Wright', 'jwright4g', '146nCcgAhSBB4TPiN5AShJdm6xdRaud45n', 'jwright4g@vimeo.com', '1978-10-03 17:57:16');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Ruby', 'Fernandez', 'rfernandez4h', '1MoB2gf8mhmBJtc1uWgSQn9tKb6jbC5LRP', 'rfernandez4h@xing.com', '1999-08-11 10:32:05');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Wanda', 'Wagner', 'wwagner4i', '1oT3CjQENEAdRxaNSyxPHkdwW6eAAdrn8', 'wwagner4i@i2i.jp', '1997-06-23 12:04:02');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Kathryn', 'Barnes', 'kbarnes4j', '16YvW7oB3UwV5GvsNLPUxHpR9V4MwR1ZxR', 'kbarnes4j@wikispaces.com', '1981-02-05 10:24:50');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Annie', 'Harris', 'aharris4k', '1FAZ1z4yQEz2T6ka33GG5gXJS3LWobR8Gc', 'aharris4k@1und1.de', '1980-10-10 12:54:12');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Ashley', 'Harvey', 'aharvey4l', '1EtjSCHqPAVwtsUzAPP3xiCM5LAjebiGy7', 'aharvey4l@kickstarter.com', '1991-12-07 02:51:21');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Janice', 'Martin', 'jmartin4m', '1D3BWkpwiqwydfjvohoK531VixRZBfvjEx', 'jmartin4m@devhub.com', '1978-11-15 17:09:17');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Amy', 'Howell', 'ahowell4n', '1K27mAM69zR34u4GsgGpuyAZKFXTu86UWs', 'ahowell4n@lulu.com', '1975-03-26 22:06:12');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Theresa', 'Willis', 'twillis4o', '18gobJfKeqik2K1j17hPex5WB5CmD178VB', 'twillis4o@posterous.com', '1986-11-16 23:49:54');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Jacqueline', 'Long', 'jlong4p', '1Q9FJtTJggBRufAy9ywSd2Mf8B14puatx2', 'jlong4p@hostgator.com', '1978-04-04 23:56:37');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Linda', 'Moreno', 'lmoreno4q', '1CcUHWzsc4Y5o9j6Yi7EBiwYgHmh7K3o91', 'lmoreno4q@oracle.com', '1993-07-10 23:31:31');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Denise', 'Sims', 'dsims4r', '1DJVsXz1K2Mao99BAbMJ16qW1zKz3LMrf7', 'dsims4r@ocn.ne.jp', '1975-05-11 17:04:30');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Kimberly', 'Webb', 'kwebb4s', '16aks4Yqqg9u8Kk3ii8FgoJZa3TD3KhKxU', 'kwebb4s@opensource.org', '1997-08-04 07:27:44');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Louise', 'Flores', 'lflores4t', '1MqYjgtbX4HMoXXF9Euc1JAc1VEHnveaCG', 'lflores4t@archive.org', '1998-04-26 09:08:10');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Denise', 'Snyder', 'dsnyder4u', '19tgowbuMY1mn5NrBTveKGdP5JmZEiEyDR', 'dsnyder4u@si.edu', '1979-10-17 11:53:41');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Jennifer', 'Shaw', 'jshaw4v', '12jHEDsxkLrTHe23fgvSgEApB9uEGFCtzT', 'jshaw4v@sbwire.com', '1996-02-06 03:23:14');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Michelle', 'Hudson', 'mhudson4w', '1A2QNJkzwyKL3aHxejeVpD7Yp99inSp7R7', 'mhudson4w@microsoft.com', '1993-04-20 16:32:34');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Denise', 'Green', 'dgreen4x', '1Q32tBZeA5vgBN8WBsZ1yQgkhrTyAPqHSV', 'dgreen4x@ucoz.ru', '1973-07-29 02:19:09');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Laura', 'Peterson', 'lpeterson4y', '1C7T4ZYcrMzcBSvPhd3hy7PsvUd3UQyncs', 'lpeterson4y@apple.com', '1996-07-02 21:31:46');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Kathy', 'Kelley', 'kkelley4z', '1DHzpbMZGWqPmsT6uz6wQTVQP7vnSV9UvP', 'kkelley4z@stanford.edu', '1994-08-03 18:06:53');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Joan', 'Simmons', 'jsimmons50', '1a69mK2HPLqdS8YWBZAS1CEyYVyEHvFHY', 'jsimmons50@indiatimes.com', '1995-03-18 06:54:24');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Diana', 'Moore', 'dmoore51', '1PGVCiyZ5ajhkN6WBeUNA7TJJhnirTyiwC', 'dmoore51@columbia.edu', '1982-09-12 07:51:14');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Sara', 'Kelley', 'skelley52', '1KkHrfkg8uKzedmQvstVBvxjrxM4G8AcJa', 'skelley52@yolasite.com', '1998-07-01 23:55:25');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Diane', 'Pierce', 'dpierce53', '1GaqRAbdwjPAkQbLjTyosbbJcE7tBcpdBq', 'dpierce53@devhub.com', '1971-01-30 21:16:40');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Doris', 'Cunningham', 'dcunningham54', '1BtpadkAiNEcfewVQSVHUtAzuH7aaaHKH9', 'dcunningham54@networksolutions.com', '1974-04-09 02:19:25');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Kelly', 'Richardson', 'krichardson55', '15Kadk6VvWWd71yGfqVLkcwbpgXFiMzCbx', 'krichardson55@dagondesign.com', '1979-01-22 20:06:58');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Janet', 'Perry', 'jperry56', '1CYY8zjLCdbuqKcexwKJzmuCa5qCK3p1Yw', 'jperry56@e-recht24.de', '1995-11-15 04:35:33');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Gloria', 'Wells', 'gwells57', '1M5xSz1wodLoMPXNKHr4GnCuBj4VCFZ6ko', 'gwells57@hud.gov', '1997-03-09 06:55:46');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Debra', 'Jacobs', 'djacobs58', '12GhqwqEY3MywzsptDJNZVebofZFPYG52p', 'djacobs58@amazon.com', '1975-01-27 09:05:31');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Lisa', 'Clark', 'lclark59', '14bseytiU4Nz3LV72tG9Rs2gVtbRimBGju', 'lclark59@google.ca', '1974-09-05 13:46:52');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Ashley', 'Jackson', 'ajackson5a', '1ALnbUYDNMzkJ5cuKZp31SGRwL17W5qvRz', 'ajackson5a@simplemachines.org', '1993-08-24 05:52:00');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Marie', 'Dixon', 'mdixon5b', '15TAPe1zUccgKEXbW9L4ZQRuKoUTxvcp4U', 'mdixon5b@usa.gov', '1993-11-29 19:21:53');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Carol', 'Lane', 'clane5c', '1JTALPYfJW5QhX4A6W1FE22kSJdPm6ijxg', 'clane5c@state.gov', '1985-04-08 12:44:16');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Joyce', 'Harrison', 'jharrison5d', '1BnJAM5Qh1ftLbCbkwsbDxwCSz5XiLqQ1T', 'jharrison5d@squarespace.com', '1988-07-31 16:19:48');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Linda', 'Palmer', 'lpalmer5e', '13fSTu9DfYUin4W24hEBgMwhBF3AuwynYP', 'lpalmer5e@oakley.com', '1980-05-16 07:08:22');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Rebecca', 'Howard', 'rhoward5f', '1JVV1S9JBPcCSZiqwxbf8f4M4hcb3r9sgU', 'rhoward5f@posterous.com', '1988-09-12 15:22:31');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Carolyn', 'Cox', 'ccox5g', '18J6zL3LHACSr59oBJmcFDyZAgU9eJM1m9', 'ccox5g@wired.com', '1986-12-13 16:40:02');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Judy', 'Graham', 'jgraham5h', '1ATj4WJBGiQ6z3r4LiZkSRNSXDVf6whqK', 'jgraham5h@psu.edu', '1971-06-02 18:03:33');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Emily', 'Watson', 'ewatson5i', '1HZVk1jiqKEdFycco1vstKbaUZgVvsQh6K', 'ewatson5i@hubpages.com', '1986-07-27 17:16:05');
insert into person (firstname, lastname, username, password, email, date_of_birth) values ('Kimberly', 'Richards', 'krichards5j', '14ZNVhmgghZ7zNtxjAtH1ymBe9Dw48g6BV', 'krichards5j@mashable.com', '1982-10-26 00:13:27');


---------------------------------------
--   FILLING TABLE 'group'
---------------------------------------
insert into [group] (name) values ('admin');
insert into [group] (name) values ('membre');
insert into [group] (name) values ('responsable');
insert into [group] (name) values ('non-membre');
insert into [group] (name) values ('invité');


---------------------------------------
--   FILLING TABLE 'group_has_person'
---------------------------------------
insert into group_has_person (fk_person, fk_group) values (41, 3);
insert into group_has_person (fk_person, fk_group) values (47, 4);
insert into group_has_person (fk_person, fk_group) values (173, 4);
insert into group_has_person (fk_person, fk_group) values (44, 4);
insert into group_has_person (fk_person, fk_group) values (21, 2);
insert into group_has_person (fk_person, fk_group) values (154, 1);
insert into group_has_person (fk_person, fk_group) values (125, 3);
insert into group_has_person (fk_person, fk_group) values (110, 1);
insert into group_has_person (fk_person, fk_group) values (173, 1);
insert into group_has_person (fk_person, fk_group) values (20, 2);
insert into group_has_person (fk_person, fk_group) values (131, 4);
insert into group_has_person (fk_person, fk_group) values (10, 1);
insert into group_has_person (fk_person, fk_group) values (176, 3);
insert into group_has_person (fk_person, fk_group) values (169, 5);
insert into group_has_person (fk_person, fk_group) values (155, 4);
insert into group_has_person (fk_person, fk_group) values (114, 1);
insert into group_has_person (fk_person, fk_group) values (75, 2);
insert into group_has_person (fk_person, fk_group) values (13, 1);
insert into group_has_person (fk_person, fk_group) values (145, 3);
insert into group_has_person (fk_person, fk_group) values (33, 5);
insert into group_has_person (fk_person, fk_group) values (68, 4);
insert into group_has_person (fk_person, fk_group) values (47, 5);
insert into group_has_person (fk_person, fk_group) values (48, 3);
insert into group_has_person (fk_person, fk_group) values (67, 4);
insert into group_has_person (fk_person, fk_group) values (29, 2);
insert into group_has_person (fk_person, fk_group) values (72, 5);
insert into group_has_person (fk_person, fk_group) values (196, 1);
insert into group_has_person (fk_person, fk_group) values (61, 5);
insert into group_has_person (fk_person, fk_group) values (170, 5);
insert into group_has_person (fk_person, fk_group) values (153, 1);
insert into group_has_person (fk_person, fk_group) values (115, 5);
insert into group_has_person (fk_person, fk_group) values (200, 3);
insert into group_has_person (fk_person, fk_group) values (12, 1);
insert into group_has_person (fk_person, fk_group) values (65, 2);
insert into group_has_person (fk_person, fk_group) values (45, 5);
insert into group_has_person (fk_person, fk_group) values (42, 4);
insert into group_has_person (fk_person, fk_group) values (168, 2);
insert into group_has_person (fk_person, fk_group) values (67, 3);
insert into group_has_person (fk_person, fk_group) values (83, 3);
insert into group_has_person (fk_person, fk_group) values (112, 4);
insert into group_has_person (fk_person, fk_group) values (170, 3);
insert into group_has_person (fk_person, fk_group) values (90, 2);
insert into group_has_person (fk_person, fk_group) values (199, 4);
insert into group_has_person (fk_person, fk_group) values (182, 2);
insert into group_has_person (fk_person, fk_group) values (42, 3);
insert into group_has_person (fk_person, fk_group) values (196, 2);
insert into group_has_person (fk_person, fk_group) values (72, 1);
insert into group_has_person (fk_person, fk_group) values (74, 4);
insert into group_has_person (fk_person, fk_group) values (87, 5);
insert into group_has_person (fk_person, fk_group) values (38, 2);
insert into group_has_person (fk_person, fk_group) values (125, 4);
insert into group_has_person (fk_person, fk_group) values (114, 1);
insert into group_has_person (fk_person, fk_group) values (23, 2);
insert into group_has_person (fk_person, fk_group) values (1, 4);
insert into group_has_person (fk_person, fk_group) values (106, 1);
insert into group_has_person (fk_person, fk_group) values (11, 1);
insert into group_has_person (fk_person, fk_group) values (53, 2);
insert into group_has_person (fk_person, fk_group) values (196, 4);
insert into group_has_person (fk_person, fk_group) values (185, 5);
insert into group_has_person (fk_person, fk_group) values (78, 3);
insert into group_has_person (fk_person, fk_group) values (12, 5);
insert into group_has_person (fk_person, fk_group) values (124, 5);
insert into group_has_person (fk_person, fk_group) values (84, 2);
insert into group_has_person (fk_person, fk_group) values (156, 2);
insert into group_has_person (fk_person, fk_group) values (99, 3);
insert into group_has_person (fk_person, fk_group) values (28, 1);
insert into group_has_person (fk_person, fk_group) values (31, 5);
insert into group_has_person (fk_person, fk_group) values (123, 3);
insert into group_has_person (fk_person, fk_group) values (35, 2);
insert into group_has_person (fk_person, fk_group) values (196, 5);
insert into group_has_person (fk_person, fk_group) values (143, 1);
insert into group_has_person (fk_person, fk_group) values (3, 2);
insert into group_has_person (fk_person, fk_group) values (120, 4);
insert into group_has_person (fk_person, fk_group) values (111, 4);
insert into group_has_person (fk_person, fk_group) values (152, 4);
insert into group_has_person (fk_person, fk_group) values (71, 4);
insert into group_has_person (fk_person, fk_group) values (107, 5);
insert into group_has_person (fk_person, fk_group) values (147, 1);
insert into group_has_person (fk_person, fk_group) values (168, 1);
insert into group_has_person (fk_person, fk_group) values (35, 1);
insert into group_has_person (fk_person, fk_group) values (48, 2);
insert into group_has_person (fk_person, fk_group) values (9, 4);
insert into group_has_person (fk_person, fk_group) values (45, 1);
insert into group_has_person (fk_person, fk_group) values (63, 1);
insert into group_has_person (fk_person, fk_group) values (60, 1);
insert into group_has_person (fk_person, fk_group) values (75, 4);
insert into group_has_person (fk_person, fk_group) values (8, 3);
insert into group_has_person (fk_person, fk_group) values (49, 3);
insert into group_has_person (fk_person, fk_group) values (49, 1);
insert into group_has_person (fk_person, fk_group) values (87, 2);
insert into group_has_person (fk_person, fk_group) values (153, 1);
insert into group_has_person (fk_person, fk_group) values (110, 3);
insert into group_has_person (fk_person, fk_group) values (153, 5);
insert into group_has_person (fk_person, fk_group) values (56, 2);
insert into group_has_person (fk_person, fk_group) values (59, 4);
insert into group_has_person (fk_person, fk_group) values (162, 1);
insert into group_has_person (fk_person, fk_group) values (171, 5);
insert into group_has_person (fk_person, fk_group) values (95, 4);
insert into group_has_person (fk_person, fk_group) values (176, 1);
insert into group_has_person (fk_person, fk_group) values (45, 4);
insert into group_has_person (fk_person, fk_group) values (57, 3);
insert into group_has_person (fk_person, fk_group) values (175, 1);
insert into group_has_person (fk_person, fk_group) values (175, 4);
insert into group_has_person (fk_person, fk_group) values (88, 3);
insert into group_has_person (fk_person, fk_group) values (186, 4);
insert into group_has_person (fk_person, fk_group) values (133, 2);
insert into group_has_person (fk_person, fk_group) values (79, 2);
insert into group_has_person (fk_person, fk_group) values (190, 2);
insert into group_has_person (fk_person, fk_group) values (189, 2);
insert into group_has_person (fk_person, fk_group) values (133, 3);
insert into group_has_person (fk_person, fk_group) values (32, 1);
insert into group_has_person (fk_person, fk_group) values (110, 2);
insert into group_has_person (fk_person, fk_group) values (102, 2);
insert into group_has_person (fk_person, fk_group) values (39, 4);
insert into group_has_person (fk_person, fk_group) values (132, 3);
insert into group_has_person (fk_person, fk_group) values (33, 3);
insert into group_has_person (fk_person, fk_group) values (5, 1);
insert into group_has_person (fk_person, fk_group) values (142, 1);
insert into group_has_person (fk_person, fk_group) values (129, 4);
insert into group_has_person (fk_person, fk_group) values (87, 1);
insert into group_has_person (fk_person, fk_group) values (17, 4);
insert into group_has_person (fk_person, fk_group) values (8, 4);
insert into group_has_person (fk_person, fk_group) values (154, 2);
insert into group_has_person (fk_person, fk_group) values (51, 1);
insert into group_has_person (fk_person, fk_group) values (77, 3);
insert into group_has_person (fk_person, fk_group) values (7, 1);
insert into group_has_person (fk_person, fk_group) values (184, 1);
insert into group_has_person (fk_person, fk_group) values (170, 3);
insert into group_has_person (fk_person, fk_group) values (142, 2);
insert into group_has_person (fk_person, fk_group) values (117, 2);
insert into group_has_person (fk_person, fk_group) values (112, 3);
insert into group_has_person (fk_person, fk_group) values (61, 4);
insert into group_has_person (fk_person, fk_group) values (30, 3);
insert into group_has_person (fk_person, fk_group) values (116, 1);
insert into group_has_person (fk_person, fk_group) values (31, 3);
insert into group_has_person (fk_person, fk_group) values (72, 2);
insert into group_has_person (fk_person, fk_group) values (113, 5);
insert into group_has_person (fk_person, fk_group) values (14, 3);
insert into group_has_person (fk_person, fk_group) values (68, 5);
insert into group_has_person (fk_person, fk_group) values (164, 5);
insert into group_has_person (fk_person, fk_group) values (184, 2);
insert into group_has_person (fk_person, fk_group) values (112, 1);
insert into group_has_person (fk_person, fk_group) values (172, 3);
insert into group_has_person (fk_person, fk_group) values (50, 2);
insert into group_has_person (fk_person, fk_group) values (44, 5);
insert into group_has_person (fk_person, fk_group) values (104, 1);
insert into group_has_person (fk_person, fk_group) values (147, 5);
insert into group_has_person (fk_person, fk_group) values (167, 1);
insert into group_has_person (fk_person, fk_group) values (22, 3);
insert into group_has_person (fk_person, fk_group) values (60, 3);
insert into group_has_person (fk_person, fk_group) values (24, 4);
insert into group_has_person (fk_person, fk_group) values (30, 1);
insert into group_has_person (fk_person, fk_group) values (27, 2);
insert into group_has_person (fk_person, fk_group) values (128, 1);
insert into group_has_person (fk_person, fk_group) values (179, 4);
insert into group_has_person (fk_person, fk_group) values (102, 4);
insert into group_has_person (fk_person, fk_group) values (67, 5);
insert into group_has_person (fk_person, fk_group) values (5, 2);
insert into group_has_person (fk_person, fk_group) values (124, 4);
insert into group_has_person (fk_person, fk_group) values (178, 4);
insert into group_has_person (fk_person, fk_group) values (9, 5);
insert into group_has_person (fk_person, fk_group) values (176, 2);
insert into group_has_person (fk_person, fk_group) values (118, 1);
insert into group_has_person (fk_person, fk_group) values (96, 4);
insert into group_has_person (fk_person, fk_group) values (16, 1);
insert into group_has_person (fk_person, fk_group) values (56, 1);
insert into group_has_person (fk_person, fk_group) values (41, 3);
insert into group_has_person (fk_person, fk_group) values (196, 4);
insert into group_has_person (fk_person, fk_group) values (168, 5);
insert into group_has_person (fk_person, fk_group) values (5, 3);
insert into group_has_person (fk_person, fk_group) values (101, 1);
insert into group_has_person (fk_person, fk_group) values (36, 5);
insert into group_has_person (fk_person, fk_group) values (48, 1);
insert into group_has_person (fk_person, fk_group) values (76, 3);
insert into group_has_person (fk_person, fk_group) values (24, 5);
insert into group_has_person (fk_person, fk_group) values (91, 3);
insert into group_has_person (fk_person, fk_group) values (106, 2);
insert into group_has_person (fk_person, fk_group) values (162, 1);
insert into group_has_person (fk_person, fk_group) values (108, 5);
insert into group_has_person (fk_person, fk_group) values (158, 4);
insert into group_has_person (fk_person, fk_group) values (57, 3);
insert into group_has_person (fk_person, fk_group) values (181, 2);
insert into group_has_person (fk_person, fk_group) values (119, 1);
insert into group_has_person (fk_person, fk_group) values (138, 4);
insert into group_has_person (fk_person, fk_group) values (83, 3);
insert into group_has_person (fk_person, fk_group) values (179, 2);
insert into group_has_person (fk_person, fk_group) values (105, 1);
insert into group_has_person (fk_person, fk_group) values (142, 5);
insert into group_has_person (fk_person, fk_group) values (192, 2);
insert into group_has_person (fk_person, fk_group) values (177, 3);
insert into group_has_person (fk_person, fk_group) values (108, 3);
insert into group_has_person (fk_person, fk_group) values (137, 5);
insert into group_has_person (fk_person, fk_group) values (88, 5);
insert into group_has_person (fk_person, fk_group) values (104, 3);
insert into group_has_person (fk_person, fk_group) values (105, 4);
insert into group_has_person (fk_person, fk_group) values (112, 1);
insert into group_has_person (fk_person, fk_group) values (16, 5);
insert into group_has_person (fk_person, fk_group) values (47, 3);
insert into group_has_person (fk_person, fk_group) values (165, 5);
insert into group_has_person (fk_person, fk_group) values (190, 5);


---------------------------------------
--   FILLING TABLE 'court'
---------------------------------------
insert into court (number) values (1);
insert into court (number) values (2);


---------------------------------------
--   FILLING TABLE 'booking'
---------------------------------------
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-06-30 15:53:24', 1, 150, 67);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-01-23 14:03:42', 1, 27, 135);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2013-11-26 23:08:17', 1, 136, 64);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-04-17 05:51:07', 2, 129, 21);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-08-15 06:21:38', 2, 104, 138);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-01-05 11:03:10', 2, 149, 175);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-10-30 13:51:11', 1, 167, 102);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2013-12-08 06:54:32', 2, 89, 66);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-11-23 05:49:57', 2, 94, 54);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-03-09 22:51:23', 2, 96, 103);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-05-04 03:56:31', 1, 22, 108);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-03-26 14:17:38', 2, 183, 61);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-06-21 05:45:54', 1, 181, 171);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-09-28 07:41:45', 2, 115, 163);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-01-08 06:19:53', 2, 152, 35);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-07-04 09:10:30', 2, 112, 30);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-10-07 01:06:12', 2, 44, 143);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-10-24 01:28:52', 1, 148, 77);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2013-12-29 02:03:22', 1, 13, 76);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-04-15 11:28:11', 2, 183, 133);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-01-09 16:37:28', 1, 57, 2);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-08-19 08:00:22', 1, 130, 167);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-02-23 06:15:13', 2, 189, 188);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-06-05 02:07:57', 1, 16, 147);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-04-25 21:06:20', 1, 108, 106);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2013-11-28 20:01:19', 2, 29, 9);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-11-20 04:43:59', 1, 119, 68);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-09-10 05:35:07', 2, 17, 134);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-09-12 16:19:28', 2, 94, 76);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-08-07 16:20:14', 1, 176, 150);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-11-02 06:45:30', 2, 170, 123);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2013-11-27 02:13:00', 1, 44, 174);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2013-11-26 19:59:41', 1, 135, 123);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-06-19 20:08:31', 2, 190, 142);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-08-02 22:58:30', 2, 128, 84);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-02-07 17:00:23', 2, 53, 58);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-10-05 18:54:38', 1, 3, 41);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-08-31 01:40:38', 2, 25, 132);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-09-24 04:52:31', 2, 88, 113);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-04-28 01:18:36', 1, 133, 74);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-10-04 12:57:34', 1, 63, 97);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-09-22 21:45:11', 2, 10, 191);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-09-19 19:08:35', 2, 79, 161);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-09-27 00:04:11', 2, 24, 162);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-11-20 07:37:25', 1, 75, 52);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-04-14 12:50:54', 1, 127, 154);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-11-06 23:25:10', 2, 35, 74);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-11-16 18:15:40', 2, 140, 176);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-11-08 08:06:31', 1, 184, 161);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-04-17 03:53:51', 2, 100, 12);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-05-03 02:59:19', 2, 14, 30);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-05-31 10:45:25', 2, 146, 13);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-03-26 11:15:13', 1, 188, 53);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-06-14 23:59:31', 2, 39, 134);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-04-13 09:16:57', 1, 4, 155);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2013-12-03 05:28:49', 2, 130, 23);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-10-10 03:09:01', 2, 34, 60);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-04-09 06:43:52', 1, 68, 108);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-04-14 15:22:28', 1, 69, 191);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-06-12 23:27:51', 1, 11, 2);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-01-03 12:49:32', 1, 124, 122);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-10-14 04:39:12', 1, 32, 99);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-10-28 00:30:15', 1, 198, 155);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-03-06 00:50:15', 1, 67, 7);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2013-12-18 20:16:53', 2, 90, 137);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-02-04 18:39:52', 1, 34, 82);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-06-12 21:25:01', 2, 113, 141);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-03-13 20:32:25', 1, 41, 187);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-01-09 03:58:26', 2, 9, 165);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-07-20 09:52:10', 2, 24, 195);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-03-29 07:05:47', 2, 22, 12);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-08-12 20:14:35', 1, 189, 167);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-05-10 20:12:50', 2, 72, 145);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-04-02 08:38:11', 1, 197, 199);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-10-31 18:47:09', 1, 21, 141);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-05-11 01:22:09', 1, 151, 151);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-09-25 12:24:50', 1, 142, 142);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-09-28 02:09:20', 2, 194, 2);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-05-30 11:32:09', 2, 167, 162);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-08-20 22:20:35', 2, 26, 174);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-09-22 10:43:49', 1, 103, 21);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2013-12-29 10:36:28', 1, 194, 155);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-02-24 09:08:47', 1, 193, 81);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-07-28 08:49:52', 1, 78, 8);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-03-03 19:35:17', 1, 68, 34);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2013-12-24 04:12:36', 2, 119, 160);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-11-07 09:57:10', 1, 11, 33);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-03-21 04:31:08', 1, 23, 149);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2013-12-07 20:56:57', 1, 197, 75);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-03-11 04:15:29', 1, 60, 84);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-05-13 09:21:19', 2, 1, 195);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-06-18 19:40:07', 2, 126, 36);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-05-25 21:54:39', 1, 72, 194);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-08-11 14:21:56', 2, 33, 116);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-05-01 11:45:46', 1, 50, 27);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-10-05 22:38:56', 1, 131, 131);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2013-12-24 18:40:16', 2, 125, 191);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-08-20 02:45:02', 2, 56, 55);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-02-03 21:49:50', 2, 172, 30);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-01-31 01:13:53', 1, 164, 129);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-11-10 18:16:44', 2, 147, 111);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-11-07 01:23:07', 1, 65, 73);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-11-17 13:03:30', 1, 33, 161);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-01-03 11:44:15', 1, 156, 174);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2013-12-20 01:43:11', 1, 122, 58);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-09-21 08:53:03', 2, 163, 62);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2013-12-16 02:56:42', 2, 21, 120);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-11-13 21:58:28', 1, 130, 101);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2013-12-31 09:48:59', 2, 68, 142);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-10-18 15:08:36', 2, 60, 55);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2013-11-27 11:18:39', 1, 34, 79);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-03-27 04:32:23', 1, 98, 156);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-10-04 20:55:14', 1, 52, 156);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-04-17 23:03:43', 1, 161, 9);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-05-22 16:14:18', 1, 163, 56);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-06-28 05:25:45', 2, 116, 181);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2013-11-26 20:42:38', 1, 84, 68);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-01-12 13:22:04', 2, 126, 106);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-11-06 21:50:08', 1, 29, 151);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-02-02 16:26:56', 2, 70, 10);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-02-20 07:00:23', 2, 182, 47);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-06-12 12:27:45', 1, 100, 54);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-05-11 08:52:06', 2, 96, 62);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-04-15 06:43:53', 1, 38, 109);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-05-27 06:57:14', 1, 18, 51);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-03-08 20:27:18', 2, 122, 146);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-07-06 00:50:38', 1, 1, 171);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-04-02 21:45:08', 1, 186, 2);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-02-01 22:07:23', 2, 74, 69);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2013-12-08 10:37:24', 2, 64, 110);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-04-20 10:26:33', 2, 124, 198);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-11-01 12:59:38', 2, 146, 24);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-02-15 04:45:37', 2, 19, 131);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-09-02 15:37:10', 2, 179, 73);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-07-23 19:57:28', 1, 132, 68);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-03-14 01:42:15', 2, 78, 113);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-08-22 09:35:17', 2, 54, 71);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-07-05 12:31:30', 2, 68, 17);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-09-14 07:21:11', 2, 131, 67);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-10-28 18:08:41', 2, 23, 149);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-11-20 03:11:21', 2, 98, 17);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2013-12-21 04:07:14', 2, 95, 165);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-06-22 22:23:06', 2, 168, 1);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-05-30 09:14:28', 2, 110, 127);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-06-09 22:11:46', 2, 108, 99);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-09-07 05:49:05', 1, 1, 127);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-09-11 06:57:20', 1, 100, 156);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-09-16 22:27:03', 1, 32, 151);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-08-23 00:44:03', 2, 103, 141);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-01-27 21:13:36', 1, 45, 180);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-04-22 08:19:27', 1, 78, 198);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2013-12-04 23:49:39', 1, 114, 13);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-11-07 11:38:23', 1, 197, 134);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-03-09 02:30:39', 2, 179, 105);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-02-13 16:51:37', 1, 42, 52);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-10-29 09:01:28', 2, 100, 89);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2013-12-25 04:43:07', 2, 104, 37);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-03-03 22:03:54', 2, 55, 167);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-05-26 08:26:44', 1, 19, 192);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-05-14 07:27:37', 1, 111, 136);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-03-06 12:45:09', 2, 105, 56);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-06-14 16:14:38', 1, 57, 94);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-10-15 20:41:34', 1, 59, 119);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-05-16 07:40:45', 1, 71, 28);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-11-03 04:20:12', 1, 169, 72);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-01-24 11:46:50', 2, 184, 105);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-02-05 17:13:19', 1, 147, 176);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-03-14 04:51:04', 2, 52, 150);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-01-21 09:11:36', 1, 134, 116);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-07-29 15:28:49', 1, 30, 97);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-09-08 01:57:13', 2, 49, 167);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-02-14 07:08:28', 1, 186, 200);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-11-18 03:41:06', 1, 58, 18);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-05-03 14:55:14', 1, 62, 121);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-08-19 19:33:59', 2, 15, 77);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-11-06 14:20:52', 2, 63, 10);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-06-22 17:39:05', 1, 86, 28);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-06-07 05:00:30', 2, 175, 97);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-02-26 00:47:45', 1, 44, 40);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2013-12-17 22:26:32', 2, 147, 29);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-08-05 03:38:08', 2, 2, 72);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-10-22 16:20:03', 2, 143, 13);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-09-07 19:20:40', 2, 71, 119);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-03-05 08:47:50', 1, 87, 103);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-11-01 16:02:22', 2, 17, 179);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-08-03 19:45:10', 2, 140, 103);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-06-27 12:02:29', 1, 168, 147);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-07-26 14:08:43', 1, 193, 192);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2013-12-25 17:46:38', 2, 27, 45);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-07-23 05:21:11', 2, 199, 197);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-02-19 20:11:31', 2, 80, 127);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-02-11 17:54:47', 2, 146, 109);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-08-14 09:42:06', 2, 34, 8);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-05-14 07:01:00', 1, 124, 146);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-07-13 04:21:14', 1, 147, 188);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-07-16 06:00:01', 2, 121, 20);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-09-28 05:53:43', 1, 177, 145);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-05-19 00:59:36', 2, 87, 98);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-07-22 21:24:30', 2, 109, 171);
insert into booking (date_time, fk_court, fk_person_booker, fk_person_invited) values ('2014-08-16 19:43:00', 2, 59, 25);


-- #################################################
--              TRIGGERS
-- #################################################
USE [TCCEFY]
GO
/****** Object:  Trigger [dbo].[chekBooking]    Script Date: 08.12.2014 11:03:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery22.sql|0|0|C:\Users\Etienne.FORNEY\Documents\SQL Server Management Studio\SQLQuery22.sql
ALTER TRIGGER [dbo].[chekBooking] ON [dbo].[booking]
AFTER INSERT
AS
BEGIN
	DECLARE @booker INT
	DECLARE @invited INT
	DECLARE @guest NVARCHAR
	SET @booker = (SELECT fk_person_booker FROM inserted)
	SET @invited = (SELECT fk_person_invited FROM inserted)
	SET @guest = (SELECT guest FROM inserted)
	-- Check for 3 people on the same court
	IF (@booker != 0 AND @invited != 0 AND LEN(@guest) != 0) BEGIN
		PRINT 'Can not have 3 people on a court.'
		ROLLBACK;
	END
	-- Check if the people exist
	DECLARE @person1 INT
	SET @person1 = (SELECT id_person FROM person WHERE id_person = @booker)
	DECLARE @person2 INT
	SET @person1 = (SELECT id_person FROM person WHERE id_person = @invited)
	IF (@person1 = NULL OR @person2 = NULL) BEGIN
		PRINT 'A person does not exist.'
		ROLLBACK;
	END
	-- Check court availability
	DECLARE @reservation_time DATETIME
	SET @reservation_time = (SELECT date_time FROM inserted)
	IF (EXISTS(SELECT date_time FROM booking WHERE date_time = @reservation_time)) BEGIN
		PRINT 'There already is a reservation at this date and time'
		ROLLBACK;
	END

END
