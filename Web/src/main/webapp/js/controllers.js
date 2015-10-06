'use strict';

queComemosApp.controller('panelLoginController', [ '$scope', '$state', '$http',
		function($scope, $state, $http) {
			$scope.login = function() {
				$http.post('/login', {
					nombre : $scope.nombre,
				// pass : $scope.pass
				}).success(function(data) {
					document.cookie = "usuario=" + data.nombre;

					$state.go('PanelHome');
				});
			}
		} ]);

queComemosApp.controller('panelUsuarioController', [ '$scope', '$state',
		'queComemosService', 'usuarioData',
		function($scope, $state, queComemosService, usuarioData) {

			var usuario = usuarioData.data.usuario
			$scope.usuario = usuario
			$scope.preferenciaAlimenticia = usuario.preferenciasAlimenticias
			$scope.recetasFavoritas = usuario.favoritas
			$scope.imcColor = usuarioData.data.color
			$scope.irAHome = function() {
				$state.go('PanelHome')
			}
		} ]);

queComemosApp.controller('panelConsultasController', [ '$scope', '$state',
		function($scope, $state) {
			$scope.irAHome = function() {
				$state.go('PanelHome')
			}
		} ]);

queComemosApp.controller('panelMonitoreoController', [ '$scope', '$state',
		'$http', 'queComemosService', 'monitoreoData',
		function($scope, $state, $http, queComemosService, monitoreoData) {

			var recetas = monitoreoData.data.recetas
			$scope.lista_recetas = monitoreoData.data.recetas
			$scope.recetas_a_mostar = monitoreoData.data.mostrando;
			$scope.cantidadConsultas = monitoreoData.data.cantidadConsultas

			// ****
			$scope.isHome = false
			// ****

			$scope.irAHome = function() {
				$state.go('PanelHome')
			};

		} ])

queComemosApp.controller('panelRecetaController', [ '$scope', '$state',
		'queComemosService', 'recetaSeleccionadaData',
		function($scope, $state, queComemosService, recetaSeleccionadaData) {
			$scope.recetaSeleccionada = recetaSeleccionadaData.data;

			$scope.verListaRecetas = function() {
				$state.go('PanelHome')
			}
		} ]);

queComemosApp.controller('panelHomeController', [
		'$scope',
		'$state',
		'$http',
		'queComemosService',
		'recetasData',
		function($scope, $state, $http, queComemosService, recetasData) {

			var recetas = recetasData.data.recetas
			$scope.lista_recetas = recetasData.data.recetas

			$scope.recetaSeleccionada = recetas[0] // SE PUEDE ELIMINAR?S
			$scope.recetas_a_mostar = recetasData.data.mostrando;

			$scope.verReceta = function() {
				$state.go('PanelReceta');
			};

			$scope.verConsultas = function() {
				$state.go('PanelConsultas');
			}

			$scope.verUsuario = function() {
				$state.go('PanelUsuario')
			}

			$scope.verMonitoreo = function() {
				$state.go('PanelMonitoreo')
			}

			// ****
			$scope.isHome = true
			// ****

			$scope.seleccionarReceta = function(receta) {
				queComemosService.setRecetaSeleccionada(receta).success(
						function() {
							$scope.verReceta();
						});
			};
		} ]);
