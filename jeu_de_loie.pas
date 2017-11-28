{ALGORITHME : jeu_de_l_oie
//BUT : Reproduire le jeu de l'oie avec pascal, en laissant dans un premier temps le
//joueur choisir le nombre de case qu'il souhaite avancer, puis rendre les dés
//aléatoires.
//ENTREE : le nombre de case à avancer dans le premier cas et le passage du tour dans l'autre.
//SORTIE : le numéro de la case et son potentiel effet

const
	derniereCase <- 66 : ENTIER
	caseMort <- 58 :ENTIER
var
	place, de1, de2 : ENTIER

DEBUT
	ECRIRE "Bienvenu dans le jeu de l'oie"
	place <- 0
	TANT QUE (place <> derniereCase) FAIRE
		TANT QUE (de1 > 6) OU (de1 < 1) FAIRE //On veut que l'utilisateur ne donne qu'un nombre compris entre 1 et 6 sinon on lui redemande
			ECRIRE"Entrez le premier dé, il doit être compris entre 1 et 6"
			LIRE de1
		FINTANTQUE
		TANT QUE (de2 > 6) OU (de2 < 1) FAIRE
			ECRIRE "Entrez le deuxieme dé, il doit être compris entre 1 et 6"
			LIRE de2
		FINTANTQUE
		place <- place + de1 + de2
		ECRIRE place
		SI (place MOD 9 = 0) ET (place <> 63) ET (place < 66) ALORS //S'il tombe sur une case multiple de 9 sauf 63, son déplacement est doublé
			place <- place + de1 + de2
			ECRIRE place
		FINSI
		SI (place = caseMort) ALORS//s'il tombe sur la case mort, il retourne au départ
			place <- 0
			ECRIRE place
		FINSI
		SI (place > derniereCase) ALORS //Si le lancer du dé dépasse la dernière case, le joueur doit retourner du nombre de case restante en arrière
			place <- derniereCase - (place - derniereCase)
			ECRIRE place
		FINSI
	FINTANTQUE
	ECRIRE "Vous avez gagné"
FIN}

program jeu_de_l_oie;

uses crt;

const
	derniereCase = 66;
	caseMort = 58;
var
	place, de1, de2 : integer;

begin
	clrscr;
	writeln('Bienvenu dans ke jeu de l''oie');
	place := 0;
	while (place <> derniereCase) do
	begin
		while (de1 > 6) or (de1 < 1) do //On veut que l'utilisateur ne donne qu'un nombre compris entre 1 et 6 sinon on lui redemande
		begin
			writeln('Entrez le premier de, il doit être compris entre 1 et 6');
			readln(de1);
		end;
		while (de2 > 6) or (de2 < 1) do
		begin
			writeln('Entrez le deuxieme dé, il doit être compris entre 1 et 6');
			readln(de2);
		end;
		place := place + de1 + de2;
		writeln(place);
		if (place MOD 9 = 0) and (place <> 63) and (place < 66) then //S'il tombe sur une case multiple de 9 sauf 63, son déplacement est doublé
		begin
			place := place + de1 + de2;
			writeln(place);
		end;
		if (place = caseMort) then//s'il tombe sur la case mort, il retourne au départ
		begin
			place := 0;
			writeln(place);
		end;
		if (place > derniereCase) then //Si le lancer du dé dépasse la dernière case, le joueur doit retourner du nombre de case restante en arrière
		begin	
			place := derniereCase - (place - derniereCase);
			writeln(place);
		end;
		de1 := 0;
		de2 := 0;
	end;
	writeln('Vous avez gagné');
	readln;
end.
	