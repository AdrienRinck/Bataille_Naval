{Algorithme Bataille_navale;
CONST 
	MAX=20;
Type EnregPlace=ENREGISTREMENT
	 Ligne:entier
	 Colonne:Caractere
FINENREGISTREMENT
TYPE Tabl=Tableau [1..MAX] d'EnregPlace
TYPE TabBool=Tableau [1..MAX] d'Entier
TYPE Bateau=ENREGISTREMENT
	 TabBateau:Tableau [1..MAX] d'EnregPlace
TYPE Fotte=ENREGISTREMENT
	 TabFlotte:Tableau [1..MAX] de Bateau 
TYPE TypeBateau=Tableau [1..MAX] de Bateau 
TYPE TypFlotte=Tableau[1..MAX] de Flotte

PROCEDURE PlaceBateau (var T1:Tabl, var TBateau:TypeBateau, var TableauFlotte:TypFlotte, var compteuraide:integer)
VAR 
	i,j,k,compteur,nombre,NombreCase:entier 
DEBUT 
	ECRIRE("JOUEUR 1 : ")
	ECRIRE("Combien de bateau voulez vous creer ? ")
	LIRE(NOMBRE)
	i<-1
	j<-1
	compteur<-0
	compteuraide<-0
	Repeter 
		k<-1
		ECRIRE("Combien de cases fait le bateau"&j)
		Lire(NombreCase)
			REPETER
				ECRIRE("Entrez la case numero"&k&" comme ceci : A3 ")
				LIRE(T1[i].Colonne,T1[i].Ligne)
				TBateau[i].TabBateau[i].Ligne<-T1[i].Ligne 
				TBateau[i].TabBateau[i].Colonne<-T1[i].Colonne
				TableauFlotte[i].TabFlotte[i].TabBateau[i].Colonne<-TBateau[i].TabBateau[i].Colonne 
				TableauFlotte[i].TabFlotte[i].TabBateau[i].Ligne<-TBateau[i].TabBateau[i].Ligne
				i<-i+1
				k<-k+1
				compteur<-compteur+1
				compteuraide<-compteuraide+1
			JUSQU'A compteur=NombreCase 
		j<-j+1
		compteur<-0
	JUSQU'A j=Nombre+1
FINPROCEDURE
	
PROCEDURE PlaceBateauJ2 (var T2:Tabl, var TBateauJ2:TypeBateau, var TableauFlotteJ2:TypFlotte, var compteuraide:integer)
VAR 
	i,j,k,compteur,nombre,NombreCase:entier 
DEBUT 
	ECRIRE("JOUEUR 2 : ")
	ECRIRE("Combien de bateau voulez vous creer ? ")
	LIRE(NOMBRE)
	i<-1
	j<-1
	compteur<-0
	compteuraide<-0
	Repeter 
		k<-1
		ECRIRE("Combien de cases fait le bateau"&j)
		Lire(NombreCase)
			REPETER
				ECRIRE("Entrez la case numero"&k&" comme ceci : A3 ")
				LIRE(T2[i].Colonne,T2[i].Ligne)
				TBateauJ2[i].TabBateau[i].Ligne<-T2[i].Ligne 
				TBateauJ2[i].TabBateau[i].Colonne<-T2[i].Colonne
				TableauFlotteJ2[i].TabFlotte[i].TabBateau[i].Colonne<-TBateauJ2[i].TabBateau[i].Colonne 
				TableauFlotteJ2[i].TabFlotte[i].TabBateau[i].Ligne<-TBateauJ2[i].TabBateau[i].Ligne
				i<-i+1
				k<-k+1
				compteur<-compteur+1
				compteuraide<-compteuraide+1
			JUSQU'A compteur=NombreCase 
		j<-j+1
		compteur<-0
	JUSQU'A j=Nombre+1
FINPROCEDURE

FONCTION FctBool (var TableauFlotteJ2:TypeFlotte, var ATKFlotteJ2:TabBool, var compteuraide:integer) : Booleen
VAR 
	i,Nbin:entier
	NbChar:Caractere
DEBUT 
	ECRIRE("JOUEUR 1 : ENTREZ LA CASE A LAQUELLE VOUS VOULEZ ATTAQUEZ")
	LIRE(NbChar,Nbin)
	POUR i<-1 A Compteuraide FAIRE 
		Si TableauFlotteJ2[i].TabFlotte[i].TabBateau[i].Colonne=NbChar) ET (TableauFlotteJ2[i].TabFlotte[i].TabBateau[i].Ligne.Ligne=Nbin ALORS
			FctBool<-VRAI 
			ATKFlotteJ2<-FctBool 
		FINSI 
		SINON FctBool<-FALSE 
	FINPOUR 
FINFONCTION

FONCTION FctBool2 (var TableauFlotte:TypeFlotte, var ATKFlotte:TabBool, var compteuraide:integer) : Booleen
VAR 
	i,Nbin:entier
	NbChar:Caractere
DEBUT 
	ECRIRE("JOUEUR 2 : ENTREZ LA CASE A LAQUELLE VOUS VOULEZ ATTAQUEZ")
	LIRE(NbChar,Nbin)
	POUR i<-1 A Compteuraide FAIRE 
		Si TableauFlotte[i].TabFlotte[i].TabBateau[i].Colonne=NbChar) ET (TableauFlotte[i].TabFlotte[i].TabBateau[i].Ligne.Ligne=Nbin ALORS
			FctBool<-VRAI 
			ATKFlotte<-FctBool 
		FINSI 
		SINON FctBool<-FALSE 
	FINPOUR 
FINFONCTION

VAR 
	T1: Tableau [1..MAX] d'Enregplace
	T2: Taleau [1..MAX] d'Enregplace
	ATKFlotte: Tableau [1..MAX] de Booleen
	ATKFlotteJ2: Tableau [1..MAX] de Booleen
	TBateau: Tableau [1..MAX] de Bateau
	TableauFlotte: Tableau [1..MAX] de Flotte
	TbateauJ2: Tableau [1..MAX] de Bateau 
	TableauFlotteJ2: Tableau [1..MAX] de Flotte 
	compteuraide:entier
DEBUT 
	PlaceBateau(T1,TBateau,TableauFlotte,compteuraide)
	PlaceBateauJ2(T2,TBateauJ2,TableauFlotteJ2,compteuraide)
	REPETER 
		fctBool(T2,ATKFlotteJ2,compteuraide)
		fctBool2(T1,ATKFlotte,compteuraide)
	JUSQU'A ATKFlotte[i]<-VRAI ET ATKFlotteJ2[i]<-VRAI 
FIN }
Program Bataille_navale;
uses crt;
CONST 
	 MAX=20;
