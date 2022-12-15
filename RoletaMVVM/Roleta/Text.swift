//
//  Text.swift
//  Roleta
//
//  Created by Ricardo Massaki on 14/12/22.
//

import Foundation

//numberOfRowsInSection - determina a quantidade de células.

//VARIÁVEL COMPUTADA -> ELAS retornam o valor que assumem (Int, Boll, Doble). é usada qdo não preciso especficar nenhum parametro.

//MARK: - Decodable
// Decodifica, ou seja, passa (transforma) um tipo de json em um objeto SWIFT.

//MARK: - Encodable
// Codifica, ou seja, passa (transforma) um tipo de dado no Swift em json.

//MARK: - Codable
// Codifica e decodifica.

//TYPEALIAS - É qdo substituimos uma nomenclatura por outra. nada mais são que apelidos para tipos de dados, literalmente: type = tipo, alias = apelido.
//func normal -> func mostraPreço(item: String) -> Float {
//Código aqui }
//func com TYPEALIAS -> typealias Produto = String
//typealias PreçoReal = Float
//func mostraPreço(item: Produto) -> PreçoReal {
    //Código aqui }



//MVC - MODEL VIEW CONTROLLER (MODELO, VISUALIZAÇÃO E CONTROLADOR)
//MVC é um padrão de arquitetura, que permite estruturar nosso código, dividindo em camadas interconectadaas, mantendo responsabilidades separadas entre as 3 camadas.
//MVC é uma arquitetura QUE JÁ NÃO É MAIS MUITO USADA, POR SER ULTRAPASSADA.

//Model (modelo) os dados do sistema. é formado pelos objetos que "modelam o nosso negócio, representam  informações e encapsulam os "dados do nosso aplicativo". a Model, encapsula a lógica de negócios e os dados.
//ex: sistema bancário -> as contas e os clientes.
//em uma agenda -> os contatos.

//View (visualizacão) é a interface do usuário, A responsabilidade da View é definir a aparência ou estrutura que o usuário vê na tela.
//A View se liga ao ViewModel, através da propriedade DataContext que é setada para a classe ViewModel correspondente à aquela View.
    //ex: camada de View, UIButton, UILabel, UItableView, etc.

//Controller (controlador)  lógica do negócio. é a camada que age como intermediária entre a MODEL e a VIEW. Os objetos que compõem essa camada, são responsáveis por comunicar à VIEW qdo uma mudança na MODEL acontecer.Assim ela se atualiza. Também são responsáveis por modificar a MODEL qdo alguma mudança é feita na VIEW, pela ação do usuário, como por exemplo, se o usuário inseriu um texto na TEXTFIELD por exemplo.




//MVVM - MODEL VIEW VIEWMODEL
//MVVM é um tipo de arquitetura, que permite estruturar, organizar nosso código no projeto.
//A vantagem é que o nosso projeto fica mais organizado, separado nas camadas.

//Model (modelo) os dados do sistema. é formado pelos objetos que "modelam o nosso negócio, representam  informações e encapsulam os "dados do nosso aplicativo". a Model, encapsula a lógica de negócios e os dados.
//ex: sistema bancário -> as contas e os clientes.
//em uma agenda -> os contatos.

//View (visualizacão) é a interface do usuário, A responsabilidade da View é definir a aparência ou estrutura que o usuário vê na tela.
//A View se liga ao ViewModel, através da propriedade DataContext que é setada para a classe ViewModel correspondente à aquela View.
    //ex: camada de View, UIButton, UILabel, UItableView, etc.

//VIEWMODEL - Todo o processamento fica na ViewModel, ela disponibiliza para a View uma lógica de apresentação. A ViewModel é peça importante, pq é ela quem vai coordenar as iterações da View com o Model. A ViewModel é uma classe não visual, que expõe para a View uma lógica de apresentação.

//A camada Model não conhece a View( Camada de apresentação ) e vice-versa, na verdade a View conhece a ViewModel e se comunica com ela através do mecanismo de binding.



//--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X-

//REQUISIÇÃO -> é qdo estamos batendo lá na API
//LEITURA DE DADO -> é qdo o nosso dado já está dentro do aplicativo, como o nosso JSON.

//MÉTODOS SÍNCRONOS -> São funções que dão a resposta de imediato. vc chama ela, ela executa e já te dá a resposta. ex: função de soma.

//MÉTODOS ASSÍNCRONOS -> São funções que por vários motivos(net lenta por exemplo), não vão dar uma resposta de imediato Ex: qdo vc realiza uma requisição.



////--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X-

//MOCK -> é uma simulação onde estamos criando uma versão "falsa" dele, um teste - Ele retorna alguns dados falsos e também pode verificar se um determinado método foi chamado.
//pode nos permitir escrever testes com muito mais facilidade e executá-los mais rapidamente de uma maneira mais previsível.

//json -> é um formato baseado em texto padrão para representar dados estruturados. É usado para enviar alguns dados do servidor para o cliente, para que possam ser exibidos em uma página da Web. ele trabalha no formato de um dicionário. Sempre vai ter "CHAVE" e "VALOR". O valor pode ser qlq coisa, um array, double, int, floot, um objeto. já uma UIImage, uiLabel não pode, pq não retorna.
//da onde vem o jason? -> vem do backend.
//o dev cria o mock na mão para poder trabalhar, caso ocorra algum problema, como falta de conexào por exemplo. e o arquivo está "MOCKADO" dentro do projeto.
//E utilizamos o arquivo pra que? -> PARA REALIZAR TESTES! 



////--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X-


//Exemplos de Arquitetura MVVM

// Tela Home

//HomeVIewController.stoyboardou HomeVIewController.xib ou HomeScreen(ViewCode)
//HomeVIewController
//HomeVIewModel
//HomeService -> OBS: Caso seja necessário -> Essa classe deve conter (HomeServiceProtocol -> OBS: Depende da arquitetura.

// Tela Detail

//DetailViewController.storyboard ou DetailViewController.xib ou DetailScreem(ViewCode)
//DetailViewController
//DetailVIewModel
//DetailService -> OBS: Caso seja necessário -> Essa classe deve conter (DetailServiceProtocol -> OBS: Depende da arquitetura.


////--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X-




