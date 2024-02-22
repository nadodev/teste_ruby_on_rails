// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener('DOMContentLoaded', function () {
    var textoTextarea = document.getElementById('texto');
    var contadorCaracteres = document.getElementById('contador');

    function atualizarContagem() {
      var contadorAtual = textoTextarea.value.length;
      contadorCaracteres.textContent = contadorAtual;

      // Adiciona ou remove a classe dependendo da contagem de caracteres
      if (contadorAtual < 100) {
        contadorCaracteres.classList.remove('verde');
        contadorCaracteres.classList.add('vermelho');
      } else {
        contadorCaracteres.classList.remove('vermelho');
        contadorCaracteres.classList.add('verde');
      }
    }

    // Atualiza a contagem quando a página é carregada
    atualizarContagem();
    textoTextarea.addEventListener('input', function () {
      atualizarContagem();
    });
  });