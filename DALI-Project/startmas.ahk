; Avvia il file batch e attende che il processo di avvio sia completato
Run, startmas.bat
Sleep, 40000
; Mostra il valore generato in una Message Box
;MsgBox, Seleziona sempre la finestra attiva per inviare i comandi correttamente.



;-----------------------------------------------
Random, RandomWaitTime, 1000, 2000
Sleep, %RandomWaitTime%

;-------------------------------------------------------

Sleep, 5000
Send, centralina.{Enter}
Send, user.{Enter}
Send, send_message(on, user).{Enter}
Sleep, 10000
Send, centralina.{Enter}
Send, user.{Enter}
Send, send_message(timer_taglio_giornaliero, user).{Enter}


Iterations := 2

; Inizia il ciclo e ripeti il codice X volte
Loop, %Iterations%
{
    ; Genera un tempo di attesa casuale 
    Random, RandomWaitTime, 8000, 10000
    Sleep, %RandomWaitTime%

    Random, CommandChoice, 1, 3

    ; In base al valore generato, scegli l'agente
    If (CommandChoice = 1)
    {
		Send, rasaerba.{Enter}
		Send, user.{Enter}
		Send, send_message(tagliocompletato, user).{Enter}
    }
    Else If (CommandChoice = 2)
    {
		Send, rasaerba1.{Enter}
		Send, user.{Enter}
		Send, send_message(tagliocompletato, user).{Enter}
    }
    Else If (CommandChoice = 3)
    {
		Send, rasaerba2.{Enter}
		Send, user.{Enter}
		Send, send_message(tagliocompletato, user).{Enter}
    }
	
}

Sleep, 10000
Send, sensore_meteo_video.{Enter}
Send, user.{Enter}
Send, send_message(pioggia, user).{Enter}


Sleep, 13000
Send, sensore_meteo_video.{Enter}
Send, user.{Enter}
Send, send_message(sole, user).{Enter}

Loop, 2
{
		;-------------------------
		Sleep, 4000
		Cicli_0 := 2
		; Inizia il ciclo e ripeti il codice X volte
		Loop, %Cicli_0%
		{
			
			; Genera tempi di attesa che possono essere ridotti o aumentati a piacere.
			Random, RandomWaitTime, 8000, 10000
			Sleep, %RandomWaitTime%
			
			Random, CommandChoice, 1, 3

			If (CommandChoice = 1)
			{
				Send, rasaerba.{Enter}
				Send, user.{Enter}
				Send, send_message(tagliocompletato, user).{Enter}
			}
			Else If (CommandChoice = 2)
			{
				Send, rasaerba1.{Enter}
				Send, user.{Enter}
				Send, send_message(tagliocompletato, user).{Enter}
			}
			Else If (CommandChoice = 3)
			{
				Send, rasaerba2.{Enter}
				Send, user.{Enter}
				Send, send_message(tagliocompletato, user).{Enter}
			}
			
		}


		;------------------------------------------
		Sleep, 4000
		Cicli_1 := 5
		areaNome := vuoto
		Loop, %Cicli_1%
		{

			Random, RandomT, 2000, 4000
			Sleep, %RandomT%
			
			Random, CommandChoice, 1, 6

			If (CommandChoice = 1)
			{
				Send, sensore_meteo_video.{Enter}
				Send, user.{Enter}
				Send, send_message(presenzaumana(area1), user).{Enter}
			}
			Else If (CommandChoice = 2)
			{
				Send, sensore_meteo_video.{Enter}
				Send, user.{Enter}
				Send, send_message(presenzaumana(area2), user).{Enter}
			}
			Else If (CommandChoice = 3)
			{
				Send, sensore_meteo_video.{Enter}
				Send, user.{Enter}
				Send, send_message(presenzaumana(area3), user).{Enter}
			}
			Else If (CommandChoice = 4)
			{
				Send, sensore_meteo_video.{Enter}
				Send, user.{Enter}
				Send, send_message(presenzaumana(area4), user).{Enter}
			}
			Else If (CommandChoice = 5)
			{
				Send, sensore_meteo_video.{Enter}
				Send, user.{Enter}
				Send, send_message(presenzaumana(area5), user).{Enter}
			}
			Else 
			{
				Send, sensore_meteo_video.{Enter}
				Send, user.{Enter}
				Send, send_message(presenzaumana(area6), user).{Enter}
			}

			
		}
		Sleep, 8000
		Send, sensore_meteo_video.{Enter}
		Send, user.{Enter}
		Send, send_message(area_libera, user).{Enter}
	

}

Sleep, 5000
Send, centralina.{Enter}
Send, user.{Enter}
Send, send_message(proponi_se_disponibilii_taglio_fast, user).{Enter}