$(document)
		.ready(
				function() {
					console.log('Dieseño parecido al plugin JQuery steps hecho a mano por el alumno.');
					var numeroFields = $('fieldset')['length'] - 1;
					var fieldsets = $("fieldset");

					/*
					 * los fieldsets son los pasos de formulario
					 */
					var currentField;
					if (fieldsets[0] !== null) {
						currentField = 0;
						for (var a = numeroFields; a > 0; a--) {
							fieldsets[a].setAttribute('class', 'hidden');
						}
						/*---------------------------Generacion de los indicadores de los pasos---------------------------*/
						if ($(window).width() > 500) {
							for (var a = 0; a <= numeroFields; a++) {
								($('<div class="indicador_paso" style="background:#EEEEEE;-webkit-border-radius:.5em;-moz-border-radius:.5em;padding:.5em;border-radius:.5em;width:'
										+ (parseInt(100 / (numeroFields + 1)) - 5)
										+ '%";>'
										+ fieldsets[a].firstElementChild.textContent
										+ '</div>'))
										.appendTo($('.indicador_pasos')[0]);
							}
						} else {
							for (var a = 0; a <= numeroFields; a++) {
								($('<div class="indicador_paso" style="background:#EEEEEE;-webkit-border-radius:.5em;-moz-border-radius:.5em;padding:.5em;border-radius:.5em;">'
										+ fieldsets[a].firstElementChild.textContent
										+ '</div>'))
										.appendTo($('.indicador_pasos')[0]);
							}
						}
					}
					var indicadores = $(".indicador_paso");
					if ($(indicadores[0]) != null) {
						$(indicadores[0]).css("background", "#E84C3D");
						$(indicadores[0]).css("color", "whitesmoke");
					}

					/*----------------------funcionalidad de los botones de paginacion--------------------------*/
					var btn_anterior = $(".btn_anterior");
					var btn_siguiente = $(".btn_siguiente");

					btn_anterior[0].setAttribute('class', 'btn disabled');
					btn_anterior[0].addEventListener("click", function() {
						if (currentField > 0) {
							fieldsets[currentField].setAttribute('class',
									'hidden');
							fieldsets[currentField - 1].setAttribute('class',
									'');
							currentField--;
							$(indicadores[currentField]).css("background",
									"#E84C3D");
							$(indicadores[currentField + 1]).css("background",
									"#f28c82");
						}
						if (currentField == 0) {
							btn_anterior[0].setAttribute('class',
									'boton btn disabled');
						} else if (currentField != numeroFields) {
							btn_siguiente.val('Siguiente');
						}
					})
					btn_siguiente[0].addEventListener("click", function() {
						if (currentField == numeroFields
								&& btn_siguiente[0].value == 'Enviar') {
							$('.enviar')[0].click();
						}
						if (currentField < numeroFields) {
							fieldsets[currentField].setAttribute('class',
									'hidden');
							fieldsets[currentField + 1].setAttribute('class',
									'');
							currentField++;
							$(indicadores[currentField]).css("background",
									"#E84C3D");
							$(indicadores[currentField]).css("color",
									"whitesmoke");
							$(indicadores[currentField - 1]).css("background",
									"#f28c82");
						}
						if (currentField == numeroFields) {
							btn_siguiente.val('Calcula');
						} else if (currentField > 0) {
							btn_anterior[0].setAttribute('class', 'btn');
						}
					})
				});