Type EnregPlace=Record
	 Ligne:integer;
	 Colonne:Char;
End;
Type Tabl=Array[1..MAX] of EnregPlace;
Type TabBool=Array [1..MAX] of Boolean;



Type Bateau=Record
	 TabBateau:Array [1..MAX] of EnregPlace;
End;
Type Flotte=Record
	 TabFlotte:Array[1..MAX] of Bateau;
End;
Type TypBateau=Array[1..MAX] of Bateau;
Type TypFlotte=Array[1..MAX] of Flotte;

Procedure PlaceBateau (var T1:Tabl; var TBateau:TypBateau; var TableauFlotte:TypFlotte; var compteuraide:integer);
VAR
	i,j,k,compteur,nombre,NombreCase:integer;
BEGIN
	Clrscr;
	Write('JOUEUR 1 : ');
	Writeln('Combien de bateau voulez vous creer ? ');
	Readln(nombre);
	i:=1;
	j:=1;
	compteur:=0;
	compteuraide:=0;
	Repeat
		Begin
			k:=1;
			Writeln('Combien de cases fait le bateau ',j);
			Readln(NombreCase);
				Repeat
					Begin
						Clrscr;
						Writeln('Entrez la case numero ',k,' comme ceci : A3');
						Readln(T1[i].Colonne,T1[i].Ligne);
						TBateau[i].TabBateau[i].Ligne:=T1[i].Ligne;
						TBateau[i].TabBateau[i].Colonne:=T1[i].Colonne;
						TableauFlotte[i].TabFlotte[i].TabBateau[i].Colonne:=TBateau[i].TabBateau[i].Colonne;
						TableauFlotte[i].TabFlotte[i].TabBateau[i].Ligne:=TBateau[i].TabBateau[i].Ligne;
						i:=i+1;
						k:=k+1;
						compteur:=compteur+1;
						compteuraide:=compteuraide+1;
					End;
				Until compteur=NombreCase;
				j:=j+1;
				compteur:=0;
		End;
	Until j=Nombre+1;

						
						For i:=1 to compteuraide do
							Begin
								Write(TableauFlotte[i].TabFlotte[i].TabBateau[i].Colonne,TableauFlotte[i].TabFlotte[i].TabBateau[i].Ligne,'   ');
							End;
		Readln;
END;

Procedure PlaceBateauJ2 (var T2:Tabl; var TBateauJ2:TypBateau; var TableauFlotteJ2:TypFlotte; var compteuraide:integer);
VAR
	i,j,k,compteur,nombre,NombreCase:integer;
