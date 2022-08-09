import pandas as pd

pd.set_option('display.max_columns', 20)


# Qualitativa ordinal = Classe social, escolaridade
# Qualitativa nominal = Sexo, estado civil
# Quantitativa discreta = Numero de computadores em casa, numero de animais de estimação em casa, Numero de filhos
# Quantitativa continua = Idade, Peso, Altura

nome = []
csocial = []
escolaridade = []
sexo = []
ecivil = []
ncomp = []
nanimal = []
nfilhos = []
idade = []
peso = []
altura = []

i = 0

while i < 5:
    nomei = input('Escreva seu nome: ')
    csociali = input('Com qual classe social você se identifica mais: \nA) Baixa \nB) Media \nC) Alta\n')
    escolaridadei = input('Qual seu grau de esocolaridade: \nA) Ensino fundamental incompleto\nB) Ensino fundamental completo '
                          '\nC) Ensino médio incompleto \nD) Ensino médio completo \nE) Ensino superior incompleto '
                          '\nF) Ensino superior completo\n')
    sexoi = input('Qual sexo você se identifica: \nA) Masculino \nB) Feminino \nC) Outro\n')
    ecivili = input('Qual seu estado civil: \nA) Solteiro \nB) Namorando \nC) Casado \nD) Divorciado \nE) Outro\n')
    ncompi = input('Quantos computadores tem na sua casa: ')
    nanimali = input('Quantos animais de estimação tem em sua casa: ')
    nfilhosi = input('Quantos filhos você tem: ')
    idadei = input('Qual sua idade: ')
    pesoi = input('Qual seu peso medio (em kg): ')
    alturai = input('Qual sua altura: ')

    #Nome
    nome.append(nomei)

    #Classe social
    if csociali == 'A':
        csocial.append('Baixa')
    elif csociali == 'B':
        csocial.append('Media')
    elif csociali == 'C':
        csocial.append('Alta')
    else:
        'Opção invalida'

    #Escolaridade
    if escolaridadei == 'A':
        escolaridade.append('Ensino fundamental incompleto')
    elif escolaridadei == 'B':
        escolaridade.append('Ensino fundamental completo')
    elif escolaridadei == 'C':
        escolaridade.append('Ensino medio incompleto')
    elif escolaridadei == 'D':
        escolaridade.append('Ensino medio completo')
    elif escolaridadei == 'E':
        escolaridade.append('Ensino superior incompleto')
    elif escolaridadei == 'F':
        escolaridade.append('Ensino superior completo')
    else:
        'Opção invalida'

    #Sexo
    if sexoi == 'A':
        sexo.append('Masculino')
    elif sexoi == 'B':
        sexo.append('Feminino')
    elif sexoi == 'E':
        sexo.append('Outro')
    else:
        'Opção invalida'

    #Estado civil
    if ecivili == 'A':
        ecivil.append('Solteiro')
    elif ecivili == 'B':
        ecivil.append('Namorando')
    elif ecivili == 'C':
        ecivil.append('Casado')
    elif ecivili == 'D':
        ecivil.append('Divorciado')
    elif ecivili == 'E':
        ecivil.append('Outro')
    else:
        'Opção invalida'

    #Numero computadores
    ncomp.append(ncompi)

    #Numero animais estimaçao
    nanimal.append(nanimali)

    #Numero de filhos
    nfilhos.append(nfilhosi)

    #Idade
    idade.append(idadei)

    #Peso
    peso.append(pesoi)

    #Altura
    altura.append(alturai)

    print(i)
    i = i + 1

df = pd.DataFrame(list(zip(nome,csocial,escolaridade,sexo,ecivil,ncomp,nanimal,nfilhos,idade,peso,altura)),
                  columns=['Nome', 'Classe social', 'Escolaridade', 'Sexo', 'Estado civil',
                           'Numero computaores', 'Numero animais estimação', 'Numero filhos', 'Idade', 'Peso', 'Altura'])

df.to_csv('Dados_modeloRv2', index=False)