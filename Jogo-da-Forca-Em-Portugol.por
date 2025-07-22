programa {

  inclua biblioteca Texto --> txt
  
  funcao inicio() {
    
    cadeia palavra_escolhida = "banana"
    cadeia letras_corretas = ""
    cadeia letras_erradas = ""

    inteiro vidas = 7
    logico game_over = falso
    cadeia palpite

    faca {

      cadeia display = ""
      
      // Montar o display da palavra com acertos e "_" para ocultar
      para (inteiro i = 0; i < txt.numero_caracteres(palavra_escolhida); i++) {
        caracter letra = txt.obter_caracter(palavra_escolhida, i)

        se (contem_caractere(letras_corretas, letra)) {
          display += letra
        } senao {
          display += " _ "
        }
      }

      mostrar_forca(vidas)

      escreva("\nPalavra: ", display)
      escreva("\nVidas restantes: ", vidas)
      escreva("\nLetras erradas: ", letras_erradas)
      escreva("\nDigite uma letra: ")
      leia(palpite)

      caracter letra_palpite = txt.obter_caracter(palpite, 0)

      se (contem_caractere(letras_corretas, letra_palpite) ou contem_caractere(letras_erradas, letra_palpite)) {
        escreva("Você já tentou essa letra.\n")
      }

      logico acertou = falso

      // Verifica se a letra está na palavra
      para (inteiro i = 0; i < txt.numero_caracteres(palavra_escolhida); i++) {
        se (txt.obter_caracter(palavra_escolhida, i) == letra_palpite) {
          acertou = verdadeiro
        }
      }

      se (acertou) {
        letras_corretas += letra_palpite
        escreva("Boa! Você acertou uma letra.\n")
      } senao {
        letras_erradas += letra_palpite
        vidas -= 1
        escreva("Ops! Letra errada.\n")
      }

      // Verifica se venceu
      logico venceu = verdadeiro
      para (inteiro i = 0; i < txt.numero_caracteres(palavra_escolhida); i++) {
        caracter letra = txt.obter_caracter(palavra_escolhida, i)
        se (contem_caractere(letras_corretas, letra) == falso) {
          venceu = falso
        }
      }

      se (venceu) {
        escreva("\nParabéns! Você venceu! A palavra era: ", palavra_escolhida)
        game_over = verdadeiro
      } senao se (vidas <= 0) {
        escreva("\nFim de jogo! Você perdeu. A palavra era: ", palavra_escolhida)
        game_over = verdadeiro
      }

    } enquanto(game_over == falso)

  }

  funcao logico contem_caractere(cadeia texto, caracter letra) {
    para(inteiro i = 0; i < txt.numero_caracteres(texto); i++) {
      se (txt.obter_caracter(texto, i) == letra) {
        retorne verdadeiro
      }
    }

    retorne falso

  }

  funcao mostrar_forca(inteiro vidas) {
    escreva("\n +---+\n")

    se (vidas <= 6) escreva(" |   O\n") senao escreva(" |\n")
    se (vidas <= 5) {
      se (vidas <= 4) escreva(" |  /|") senao escreva(" |   |\n")
      se (vidas <= 3) escreva("\\\n") senao escreva("\n")
    } senao escreva(" |\n")
    se (vidas <= 2) escreva(" |  /") senao escreva(" |\n")
    se (vidas <= 1) escreva(" \\\n") senao escreva("\n")

    escreva(" |\n=====\n")
  }
}
