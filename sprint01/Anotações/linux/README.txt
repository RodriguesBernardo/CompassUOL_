
# Sprint 1 - Linux
        Comandos Gerais importantes do linux

rmidr - apaga somente diretorios 

rm - apaga tudo 

cp -r   -Para copiar todos arquivos da pasta(Para fazer backup)

sudo apt-get autoremove (Limepeza no sistema não invasivo)

apt-cache search $nomedoApp (Procura aplicativo)

tail-f   - Debug de Logs

grep $palavra $documento     - Procura palavras e frases, similar ao Ctrl + F

find | find -empty (encontra somente arquivos vazios) | find -type d (diretorio) | find -type f (files)    -Acha aquivos e diretorios

locate      - Encontra arquivos facilmente, contras: não é atualizado constantemente, porém para arquivos antigos é a melhor maneira de econtrar

which   ex(which nano)  - Localiza a raiz do comando 

        Editor de texto
nano   - editor de texto

alt + /   - vai até o final do arquivo 

alt + \   - vai para o topo do arquivo

alt + g   - vai direto para a linha desejada

alt + r   - faz a substituição, se clicar ctrl + a substitui tudo (similar ao ctrl D do vscode)  

        Gerencimanto de Usuarios
adduser $nomedoUsuario                           -adiciona novo usuario 

userdel --remove $nome do usuario                -remove novo usuario

usermod -c '$novoNome  $nomesetado               -Troca o nome que aparece na hora do login

usermod -l $nome -d /home/$nome -m $nomeantigo   -Troca o nome nos arquivos do linux

usermod -L $nomedoUsuario                        -Bloqueia o usuario

usermod -U $nomedoUsuario                        -Desbloqueia o usuario


        Gerenciamento de Grupos
getent group      - Lista de todos group
groupadd -g $id  $nomedogroup              - Criar novo grupo

groupdel $nomedogroup                      - Deletar o grupo selecionado

usermod -a -G $nomedogroup $nomedoUser     - Adiciona o usuario ao grupo selecionado

gpasswd -d $nomedoUser  $nomedoGrupo

        Gerenciamento de Permissões
chmod 777 $nomedoarquivo   -Todos tem todas permissões (NUNCA)

chmod 400 $nomedoarquivo   -Só o dono tem permissão de leitura

chmod 764 $nomedoarquivo   -Dono tem todas as permissões, grupo pode ler e alterar, restante demais somente ler

chmod 755 $nomedoarquivo   -Dono tem todas as permissões, grupo e outros somente ler e executar

chmod 000 $nomedoarquivo   -Ninguem mais tem permissão para nada, só com sudo ou root

chmod o=x                  -Concedendo permissão de executar para Outros

chmod a=rwx                -Concedendo todas as permissões a todos

chmod g-w                  -Removendo permissões de escrever para grupos

chmod u+rw                 -Concedendo permissão de ler e escrever para user/owner

chown $nomedoUser $nomedoarquivo    - Troca o dono do arquivo  

chgrp $nomedoUser $nomedoArquivo    - Altera o grupo do arquivo 



        Gerenciamento de Redes

ping $if ou nome - Verifica conectividade com o ip desejado

netstat -a       - Verifica conexões ativas

ifconfig         - Verifica dados de redes do pc

nslookpup $url   - Dados da Url 

tcpdump          - Verifica conexões TCP


        Compactação e descompactação de arquivos e diretórios
tar -czvf  $nomedoarquivocompactado.tar.gz $nomedoarquivoparacompactar         - Compactar arquivos

tar -xzvf  $nomedoarquivo.tar.gz


        Dicas importantes

!!   - executa o comando anterior

sudo su  - transfora em superUser

passwd - trocar senha do usuario

ctrl + shift + c - Copia 

ctrl + shift + v - Cola

history - historico de comandos digitados no terminal 