BEGIN
	Clrscr;
	Write('JOUEUR 2 : ');
	Writeln('Combien de bateau voulez vous créer ? ');
	Readln(nombre);
	i:=1;
	j:=1;
	compteur:=0;
	compteuraide:=0;
	Repeat
		Begin
			k:=1;
			Writeln('Combien de cases fait le bateau ',j);
			Readln(NombreCase);
				Repeat
					Begin
						Clrscr;
						Writeln('Entrez la case du bateau numero ',k,' comme ceci : A3');
						Readln(T2[i].Colonne,T2[i].Ligne);
						TBateauJ2[i].TabBateau[i].Ligne:=T2[i].Ligne;
						TBateauJ2[i].TabBateau[i].Colonne:=T2[i].Colonne;
						TableauFlotteJ2[i].TabFlotte[i].TabBateau[i].Colonne:=TBateauJ2[i].TabBateau[i].Colonne;
						TableauFlotteJ2[i].TabFlotte[i].TabBateau[i].Ligne:=TBateauJ2[i].TabBateau[i].Ligne;
						i:=i+1;
						k:=k+1;
						compteur:=compteur+1;
						compteuraide:=compteuraide+1;
					End;
				Until compteur=NombreCase;
				j:=j+1;
				compteur:=0;
		End;
	Until j=Nombre+1;
END;
Function FctBool (var T2:Tabl; var TBateauJ2:TypBateau; var TableauFlotteJ2:TypFlotte; var ATKFlotteJ2:TabBool; var compteuraide:integer) :Boolean;
var
		i,Nbin:integer;
        NbChar:Char;
Begin
	writeln('JOUEUR 1 : Veuillez entrer la case a laquelle vous voulez attaquer : ');
	readln(NbChar,Nbin);
	For i:=1 to compteuraide do
		begin
			If (TableauFlotteJ2[i].TabFlotte[i].TabBateau[i].Colonne=NbChar) AND (TableauFlotteJ2[i].TabFlotte[i].TabBateau[i].Ligne.Ligne=Nbin then
                Begin
					FctBool:=TRUE;
					ATKFlotteJ2[i]:=FctBool;
                End
         	Else FctBool:=FALSE;
		End;
	For i:=1 to compteuraide do
		Begin
			Write(ATKFlotteJ2[i]);
		End;
	Readln;
End;

Function FctBool2 (var T1:Tabl; var TBateau:TypBateau; var TableauFlotte:TypFlotte; var ATKFlotteJ1:TabBool; var compteuraide:integer) :Boolean;
Var
		i,Nbin:integer;
        NbChar:Char;
Begin
	writeln('JOUEUR 2 : Veuillez entrer la case a laquelle vous voulez attaquer : ');
	Readln(NbChar,Nbin);
	For i:=1 to compteuraide do
		begin
			If (TableauFlotte[i].TabFlotte[i].TabBateau[i].Colonne=NbChar) AND (TableauFlotte[i].TabFlotte[i].TabBateau[i].Ligne=Nbin) then
                begin
					FctBool2:=TRUE;
					ATKFlotteJ1[i]:=FctBool2;
                End
				Else FctBool2:=FALSE;
		End;
	For i:=1 to compteuraide do
		Begin
			Write(ATKFlotteJ1[i]);
		End;
	Readln;
End;

VAR
	T1: Array [1..MAX] of EnregPlace;
	T2: Array [1..MAX] of EnregPlace;
	ATKFlotteJ1: Array[1..MAX] of Boolean;
	ATKFlotteJ2 : Array [1..MAX] of Boolean;
    TBateau: Array [1..MAX] of Bateau;
    TableauFlotte: Array [1..MAX] of Flotte;
	TBateauJ2: Array [1..MAX] of Bateau;
	TableauFlotteJ2: Array [1..MAX] of Flotte;
	compteuraide:integer;
BEGIN
	PlaceBateau(T1,TBateau,TableauFlotte,compteuraide);
	PlaceBateauJ2(T2,TBateauJ2,TableauFlotteJ2,compteuraide);
	Repeat
	begin
		fctBool(T2,ATKFlotteJ2,compteuraide);
		fctBool2(T1,ATKFlotteJ1,compteuraide);
	End;
	until (ATKFlotteJ1[1]=TRUE AND ATKFlotteJ1[2]=TRUE AND ATKFlotteJ1[3]=TRUE AND ATKFlotteJ1[4]=TRUE AND ATKFlotteJ1[5]=TRUE) XOR (ATKFlotteJ2[1]=TRUE AND ATKFlotteJ2[2]=TRUE AND ATKFlotteJ2[3]=TRUE AND ATKFlotteJ2[4]=TRUE AND ATKFlotteJ2[5]=TRUE);
	Readln;
END.
