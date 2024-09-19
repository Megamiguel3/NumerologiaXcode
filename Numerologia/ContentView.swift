//
//  ContentView.swift
//  Numerologia
//
//  Created by Miguel Tinoco on 16/09/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var nome_proprio:String = ""
    @State var apelidoPai:String = ""
    @State var apelidoMae:String = ""
    @State var results: String = ""
    @State var dataNascimento:Date = Date.now
    
    @State var tabela: [(Int,[String])] = []
    
    func fillTabela() {
        tabela.append((1,["A","J","S"]));
        tabela.append((2,["B","K","T"]));
        tabela.append((3,["C","L","U"]));
        tabela.append((4,["D","M","V"]));
        tabela.append((5,["E","N","X"]));
        tabela.append((6,["F","O","W"]));
        tabela.append((7,["G","P","Y"]));
        tabela.append((8,["H","Q","Z"]));
        tabela.append((9,["I","R"]));
    }
    
    func updateField() {
        
    }
    
    func loadNumerologia() {
        //Load Tabela
        fillTabela();
        
        //Get input
        let formatter = DateFormatter()
        formatter.dateFormat = "ddMMyyyy"
        var date = formatter.string(from:dataNascimento as Date);
        results = nome_proprio + "\u{00a0}" + apelidoMae + "\u{00a0}" + apelidoPai + "\n";
        results = results + dataNascimento.description + "\n";
        
        results = results + "Numerologia START! \n \n"
        //Process Numerologia
        //Número da Vida
        var placer = date;
        while placer.count > 1 {
            var numVidaPlacer = 0;
            //lógica se for Número Mestre
            if placer.count == 2 {
                if placer.first == placer.last {
                    break;
                }
            }
            
            for char in placer {
                var adder = Int(String(char));
                numVidaPlacer = numVidaPlacer + (adder ?? 0);
            }
            
            placer = String(numVidaPlacer);
            print("placer: " + placer);
        }
        var numVida = placer
        results = results + "Número de Vida: " + String(numVida) + "\n"
        
        //Primeiro Som
        var index = date.index(date.startIndex,offsetBy: 2)
        placer = date.substring(to: index)
        while placer.count > 1 {
            var primeiroSomPlacer = 0;
            //lógica se for Número Mestre
            if placer.count == 2 {
                if placer.first == placer.last {
                    break;
                }
            }
            
            for char in placer {
                var adder = Int(String(char));
                primeiroSomPlacer = primeiroSomPlacer + (adder ?? 0);
            }
            
            placer = String(primeiroSomPlacer);
            
        }
        var primeiroSom = placer
        results = results + "Primeiro Som: " + String(primeiroSom) + "\n";
        
        //Caminho da Vida
        index = date.index(date.startIndex,offsetBy: 4)
        placer = date.substring(to: index)
        while placer.count > 1 {
            var caminhoVidaPlacer = 0;
            //lógica se for Número Mestre
            if placer.count == 2 {
                if placer.first == placer.last {
                    break;
                }
            }
            
            for char in placer {
                var adder = Int(String(char));
                caminhoVidaPlacer = caminhoVidaPlacer + (adder ?? 0);
            }
            
            placer = String(caminhoVidaPlacer);
            
        }
        var caminhoVida = placer
        results = results + "Caminho de Vida: " + String(caminhoVida) + "\n";
        
        //Ciclos de Vida
        //Primeiro Ciclo
        var primeiroCiclo = 36 - (Int(caminhoVida) ?? 0)
        results = results + "Primeiro ciclo de vida até aos " + String(primeiroCiclo) + " anos\n";
        
        //Vibração Primeiro Ciclo
        results = results + "Vibração do Primeiro Ciclo: " + String(caminhoVida) + "\n";
        
        //Segundo Ciclo
        var segundoCiclo = primeiroCiclo + 9
        results = results + "Segundo ciclo de vida, dos " + String(primeiroCiclo);
        results = results + " até os " + String(segundoCiclo) + " anos\n";
        
        
        
        //Vibração Segundo Ciclo
        index = date.index(date.startIndex,offsetBy: 4)
        placer = date.substring(from: index)
        while placer.count > 1 {
            var vibrSegundoCiclo = 0;
            //lógica se for Número Mestre
            if placer.count == 2 {
                if placer.first == placer.last {
                    break;
                }
            }
            
            for char in placer {
                var adder = Int(String(char));
                vibrSegundoCiclo = vibrSegundoCiclo + (adder ?? 0);
            }
            
            placer = String(vibrSegundoCiclo);
            
        }
        var vibrSegundoCiclo = placer
        results = results + "Vibração do Segundo Ciclo: " + String(vibrSegundoCiclo) + "\n";
        
        //Terceiro Ciclo
        var terceiroCiclo = segundoCiclo + 9
        results = results + "Terceiro ciclo de vida, dos " + String(segundoCiclo);
        results = results + " até os " + String(terceiroCiclo) + " anos\n";
        
        //Vibração Terceiro Ciclo
        var vibr3ciclo = caminhoVida + vibrSegundoCiclo
        if vibr3ciclo.count > 1 {
            placer = vibr3ciclo
            while placer.count > 1 {
                var vibrTerceiroCiclo = 0;
                //lógica se for Número Mestre
                if placer.count == 2 {
                    if placer.first == placer.last {
                        break;
                    }
                }
                for char in placer {
                    var adder = Int(String(char));
                    vibrTerceiroCiclo = vibrTerceiroCiclo + (adder ?? 0);
                }
                
                placer = String(vibrSegundoCiclo);
            }
        }
        var TrdCicleVibr = placer;
        results = results + "Vibração do Terceiro Ciclo: " + String(TrdCicleVibr) + "\n";
        
        //Quarto Ciclo
        results = results + "Quarto ciclo de vida, a partir dos " + String(terceiroCiclo) + " anos\n";
        
        //Vibração Quarto Ciclo
        index = date.index(date.startIndex, offsetBy: 2);
        placer = date.substring(from: index);
        while placer.count > 1 {
            var vibrTerceiroCiclo = 0;
            //lógica se for Número Mestre
            if placer.count == 2 {
                if placer.first == placer.last {
                    break;
                }
            }
            for char in placer {
                var adder = Int(String(char));
                vibrTerceiroCiclo = vibrTerceiroCiclo + (adder ?? 0);
            }
            
            placer = String(vibrTerceiroCiclo);
        }
        var vibrQuartoCiclo = placer
        results = results + "Vibração do Quarto Ciclo: " + String(vibrQuartoCiclo) + "\n";
        
        //Ano Pessoal
        //logica para ver se é ano atual ou o anterior
        var dataAtual = formatter.string(from:Date.now as Date);
        index = date.index(date.startIndex,offsetBy: 4);
        var diaMes = Int(date.substring(to: index)) ?? 0;
        var currentDiaMes = Int(dataAtual.substring(to: index)) ?? 0;
        
        var ano = Int(date.substring(to: index)) ?? 0;
        if currentDiaMes > diaMes {
            //go back 1 year
            ano = ano - 1;
        }
        
        placer = String(caminhoVida) + String(ano)
        while placer.count > 1 {
            var anoPessoal = 0;
            //lógica se for Número Mestre
            if placer.count == 2 {
                if placer.first == placer.last {
                    break;
                }
            }
            for char in placer {
                var adder = Int(String(char));
                anoPessoal = anoPessoal + (adder ?? 0);
            }
            
            placer = String(anoPessoal);
        }
        
        results = results + "Ano Pessoal: " + String(vibrQuartoCiclo) + "\n";
        
        //Karam Kryia
        results = results + "Karam Kryia:\n"
        
        //Primeiro Quadrante
        index = date.index(date.startIndex,offsetBy: 6);
        placer = date.substring(from: index);
        while placer.count > 1 {
            var firstQ = 0;
            //lógica se for Número Mestre
            if placer.count == 2 {
                if placer.first == placer.last {
                    break;
                }
            }
            for char in placer {
                var adder = Int(String(char));
                firstQ = firstQ + (adder ?? 0);
            }
            
            placer = String(firstQ);
        }
        var firstQuad = placer;
        results = results + "Primeiro Quadrante: " + String(firstQuad) + "\n";
        
        //Segundo Quadrante
        results = results + "Segundo Quadrante: " + String(primeiroSom) + "\n";
        
        //Terceiro Quadrante
        index = date.index(date.startIndex,offsetBy: 4);
        var diaMesStr = date.substring(to: index);
        index = diaMesStr.index(date.startIndex,offsetBy: 2);
        var mesStr = diaMesStr.substring(from:index);
        
        placer = mesStr;
        while placer.count > 1 {
            var thirdQ = 0;
            //lógica se for Número Mestre
            if placer.count == 2 {
                if placer.first == placer.last {
                    break;
                }
            }
            for char in placer {
                var adder = Int(String(char));
                thirdQ = thirdQ + (adder ?? 0);
            }
            
            placer = String(thirdQ);
        }
        var thirdQuad = placer;
        results = results + "Terceiro Quadrante: " + String(thirdQuad) + "\n";
        
        //Quarto Quadrante
        var forthQuad = vibrSegundoCiclo;
        results = results + "Quarto Quadrante: " + String(forthQuad) + "\n";
        
        //Quinto Quadrante
        var fifthQuad = numVida;
        results = results + "Quinto Quadrante: " + String(fifthQuad) + "\n\n";
        
        //Análise do nomes
        let nomes_proprios = nome_proprio.split(separator: " ");
        
        //Alicerce
        var firstName = nomes_proprios[0];
        index = firstName.index(firstName.startIndex,offsetBy:1);
        placer = firstName.substring(to: index);
        var firstDigitNum = 0;
        
        for item in tabela {
            if (item.1.contains(placer)){
                firstDigitNum = firstDigitNum + item.0;
                break;
            }
        }
        
        results = results + "Alicerce: " + String(firstDigitNum) + "\n";
        
        //Essência
        placer = String(firstName);
        var essenceNum = 0;
        for char in placer {
            for item in tabela {
                if (item.1.contains(String(char).uppercased())){
                    essenceNum = essenceNum + item.0;
                    break;
                }
            }
        }
        placer = String(essenceNum);
        while placer.count > 1 {
            var essenceQ = 0;
            //lógica se for Número Mestre
            if placer.count == 2 {
                if placer.first == placer.last {
                    break;
                }
            }
            for char in placer {
                var adder = Int(String(char));
                essenceQ = essenceQ + (adder ?? 0);
            }
            
            placer = String(essenceQ);
        }
        var essenceStr = placer;
        results = results + "Essência: " + String(essenceStr) + "\n";
        
        //Afetivo/Criativo
        if (nomes_proprios.count > 1) {
            var afetivoCriativoNum = 0;
            for char in nomes_proprios[1] {
                for item in tabela {
                    if (item.1.contains(String(char).uppercased())){
                        afetivoCriativoNum = afetivoCriativoNum + item.0;
                        break;
                    }
                }
            }
            
            placer = String(afetivoCriativoNum);
            while placer.count > 1 {
                var afetivoQ = 0;
                //lógica se for Número Mestre
                if placer.count == 2 {
                    if placer.first == placer.last {
                        break;
                    }
                }
                for char in placer {
                    var adder = Int(String(char));
                    afetivoQ = afetivoQ + (adder ?? 0);
                }
                
                placer = String(afetivoQ);
            }
            var afetivoStr = placer;
            results = results + "Afetivo/Criativo: " + String(afetivoStr) + "\n";
        } else {
            results = results + "Afetivo/Criativo Inexistente\n"
        }
        
        //Traço Dominante Personalidade
        var all_names: [String] = [];
        for nome in nomes_proprios {
            all_names.append(String(nome));
        }
        all_names.append(apelidoMae);
        all_names.append(apelidoPai);
        var tracoDominanteNum = 0;
        index = apelidoMae.index(apelidoMae.startIndex,offsetBy: 1);
        for name in all_names {
            var digit = name.substring(to: index);
            for item in tabela {
                if (item.1.contains(String(digit).uppercased())){
                    tracoDominanteNum = tracoDominanteNum + item.0;
                    break;
                }
            }
        }
        
        placer = String(tracoDominanteNum);
        while placer.count > 1 {
            var tracoQ = 0;
            //lógica se for Número Mestre
            if placer.count == 2 {
                if placer.first == placer.last {
                    break;
                }
            }
            for char in placer {
                var adder = Int(String(char));
                tracoQ = tracoQ + (adder ?? 0);
            }
            
            placer = String(tracoQ);
        }
        var tracoDominanteStr = placer;
        results = results + "Traço Dominante: " + String(tracoDominanteStr) + "\n";
        
        //Alma
        var vowels: [String] = ["A","E","I","O","U","a","e","i","o","u"];
        var almaNum = 0;
        for name in all_names {
            for char in name {
                if vowels.contains(String(char)) {
                    print("Char: \(String(char))")
                    for item in tabela {
                        if item.1.contains(String(char).uppercased()){
                            almaNum = almaNum + item.0;
                            break;
                        }
                    }
                }
                
            }
        }
        placer = String(almaNum);
        while placer.count > 1 {
            var almaQ = 0;
            //lógica se for Número Mestre
            if placer.count == 2 {
                if placer.first == placer.last {
                    break;
                }
            }
            for char in placer {
                var adder = Int(String(char));
                almaQ = almaQ + (adder ?? 0);
            }
            
            placer = String(almaQ);
        }
        var almaStr = placer;
        results = results + "Alma: " + String(almaStr) + "\n";
        
        //Realização
        var realizacaoNum = 0;
        for name in all_names {
            for char in name {
                if !vowels.contains(String(char)) {
                    for item in tabela {
                        if (item.1.contains(String(char))){
                            realizacaoNum = realizacaoNum + item.0;
                            break;
                        }
                    }
                }
                
            }
        }
        placer = String(realizacaoNum);
        while placer.count > 1 {
            var realQ = 0;
            //lógica se for Número Mestre
            if placer.count == 2 {
                if placer.first == placer.last {
                    break;
                }
            }
            for char in placer {
                var adder = Int(String(char));
                realQ = realQ + (adder ?? 0);
            }
            
            placer = String(realQ);
        }
        var realStr = placer;
        results = results + "Realização: " + String(realStr) + "\n";
        
        //Expressão/Personalidade
        var expressaoNum = 0;
        for name in all_names {
            for char in name {
                for item in tabela {
                    if (item.1.contains(String(char))){
                        expressaoNum = expressaoNum + item.0;
                        break;
                    }
                }
                
            }
        }
        placer = String(expressaoNum);
        while placer.count > 1 {
            var expressQ = 0;
            //lógica se for Número Mestre
            if placer.count == 2 {
                if placer.first == placer.last {
                    break;
                }
            }
            for char in placer {
                var adder = Int(String(char));
                expressQ = expressQ + (adder ?? 0);
            }
            
            placer = String(expressQ);
        }
        var expressaoStr = placer;
        results = results + "Expressão/Personalidade: " + String(expressaoStr) + "\n";
        
        //Herança da Mãe
        var herancaMaeNum = 0;
        for char in apelidoMae {
            for item in tabela {
                if (item.1.contains(String(char))){
                    herancaMaeNum = herancaMaeNum + item.0;
                    break;
                }
            }
        }
        placer = String(herancaMaeNum);
        while placer.count > 1 {
            var herancaMaeQ = 0;
            //lógica se for Número Mestre
            if placer.count == 2 {
                if placer.first == placer.last {
                    break;
                }
            }
            for char in placer {
                var adder = Int(String(char));
                herancaMaeQ = herancaMaeQ + (adder ?? 0);
            }
            
            placer = String(herancaMaeQ);
        }
        var herancaMaeStr = placer;
        results = results + "Herança da Mãe: " + String(herancaMaeStr) + "\n";

        //Herança do Pai
        var herancaPaiNum = 0;
        for char in apelidoPai {
            for item in tabela {
                if (item.1.contains(String(char))){
                    herancaPaiNum = herancaPaiNum + item.0;
                    break;
                }
            }
        }
        placer = String(herancaPaiNum);
        while placer.count > 1 {
            var herancaPaiQ = 0;
            //lógica se for Número Mestre
            if placer.count == 2 {
                if placer.first == placer.last {
                    break;
                }
            }
            for char in placer {
                var adder = Int(String(char));
                herancaPaiQ = herancaPaiQ + (adder ?? 0);
            }
            
            placer = String(herancaPaiQ);
        }
        var herancaPaiStr = placer;
        results = results + "Herança da Pai: " + String(herancaPaiStr) + "\n";
        //Herança Total
        placer = String(herancaMaeNum + herancaPaiNum);
        while placer.count > 1 {
            var herancaTotalQ = 0;
            //lógica se for Número Mestre
            if placer.count == 2 {
                if placer.first == placer.last {
                    break;
                }
            }
            for char in placer {
                var adder = Int(String(char));
                herancaTotalQ = herancaTotalQ + (adder ?? 0);
            }
            
            placer = String(herancaTotalQ);
        }
        var herancaTotalStr = placer;
        results = results + "Herança Total: " + String(herancaTotalStr) + "\n\n";
        
    }
    var body: some View {
        VStack {
            Text("Numerologia App").frame(width: 150,height:55).padding()
            TextField("Insira aqui o(s) nome(s) próprio(s)", text: $nome_proprio).padding()
            TextField("Insira aqui o apelido materno", text: $apelidoMae).padding()
            TextField("Insira aqui o apelido paterno", text: $apelidoPai).padding()
            DatePicker("Selecione a data de nascimento",selection: $dataNascimento,displayedComponents: [.date]).padding()
            
            Button(action: {loadNumerologia()}) {
                Text("Carregar Numerologia")
            }
            ScrollView {
                Text(results).padding().lineLimit(nil)
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
